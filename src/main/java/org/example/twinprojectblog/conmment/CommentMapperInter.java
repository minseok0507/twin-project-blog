package org.example.twinprojectblog.conmment;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CommentMapperInter {

    @Insert("INSERT INTO comment (content, user_id, post_id) " +
            "VALUES (#{content}, #{userId}, #{postId})")
    void insertComment(CommentDto commentDto);

    @Delete("DELETE FROM comment WHERE id = #{id}")
    void deleteCommentsById(@Param("id") Integer id);

    @Delete("DELETE FROM comment WHERE post_id = #{postId}")
    void deleteCommentsByPostId(@Param("postId") Integer postId);
}
