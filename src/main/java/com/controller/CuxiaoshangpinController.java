package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.CuxiaoshangpinEntity;
import com.entity.view.CuxiaoshangpinView;

import com.service.CuxiaoshangpinService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;
import java.io.IOException;
import com.service.StoreupService;
import com.entity.StoreupEntity;

/**
 * 促销商品
 * 后端接口
 * @author 
 * @email 
 * @date 2022-03-05 15:35:09
 */
@RestController
@RequestMapping("/cuxiaoshangpin")
public class CuxiaoshangpinController {
    @Autowired
    private CuxiaoshangpinService cuxiaoshangpinService;


    @Autowired
    private StoreupService storeupService;

    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,CuxiaoshangpinEntity cuxiaoshangpin, 
		HttpServletRequest request){

        EntityWrapper<CuxiaoshangpinEntity> ew = new EntityWrapper<CuxiaoshangpinEntity>();
    	PageUtils page = cuxiaoshangpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cuxiaoshangpin), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,CuxiaoshangpinEntity cuxiaoshangpin, 
		HttpServletRequest request){
        EntityWrapper<CuxiaoshangpinEntity> ew = new EntityWrapper<CuxiaoshangpinEntity>();
    	PageUtils page = cuxiaoshangpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cuxiaoshangpin), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( CuxiaoshangpinEntity cuxiaoshangpin){
       	EntityWrapper<CuxiaoshangpinEntity> ew = new EntityWrapper<CuxiaoshangpinEntity>();
      	ew.allEq(MPUtil.allEQMapPre( cuxiaoshangpin, "cuxiaoshangpin")); 
        return R.ok().put("data", cuxiaoshangpinService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(CuxiaoshangpinEntity cuxiaoshangpin){
        EntityWrapper< CuxiaoshangpinEntity> ew = new EntityWrapper< CuxiaoshangpinEntity>();
 		ew.allEq(MPUtil.allEQMapPre( cuxiaoshangpin, "cuxiaoshangpin")); 
		CuxiaoshangpinView cuxiaoshangpinView =  cuxiaoshangpinService.selectView(ew);
		return R.ok("查询促销商品成功").put("data", cuxiaoshangpinView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        CuxiaoshangpinEntity cuxiaoshangpin = cuxiaoshangpinService.selectById(id);
		cuxiaoshangpin.setClicknum(cuxiaoshangpin.getClicknum()+1);
		cuxiaoshangpin.setClicktime(new Date());
		cuxiaoshangpinService.updateById(cuxiaoshangpin);
        return R.ok().put("data", cuxiaoshangpin);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        CuxiaoshangpinEntity cuxiaoshangpin = cuxiaoshangpinService.selectById(id);
		cuxiaoshangpin.setClicknum(cuxiaoshangpin.getClicknum()+1);
		cuxiaoshangpin.setClicktime(new Date());
		cuxiaoshangpinService.updateById(cuxiaoshangpin);
        return R.ok().put("data", cuxiaoshangpin);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CuxiaoshangpinEntity cuxiaoshangpin, HttpServletRequest request){
    	cuxiaoshangpin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(cuxiaoshangpin);

        cuxiaoshangpinService.insert(cuxiaoshangpin);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody CuxiaoshangpinEntity cuxiaoshangpin, HttpServletRequest request){
    	cuxiaoshangpin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(cuxiaoshangpin);

        cuxiaoshangpinService.insert(cuxiaoshangpin);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CuxiaoshangpinEntity cuxiaoshangpin, HttpServletRequest request){
        //ValidatorUtils.validateEntity(cuxiaoshangpin);
        cuxiaoshangpinService.updateById(cuxiaoshangpin);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        cuxiaoshangpinService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<CuxiaoshangpinEntity> wrapper = new EntityWrapper<CuxiaoshangpinEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = cuxiaoshangpinService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	
	/**
     * 前端智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,CuxiaoshangpinEntity cuxiaoshangpin, HttpServletRequest request,String pre){
        EntityWrapper<CuxiaoshangpinEntity> ew = new EntityWrapper<CuxiaoshangpinEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicknum");
        params.put("order", "desc");
		PageUtils page = cuxiaoshangpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cuxiaoshangpin), params), params));
        return R.ok().put("data", page);
    }





}
