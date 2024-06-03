package org.example.twinprojectblog.post;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PostMapperInter {


    @Insert("INSERT INTO post (title, content, image_url) " +
            "VALUES (#{title}, #{content}, #{imageUrl})")
    void insertPost(PostDto post);

    @Select("SELECT image_url FROM post WHERE id = #{postId}")
    String getImageUrlByPostId(Integer postId);

    @Delete("DELETE FROM post WHERE id = #{postId}")
    void deletePostByPostId(Integer postId);
}
