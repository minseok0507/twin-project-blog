package org.example.twinprojectblog.postdelete;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PostDeleteMapperInter {

    @Delete("DELETE FROM post WHERE id = #{postId}")
    void deletePostByPostId(@Param("postId") Integer postId);



}
