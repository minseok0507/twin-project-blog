package org.example.twinprojectblog.conmment;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Service
@RequiredArgsConstructor
public class CommentService {

    private final CommentMapperInter commentMapperInter;


    /*
   댓글 생성
   url 파라미터로 id를 받는다.
    */
    public void createComment(Integer postId, Integer userId, String content) {
        CommentDto commentDto = new CommentDto(postId, userId, content);
        commentMapperInter.insertComment(commentDto);
    }





}
