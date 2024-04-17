package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.CuxiaoshangpinEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.CuxiaoshangpinVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.CuxiaoshangpinView;


/**
 * 促销商品
 *
 * @author 
 * @email 
 * @date 2022-03-05 15:35:09
 */
public interface CuxiaoshangpinService extends IService<CuxiaoshangpinEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<CuxiaoshangpinVO> selectListVO(Wrapper<CuxiaoshangpinEntity> wrapper);
   	
   	CuxiaoshangpinVO selectVO(@Param("ew") Wrapper<CuxiaoshangpinEntity> wrapper);
   	
   	List<CuxiaoshangpinView> selectListView(Wrapper<CuxiaoshangpinEntity> wrapper);
   	
   	CuxiaoshangpinView selectView(@Param("ew") Wrapper<CuxiaoshangpinEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<CuxiaoshangpinEntity> wrapper);
   	

}

