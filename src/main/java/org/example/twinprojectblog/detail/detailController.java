package org.example.twinprojectblog.detail;

import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.conmment.CommentDto;
import org.example.twinprojectblog.conmment.CommentMapperInter;
import org.example.twinprojectblog.post.PostDto;
import org.example.twinprojectblog.post.PostMapperInter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class detailController {

    private final PostMapperInter postMapperInter;

    @GetMapping("detail")
    public String detail(
            @RequestParam("id") int id,
            Model model
    ) {
        postMapperInter.updateViewCount(id);
        model.addAttribute("post", postMapperInter.getPostById(id));

        List<PostDto> popularPosts = postMapperInter.getPopularPosts();
        model.addAttribute("popularPosts", popularPosts);
        int postCount = postMapperInter.getPostsCount();
        model.addAttribute("maxPage", Math.ceil(postCount/4.0));

        return "detail";
    }

}
