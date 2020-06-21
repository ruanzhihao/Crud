package com.java.ssm.entity;

import lombok.Data;

@Data
public class User {
   private Long id;
   private String userName;
   private String userPassword;
   private String email;
   private String roleName;
}
