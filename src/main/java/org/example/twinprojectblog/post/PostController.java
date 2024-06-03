package org.example.twinprojectblog.post;



import lombok.RequiredArgsConstructor;

import org.example.twinprojectblog.naver.NcpObjectStorageService;
import org.example.twinprojectblog.postdelete.PostDeleteMapperInter;
import org.example.twinprojectblog.postdelete.PostDeleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;
    private final PostDeleteService postDeleteService;
    private final PostDeleteMapperInter postDeleteMapperInter;

    //게시글 생성
    @PostMapping("/posts")
    public ResponseEntity<String> createPost(
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("file") MultipartFile file) {
        System.out.println(file);
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


    //게시글 수정
    @PutMapping("/posts/{postId}")
    public ResponseEntity<String> updatePost(
            @PathVariable Integer postId,
            @RequestParam String title,
            @RequestParam String content,
            @RequestParam String imageUrl
    ) {
        if(!postDeleteMapperInter.findImageUrlByPostId(postId).equals(imageUrl))
        postDeleteService.deleteImageByPostId(postId);
        postService.updatePost(postId, title, content, imageUrl);

        return new ResponseEntity<>("Post updated successfully", HttpStatus.OK);
    }


}
