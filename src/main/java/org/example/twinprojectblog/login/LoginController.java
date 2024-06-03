package org.example.twinprojectblog.login;

import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.data.dto.UserDto;
import org.example.twinprojectblog.data.mapper.UserMapperInter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class LoginController {
    private final UserMapperInter userMapperInter;

    @PostMapping("/login/action")
    @ResponseBody
    public Map<String, Object> loginAction(
            @RequestParam("login_username") String login_username,
            @RequestParam("login_username") String login_password,
            HttpServletRequest request
    ) {
        int check = userMapperInter.checkUser(login_username, login_password);
        if (check == 1) {

            HttpSession session = request.getSession();
            session.setAttribute("user", login_username);
            session.setMaxInactiveInterval(60 * 60); //1시간 지속
            return Map.of("message", "Success");
        }


        return Map.of("message", "Invalid username or password");
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
}
