package org.example.twinprojectblog.post;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PostMapperInter {


    @Insert("INSERT INTO post (title, content, image_url) " +
            "VALUES (#{title}, #{content}, #{imageUrl})")
    void insertPost(PostDto post);

    @Select("select * from post order by created_at desc LIMIT 5;")
    @ResultMap("postResultMap")
    List<PostDto> getNewPosts();

    @Select("select * from post where id = #{id}")
    @ResultMap("postResultMap")
    PostDto getPostById(int id);
}
