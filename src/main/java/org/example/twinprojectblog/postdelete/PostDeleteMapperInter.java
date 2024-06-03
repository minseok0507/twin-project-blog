package org.example.twinprojectblog.postdelete;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PostDeleteMapperInter {

    @Delete("DELETE FROM posts WHERE id = #{postId}")
    void deletePostByPostId(@Param("postId") Integer postId);


    @Select("SELECT image_url FROM posts WHERE id = #{postId}")
    String findImageUrlByPostId(@Param("postId") Integer postId);

}