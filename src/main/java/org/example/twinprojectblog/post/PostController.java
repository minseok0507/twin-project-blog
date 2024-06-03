package org.example.twinprojectblog.post;



import lombok.RequiredArgsConstructor;

import org.example.twinprojectblog.naver.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;

    @PostMapping("/posts")
    public ResponseEntity<String> createPost(
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("file") MultipartFile file) {

        try {
            PostDto postDto = new PostDto();
            postDto.setTitle(title);
            postDto.setContent(content);

            postService.savePost(postDto, file);

            return ResponseEntity.ok("Post created successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to create post");
        }
    }
}
