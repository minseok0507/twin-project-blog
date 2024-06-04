package org.example.twinprojectblog.home;

import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.post.PostDto;
import org.example.twinprojectblog.post.PostMapperInter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeListController {
    private final PostMapperInter postMapperInter;

    @GetMapping("/")
    public String home(Model model) {
        List<PostDto> list = postMapperInter.getNewPosts();
        model.addAttribute("posts", list);

        List<PostDto> popularPosts = postMapperInter.getPopularPosts();
        model.addAttribute("popularPosts", popularPosts);


        return "index";
    }
}
