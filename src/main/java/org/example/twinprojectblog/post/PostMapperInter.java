package org.example.twinprojectblog.post;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PostMapperInter {


    @Insert("INSERT INTO post (title, content, image_url) " +
            "VALUES (#{title}, #{content}, #{imageUrl})")
    void insertPost(PostDto post);

    @Select("select * from post order by created_at desc LIMIT 5;")
    @ResultMap("postResultMap")
    List<PostDto> getNewPosts();


    @Update("UPDATE posts SET title = #{title}, content = #{content}, image_url = #{imageUrl} WHERE id = #{postId}")
    void updatePost(@Param("postId") Integer postId,
                    @Param("title") String title,
                    @Param("content") String content,
                    @Param("imageUrl") String imageUrl);

    @Select("select * from post where id = #{id}")
    @ResultMap("postResultMap")
    PostDto getPostById(int id);
}
