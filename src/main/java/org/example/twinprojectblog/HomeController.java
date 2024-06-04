package org.example.twinprojectblog;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping("/login")
    public String login() {
        return "login";
    }


    @GetMapping("write")
    public String write(
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        if (username.equals("admin")){
            return "write-form";
        }
        return "/";
    }

}
