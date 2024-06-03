package org.example.twinprojectblog.postdelete;

import lombok.RequiredArgsConstructor;
import org.example.twinprojectblog.conmment.CommentMapperInter;
import org.example.twinprojectblog.naver.NcpObjectStorageService;
import org.example.twinprojectblog.post.PostMapperInter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class PostDeleteService {
    private final PostMapperInter postMapper;
    private final CommentMapperInter commentMapper;
    private final NcpObjectStorageService ncpObjectStorageService;
    @Transactional
    public void deletePost(Integer postId) {
        // 댓글 삭제
        commentMapper.deleteCommentsByPostId(postId);

        // 게시글 삭제
        postMapper.deletePostByPostId(postId);

        // 이미지 URL 가져오기
        String imageUrl = postMapper.getImageUrlByPostId(postId);

        // 이미지 파일 삭제
        if (imageUrl != null && !imageUrl.isEmpty()) {
            String bucketName = "bitcamp124";
            String directoryPath = "image";
            String fileName = imageUrl.substring(imageUrl.lastIndexOf("/"));
            ncpObjectStorageService.deleteFile(bucketName,directoryPath, fileName);
        }
    }
}
