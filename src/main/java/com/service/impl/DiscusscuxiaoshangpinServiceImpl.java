package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.DiscusscuxiaoshangpinDao;
import com.entity.DiscusscuxiaoshangpinEntity;
import com.service.DiscusscuxiaoshangpinService;
import com.entity.vo.DiscusscuxiaoshangpinVO;
import com.entity.view.DiscusscuxiaoshangpinView;

@Service("discusscuxiaoshangpinService")
public class DiscusscuxiaoshangpinServiceImpl extends ServiceImpl<DiscusscuxiaoshangpinDao, DiscusscuxiaoshangpinEntity> implements DiscusscuxiaoshangpinService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscusscuxiaoshangpinEntity> page = this.selectPage(
                new Query<DiscusscuxiaoshangpinEntity>(params).getPage(),
                new EntityWrapper<DiscusscuxiaoshangpinEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscusscuxiaoshangpinEntity> wrapper) {
		  Page<DiscusscuxiaoshangpinView> page =new Query<DiscusscuxiaoshangpinView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<DiscusscuxiaoshangpinVO> selectListVO(Wrapper<DiscusscuxiaoshangpinEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public DiscusscuxiaoshangpinVO selectVO(Wrapper<DiscusscuxiaoshangpinEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<DiscusscuxiaoshangpinView> selectListView(Wrapper<DiscusscuxiaoshangpinEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscusscuxiaoshangpinView selectView(Wrapper<DiscusscuxiaoshangpinEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
