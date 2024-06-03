package org.example.twinprojectblog.conmment;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class CommentDto {
    private Integer id;
    private Integer postId;
    private Integer userId;
    private String content;
    private Timestamp createdAt;

    private String username;

    public CommentDto(Integer postId, Integer userId, String content) {
        this.postId = postId;
        this.userId = userId;
        this.content = content;
    }
}
