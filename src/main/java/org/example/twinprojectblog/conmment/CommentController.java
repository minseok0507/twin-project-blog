package org.example.twinprojectblog.conmment;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class CommentController {

    private final CommentService commentService;
    private final CommentMapperInter commentMapperInter;


    /*
    댓글생성
     */
    @PostMapping("/comments")
    public ResponseEntity<String> createComment
            (@RequestParam String content,
             @RequestParam Integer postId,
             @RequestParam Integer userId)
    {
        commentService.createComment(postId, userId, content);
        return new ResponseEntity<>("Comment created successfully", HttpStatus.CREATED);
    }

    /*
    댓글 삭제
     */
    @DeleteMapping("/comments/{id}")
    public String deleteComment(@PathVariable Integer id) {
        commentMapperInter.deleteCommentsById(id);
        return "Comment deleted successfully";
    }

    @GetMapping("/comments/list")
    @ResponseBody
    public List<CommentDto> getComments(
            @RequestParam Integer postId
    ){
        System.out.println(commentMapperInter.getCommentsByPostId(postId));
        return commentMapperInter.getCommentsByPostId(postId);
    }





}
