package org.example.twinprojectblog.home;

import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.post.PostDto;
import org.example.twinprojectblog.post.PostMapperInter;
import org.example.twinprojectblog.post.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeListController {
    private final PostMapperInter postMapperInter;
    private final PostService postService;

    @GetMapping("/")
    public String home(Model model) {
        List<PostDto> list = postMapperInter.getNewPosts();
        model.addAttribute("posts", list);

        List<PostDto> popularPosts = postMapperInter.getPopularPosts();
        model.addAttribute("popularPosts", popularPosts);

        int postCount = postMapperInter.getPostsCount();
        model.addAttribute("maxPage", Math.ceil(postCount/4.0));


        return "index";
    }

    @GetMapping("/list")
    @ResponseBody
    public List<PostDto> getList(
            @RequestParam("index")int index
    ) {
        return postService.getPostsPage(index);
    }

    @GetMapping("/search")
    public String search(
            @RequestParam("search")String search,
            Model model
    ) {
        List<PostDto> postDtoList = postMapperInter.getPostsBySearch(search);
        model.addAttribute("posts", postDtoList);

        List<PostDto> popularPosts = postMapperInter.getPopularPosts();
        model.addAttribute("popularPosts", popularPosts);
        int postCount = postMapperInter.getPostsCount();
        model.addAttribute("maxPage", Math.ceil(postCount/4.0));


        return "search";
    }

}
