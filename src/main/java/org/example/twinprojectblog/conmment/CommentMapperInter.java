package org.example.twinprojectblog.conmment;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CommentMapperInter {

    @Insert("INSERT INTO comment (content, user_id, post_id) " +
            "VALUES (#{content}, #{userId}, #{postId})")
    void insertComment(CommentDto commentDto);

    /*
    버튼으로 맵핑해서 삭제
     */
    @Delete("DELETE FROM comment WHERE id = #{id}")
    void deleteCommentsById(@Param("id") Integer id);

    /*
    게시글 삭제시 모든 댓글 삭제
     */
    @Delete("DELETE FROM comment WHERE post_id = #{postId}")
    void deleteCommentsByPostId(@Param("postId") Integer postId);


    @Select("SELECT * from comment where post_id = #{postId}")
    @ResultMap("commentDtoResultMap")
    List<CommentDto> getCommentsByPostId(@Param("postId") Integer postId);
}
