package com.catstagram.member.model;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberDTO {
	private int member_idx;
	private String member_id;
	private String member_name;
	private String member_pwd;
	private String member_email;
	private String member_intro;
	private String member_img;
	private Date member_joindate;
	private String member_quit;
	private int is_follow;
	private int feed_count;
	private int following_count;
	private int follower_count;
	private String feed_count_KM;
	private String following_count_KM;
	private String follower_count_KM;
}