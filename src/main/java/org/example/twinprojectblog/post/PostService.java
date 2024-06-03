package org.example.twinprojectblog.post;

import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.naver.NcpObjectStorageService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class PostService {

    private final NcpObjectStorageService ncpObjectStorageService;
    private final PostMapperInter postMapperInter;

    public void savePost(PostDto postDto, MultipartFile file) {
        // 버킷에 파일 업로드
        String bucketName = "bitcamp124";
        String directoryPath = "image";
        String fileUrl = ncpObjectStorageService.uploadFile(bucketName, directoryPath, file);

        // 업로드된 파일의 URL을 PostDto에 설정
        postDto.setImageUrl(fileUrl);

        // 데이터베이스에 저장
        postMapperInter.insertPost(postDto);
    }
}
