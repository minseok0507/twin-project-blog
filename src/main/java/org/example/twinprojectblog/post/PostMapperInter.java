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

    @Select("select id, title, image_url, view_count, created_at from post order by view_count DESC LIMIT 3;")
    @ResultMap("postResultMap")
    List<PostDto> getPopularPosts();

    @Select("select id, title from post order by created_at desc LIMIT 4 OFFSET #{offset}")
    @ResultMap("postResultMap")
    List<PostDto> getPostsPage(@Param("offset") int offset);

    @Select("select count(*) from post")
    int getPostsCount();


    @Update("UPDATE post SET title = #{title}, content = #{content}, image_url = #{imageUrl} WHERE id = #{postId}")
    void updatePost(@Param("postId") Integer postId,
                    @Param("title") String title,
                    @Param("content") String content,
                    @Param("imageUrl") String imageUrl);

    @Update("UPDATE post SET title = #{title}, content = #{content} WHERE id = #{postId}")
    void updatePostNotImage(@Param("postId") Integer postId,
                            @Param("title") String title,
                            @Param("content") String content);

    @Select("select * from post where id = #{id}")
    @ResultMap("postResultMap")
    PostDto getPostById(int id);

    @Update("update post SET view_count = view_count + 1 where  id = #{id}")
    void updateViewCount(int id);


    @Select("SELECT * FROM post WHERE id = #{postId}")
    PostDto findPostById(@Param("postId") Integer postId);


    @Select("SELECT * FROM post WHERE title LIKE CONCAT('%', #{search}, '%')")
    @ResultMap("postResultMap")
    List<PostDto> getPostsBySearch(@Param("search") String search);


    @Select("SELECT image_url FROM post WHERE id = #{postId}")
    String findImageUrlByPostId(@Param("postId") Integer postId);

}
