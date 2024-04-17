package com.dao;

import com.entity.CuxiaoshangpinEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.CuxiaoshangpinVO;
import com.entity.view.CuxiaoshangpinView;


/**
 * 促销商品
 * 
 * @author 
 * @email 
 * @date 2022-03-05 15:35:09
 */
public interface CuxiaoshangpinDao extends BaseMapper<CuxiaoshangpinEntity> {
	
	List<CuxiaoshangpinVO> selectListVO(@Param("ew") Wrapper<CuxiaoshangpinEntity> wrapper);
	
	CuxiaoshangpinVO selectVO(@Param("ew") Wrapper<CuxiaoshangpinEntity> wrapper);
	
	List<CuxiaoshangpinView> selectListView(@Param("ew") Wrapper<CuxiaoshangpinEntity> wrapper);

	List<CuxiaoshangpinView> selectListView(Pagination page,@Param("ew") Wrapper<CuxiaoshangpinEntity> wrapper);
	
	CuxiaoshangpinView selectView(@Param("ew") Wrapper<CuxiaoshangpinEntity> wrapper);
	

}
