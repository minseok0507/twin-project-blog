package org.example.twinprojectblog.data.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.twinprojectblog.login.UserDto;

@Mapper
public interface UserMapperInter {
    @Insert("INSERT INTO user (username, password, email) values (#{username}, #{password}, #{email})")
    void insert(UserDto userDto);

    @Select("select count(*) from user where username = #{username} and password = #{password}")
    int checkUser(String username, String password);
}
