package org.example.twinprojectblog.post;


import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.naver.NcpObjectStorageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
public class PostController {


    private final PostService postService;



    @PostMapping("/posts")
    public String createPost(
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("file") MultipartFile file) {

        PostDto postDto = new PostDto();
        postDto.setTitle(title);
        postDto.setContent(content);

        postService.savePost(postDto, file);

        return "Post created successfully";
    }



}
