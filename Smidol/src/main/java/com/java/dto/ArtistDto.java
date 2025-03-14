package com.java.dto;

import java.util.List;

import org.hibernate.annotations.DynamicInsert;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@DynamicInsert
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class ArtistDto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int artist_no;
	@Column(length = 30)
	private String artist_group_name;
	@Column(length = 100)	
	private String artist_group_image;

	@OneToMany(mappedBy = "artistDto", fetch = FetchType.EAGER)
	@ToString.Exclude
	private List<ShopDto> shopList;
}