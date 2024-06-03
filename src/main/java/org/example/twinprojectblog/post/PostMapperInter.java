package org.example.twinprojectblog.post;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PostMapperInter {


    @Insert("INSERT INTO post (title, content, image_url) " +
            "VALUES (#{title}, #{content}, #{imageUrl})")
    void insertPost(PostDto post);
}
