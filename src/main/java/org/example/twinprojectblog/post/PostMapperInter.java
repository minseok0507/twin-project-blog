package org.example.twinprojectblog.post;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.twinprojectblog.data.dto.UserDto;

@Mapper
public interface PostMapperInter {


    @Insert("INSERT INTO posts (title, content, image_url, created_at) " +
            "VALUES (#{title}, #{content}, #{imageUrl}, #{createdAt})")
    void insertPost(PostDto post);
}
