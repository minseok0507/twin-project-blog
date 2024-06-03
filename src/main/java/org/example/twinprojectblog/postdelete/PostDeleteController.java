package org.example.twinprojectblog.postdelete;


import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class PostDeleteController {

    private final PostDeleteService postDeleteService;

    /*
    버튼을 누르면
    id를 통해 컬럼을 찾고
    해당 컬럼을 삭제해주세요
     */
    @DeleteMapping("/post/{postId}")
    @ResponseBody
    public ResponseEntity<String> deletePost(
            @PathVariable Integer postId
    ){
        postDeleteService.deletePost(postId);
        return ResponseEntity.status(HttpStatus.OK)
                .body("Post deleted successfully");
    }

}
