package org.example.twinprojectblog.login;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class LoginController {
    private final UserMapperInter userMapperInter;

    @Transactional
    @PostMapping("/login/action")
    public ResponseEntity<Map<String, String>> loginAction(
            @RequestParam("login_username") String login_username,
            @RequestParam("login_password") String login_password,
            HttpServletRequest request
    ) {
        int check = userMapperInter.checkUser(login_username, login_password);

        if (check == 1) {

            int userId = userMapperInter.findUserIdByUsername(login_username);
            HttpSession session = request.getSession();
            session.setAttribute("user", login_username);
            session.setAttribute("userId", userId);

            session.setMaxInactiveInterval(60 * 60); //1시간 지속
            System.out.println(check + " " + login_username + " " + login_password);
            return ResponseEntity.ok(Map.of("message", "Success"));
        }

        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(Map.of("message", "Invalid username or password"));
    }

    @PostMapping("/login/regist")
    public String registerAction(
            @RequestParam("username") String username,
            @RequestParam("email") String email,
            @RequestParam("password") String password
    ) {
        UserDto userDto = UserDto.builder()
                .username(username)
                .email(email)
                .password(password)
                .build();
        userMapperInter.insert(userDto);

        return "redirect:/login";
    }


    @GetMapping("/logout")
    public String logout(
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }
}
