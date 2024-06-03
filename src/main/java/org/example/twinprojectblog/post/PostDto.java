package org.example.twinprojectblog.post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class PostDto {
    private Integer id;
    private String title;
    private String content;
    private String imageUrl;
    private LocalDateTime createdAt;
}
