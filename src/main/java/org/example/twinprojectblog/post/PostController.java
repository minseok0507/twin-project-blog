package org.example.twinprojectblog.post;



import lombok.RequiredArgsConstructor;

import org.example.twinprojectblog.naver.NcpObjectStorageService;
import org.example.twinprojectblog.postdelete.PostDeleteMapperInter;
import org.example.twinprojectblog.postdelete.PostDeleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;
    private final NcpObjectStorageService ncpObjectStorageService;
    private final PostDeleteMapperInter postDeleteMapperInter;
    private final PostDeleteService postDeleteService;

    //게시글 생성
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


    //게시글 수정
    @PutMapping("/update/{postId}")
    public ResponseEntity<String> updatePost(
            @PathVariable Integer postId,
            @RequestParam String title,
            @RequestParam String content,
            @RequestParam(value = "file", required = false) MultipartFile file
    ) {
        System.out.println(title);
        // 이미지 파일이 있으면 -> 삭제 -> 업데이트
        if(file != null){
            //이미지 삭제
//            postDeleteService.deleteImageByPostId(postId);
            //이미지 업로드
            String bucketName = "bitcamp124";
            String directoryPath = "image";
            String imageUrl = ncpObjectStorageService.uploadFile(bucketName, directoryPath, file);
            System.out.println();
            //postId를 통해 제목, 내용, 이미지url 수정
            postService.updatePost(postId, title, content, imageUrl);

        } else { // 이미지 파일이 없으면 -> 제목, 내용만 수정
            postService.updtePostNotImage(postId, title, content);
        }


        return new ResponseEntity<>("Post updated successfully", HttpStatus.OK);
    }

    @GetMapping("/posts/update/{postId}")
    public String showUpdatePostPage(@PathVariable Integer postId, Model model) {
        PostDto post = postService.getPostById(postId);
        model.addAttribute("post", post);
        return "update";
    }

}
