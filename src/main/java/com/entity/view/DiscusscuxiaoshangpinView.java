package com.entity.view;

import com.entity.DiscusscuxiaoshangpinEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 促销商品评论表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2022-03-05 15:35:10
 */
@TableName("discusscuxiaoshangpin")
public class DiscusscuxiaoshangpinView  extends DiscusscuxiaoshangpinEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DiscusscuxiaoshangpinView(){
	}
 
 	public DiscusscuxiaoshangpinView(DiscusscuxiaoshangpinEntity discusscuxiaoshangpinEntity){
 	try {
			BeanUtils.copyProperties(this, discusscuxiaoshangpinEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
