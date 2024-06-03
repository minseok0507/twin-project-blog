package org.example.twinprojectblog.login;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapperInter {
    @Insert("INSERT INTO user (username, password, email) values (#{username}, #{password}, #{email})")
    void insert(UserDto userDto);

    @Select("select count(*) from user where username = #{username} and password = #{password}")
    int checkUser(String username, String password);

    @Select("select id from user where username = #{username}")
    int findUserIdByUsername(String username);
}
