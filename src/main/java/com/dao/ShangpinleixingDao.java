package com.dao;

import com.entity.ShangpinleixingEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ShangpinleixingVO;
import com.entity.view.ShangpinleixingView;


/**
 * 商品类型
 * 
 * @author 
 * @email 
 * @date 2022-03-05 15:35:09
 */
public interface ShangpinleixingDao extends BaseMapper<ShangpinleixingEntity> {
	
	List<ShangpinleixingVO> selectListVO(@Param("ew") Wrapper<ShangpinleixingEntity> wrapper);
	
	ShangpinleixingVO selectVO(@Param("ew") Wrapper<ShangpinleixingEntity> wrapper);
	
	List<ShangpinleixingView> selectListView(@Param("ew") Wrapper<ShangpinleixingEntity> wrapper);

	List<ShangpinleixingView> selectListView(Pagination page,@Param("ew") Wrapper<ShangpinleixingEntity> wrapper);
	
	ShangpinleixingView selectView(@Param("ew") Wrapper<ShangpinleixingEntity> wrapper);
	

}
