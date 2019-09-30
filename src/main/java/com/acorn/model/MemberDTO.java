package com.acorn.model;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor



public class MemberDTO {

	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private Date updatedate;

	
	
}
