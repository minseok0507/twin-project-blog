package org.example.twinprojectblog;

import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.post.PostDto;
import org.example.twinprojectblog.post.PostMapperInter;
import org.example.twinprojectblog.post.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final PostMapperInter postMapperInter;

    @GetMapping("/login")
    public String login() {
        return "login";
    }


    @GetMapping("write")
    public String write(
            HttpServletRequest request,
            Model model
    ) {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        if (username.equals("admin")){
            List<PostDto> popularPosts = postMapperInter.getPopularPosts();
            model.addAttribute("popularPosts", popularPosts);
            int postCount = postMapperInter.getPostsCount();
            model.addAttribute("maxPage", Math.ceil(postCount/4.0));


            return "write-form";
        }
        return "/";
    }

}
