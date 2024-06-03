package org.example.twinprojectblog.post;


import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.data.dto.UserDto;
import org.example.twinprojectblog.naver.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class PostController {


    private NcpObjectStorageService ncpObjectStorageService;

    private final PostService postService;



    @PostMapping("/posts")
    public String createPost(
            @RequestParam("title") String title,
            @RequestParam("content") String content,
//            @RequestParam("userId") Integer userId,
            @RequestParam("file") MultipartFile file) {

        PostDto postDto = new PostDto();
        postDto.setTitle(title);
        postDto.setContent(content);
//        postDto.setUserId(userId);

        postService.savePost(postDto, file);

        return "Post created successfully";
    }


}
