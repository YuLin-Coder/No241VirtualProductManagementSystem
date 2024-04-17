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


import com.dao.CuxiaoshangpinDao;
import com.entity.CuxiaoshangpinEntity;
import com.service.CuxiaoshangpinService;
import com.entity.vo.CuxiaoshangpinVO;
import com.entity.view.CuxiaoshangpinView;

@Service("cuxiaoshangpinService")
public class CuxiaoshangpinServiceImpl extends ServiceImpl<CuxiaoshangpinDao, CuxiaoshangpinEntity> implements CuxiaoshangpinService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CuxiaoshangpinEntity> page = this.selectPage(
                new Query<CuxiaoshangpinEntity>(params).getPage(),
                new EntityWrapper<CuxiaoshangpinEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<CuxiaoshangpinEntity> wrapper) {
		  Page<CuxiaoshangpinView> page =new Query<CuxiaoshangpinView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<CuxiaoshangpinVO> selectListVO(Wrapper<CuxiaoshangpinEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public CuxiaoshangpinVO selectVO(Wrapper<CuxiaoshangpinEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<CuxiaoshangpinView> selectListView(Wrapper<CuxiaoshangpinEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public CuxiaoshangpinView selectView(Wrapper<CuxiaoshangpinEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
