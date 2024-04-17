package com.dao;

import com.entity.DiscusscuxiaoshangpinEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscusscuxiaoshangpinVO;
import com.entity.view.DiscusscuxiaoshangpinView;


/**
 * 促销商品评论表
 * 
 * @author 
 * @email 
 * @date 2022-03-05 15:35:10
 */
public interface DiscusscuxiaoshangpinDao extends BaseMapper<DiscusscuxiaoshangpinEntity> {
	
	List<DiscusscuxiaoshangpinVO> selectListVO(@Param("ew") Wrapper<DiscusscuxiaoshangpinEntity> wrapper);
	
	DiscusscuxiaoshangpinVO selectVO(@Param("ew") Wrapper<DiscusscuxiaoshangpinEntity> wrapper);
	
	List<DiscusscuxiaoshangpinView> selectListView(@Param("ew") Wrapper<DiscusscuxiaoshangpinEntity> wrapper);

	List<DiscusscuxiaoshangpinView> selectListView(Pagination page,@Param("ew") Wrapper<DiscusscuxiaoshangpinEntity> wrapper);
	
	DiscusscuxiaoshangpinView selectView(@Param("ew") Wrapper<DiscusscuxiaoshangpinEntity> wrapper);
	

}
