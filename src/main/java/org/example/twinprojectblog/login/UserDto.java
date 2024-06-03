package org.example.twinprojectblog.login;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class UserDto {
    private int id;
    private String username;
    private String password;
    private String email;
}
