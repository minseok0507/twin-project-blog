package org.example.twinprojectblog.post;


import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.naver.NcpObjectStorageService;
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

    //내용 업로드
    @PostMapping("upload")
    public String uploadFile(
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("file") MultipartFile file,
            Model model){
        try {

            String imageUrl = ncpObjectStorageService.uploadFile("bitcamp124", "/image", file);
            model.addAttribute("imageUrl", imageUrl);
            return "uploadSuccess";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "File upload failed.");
            return "uploadFailure";
        }
    }


}
