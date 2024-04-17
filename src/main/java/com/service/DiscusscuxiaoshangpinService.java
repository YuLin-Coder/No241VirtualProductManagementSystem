package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscusscuxiaoshangpinEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DiscusscuxiaoshangpinVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscusscuxiaoshangpinView;


/**
 * 促销商品评论表
 *
 * @author 
 * @email 
 * @date 2022-03-05 15:35:10
 */
public interface DiscusscuxiaoshangpinService extends IService<DiscusscuxiaoshangpinEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DiscusscuxiaoshangpinVO> selectListVO(Wrapper<DiscusscuxiaoshangpinEntity> wrapper);
   	
   	DiscusscuxiaoshangpinVO selectVO(@Param("ew") Wrapper<DiscusscuxiaoshangpinEntity> wrapper);
   	
   	List<DiscusscuxiaoshangpinView> selectListView(Wrapper<DiscusscuxiaoshangpinEntity> wrapper);
   	
   	DiscusscuxiaoshangpinView selectView(@Param("ew") Wrapper<DiscusscuxiaoshangpinEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscusscuxiaoshangpinEntity> wrapper);
   	

}

