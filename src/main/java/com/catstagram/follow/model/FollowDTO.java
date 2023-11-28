package com.catstagram.follow.model;

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
public class FollowDTO {
	private int follow_idx;
	private int member_from;
	private int member_to;
	private int following_idx_of_my_following; // 내가 친구 추가한 사람의 친구의 idx
	private String following_id_of_my_following; // 내가 친구 추가한 사람의 친구의 id
	private String following_name_of_my_following; // 내가 친구 추가한 사람의 친구의 name
	private String following_img_of_my_following; // 내가 친구 추가한 사람의 친구의 img
	private int num_of_followers; // 내가 친구 추가한 사람들 중에서 이 사람을 몇 명이나 친구 추가했는지(ex. '팔로잉 외 1명'이므로 -1이 적용됨)
	private String my_following_list; // 이 사람을 내가 친구 추가한 사람들 중에 누가누가 친구 추가했는지
	private String[] my_following_list_arr; // 이 사람을 내가 친구 추가한 사람들 중에 누가누가 친구 추가했는지(배열)
}