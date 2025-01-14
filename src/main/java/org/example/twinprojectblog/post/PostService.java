package org.example.twinprojectblog.post;

import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.naver.NcpObjectStorageService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PostService {

    private final NcpObjectStorageService ncpObjectStorageService;
    private final PostMapperInter postMapperInter;

    public void savePost(PostDto postDto, MultipartFile file) {
        System.out.println("save file");
        // 버킷에 파일 업로드
        String bucketName = "team-project-blog";
        String directoryPath = "image";
        String imageUrl = ncpObjectStorageService.uploadFile(bucketName, directoryPath, file);

        // 업로드된 파일의 URL을 PostDto 넣어 주기
        postDto.setImageUrl(imageUrl);

        // 데이터베이스에 저장
        postMapperInter.insertPost(postDto);
    }


    //수정
    public void updatePost(
            Integer postId,
            String title,
            String content,
            String imageUrl) {

        postMapperInter.updatePost(postId, title, content, imageUrl);
    }
    public void updtePostNotImage(
            Integer postId,
            String title,
            String content
    ) {
        postMapperInter.updatePostNotImage(postId, title, content);
    }



    public PostDto getPostById(Integer postId) {
        return postMapperInter.findPostById(postId);
    }
    public List<PostDto> getPostsPage(int offset) {
        return postMapperInter.getPostsPage(offset * 4);
    }


}
