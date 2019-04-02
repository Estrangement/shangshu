package com.cn.serviceimpl;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cn.entity.Relation;
import com.cn.entity.Role;
import com.cn.entity.User;
import com.cn.mapper.RelationMapper;
import com.cn.mapper.RoleMapper;
import com.cn.mapper.UserMapper;
import com.cn.service.RelationService;
import com.cn.service.UserService;
import com.cn.utils.ExcelUtil;
import com.cn.utils.UUIDUtil;
import com.cn.vo.UserRoleMenuVo;
@Service
public class UserServiceimpl implements UserService{
	@Resource
	private UserMapper ump;
	@Resource
	private RoleMapper rem;
	@Resource
	private RelationMapper ram;
	RelationServiceimpl abc=new RelationServiceimpl();
	@Override
	public boolean add(User t) {
		// TODO Auto-generated method stub
		return ump.add(t);
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return ump.delete(id);
	}

	@Override
	public boolean update(User t) {
		// TODO Auto-generated method stub
		return ump.update(t);
	}

	@Override
	public List<User> findAll(User t) {
		// TODO Auto-generated method stub
		return ump.findAll(t);
	}

	@Override
	public List<User> findAllByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ump.findAllByPage(map);
	}

	@Override
	public int findAllCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ump.findAllCount(map);
	}

	@Override
	public List<Relation> findByIds(String[] ids) {
		// TODO Auto-generated method stub
		return ram.findByIds(ids);
	}

	@Override
	public List<UserRoleMenuVo> findUsersRoleMenuMap(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return ump.findUsersRoleMenuMap(map);
	}

	@Override
	public User login(String username,String pwd) {
		List<User> list = new ArrayList<User>();
		User u=new User();
		u.setUsername(username);
		u.setPwd(pwd);
		
		list = ump.findAll(u);
		if (null != list && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
		// TODO Auto-generated method stub
	}

	@Override
	public int batchdelete(String[] sid) {
		// TODO Auto-generated method stub
		return ump.batchdelete(sid);
	}


	@Override
	public boolean add(Relation t) {
		// TODO Auto-generated method stub
		return ram.add(t);
	}

	@Override
	public List<Role> addname() {
		// TODO Auto-generated method stub
		return rem.findAll(null);
	}

	@Override
	public boolean update(Relation t) {
		// TODO Auto-generated method stub
		return ram.update(t);
	}

	@Override
	public List<Relation> findAll(Relation t) {
		// TODO Auto-generated method stub
		return ram.findAll(t);
	}

	@Override
	public List<Relation> zuolian(String uid) {
		// TODO Auto-generated method stub
		return ram.zuolian(uid);
	}

	@Override
	public boolean deleteur(String id) {
		// TODO Auto-generated method stub
		return ram.deletea(id);
	}

	@Override
	public boolean deletea(String uid) {
		// TODO Auto-generated method stub
		return ram.deletea(uid);
	}

	@Override
	public int batchdeletea(String[] uid) {
		// TODO Auto-generated method stub
		return ram.batchdeletea(uid);
	}

	@Override
	public String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
        
        MultipartFile file = multipartRequest.getFile("upfile");  
        if(file.isEmpty()){  
            try {
				throw new Exception("文件不存在！");
			} catch (Exception e) {
				e.printStackTrace();
			}  
        }  
          
        InputStream in =null;  
        try {
			in = file.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        
		List<List<Object>> listob = null; 
		try {
			listob = new ExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
		} catch (Exception e) {
			e.printStackTrace();
		}   
		
	    //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出  
        for (int i = 0; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i);  
            User vo = new User(); 
            /*这里是主键验证，根据实际需要添加，可要可不要，加上之后，可以对现有数据进行批量修改和导入
            User j = null;
			try {
				j = userMapper.selectByPrimaryKey(Integer.valueOf(String.valueOf(lo.get(0))));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				System.out.println("没有新增");
			}*/
			    //vo.setUserId(Integer.valueOf(String.valueOf(lo.get(0))));  // 刚开始写了主键，由于主键是自增的，又去掉了，现在只有批量插入的功能，不能对现有数据进行修改了
			/* vo.setUid(UUIDUtil.getUUID()); */
            	String uid=UUIDUtil.getUUID();
                vo.setUid(uid);     // 表格的第一列   注意数据格式需要对应实体类属性
	            vo.setUname(String.valueOf(lo.get(1))); 
	            vo.setUsername(String.valueOf(lo.get(2)));
	            vo.setPwd(String.valueOf(lo.get(3)));
	            vo.setAge(Integer.parseInt(String.valueOf(lo.get(4))));
	            vo.setTel(String.valueOf(lo.get(5)));
	            vo.setSex(String.valueOf(lo.get(6)));
	            vo.setEmail(String.valueOf(lo.get(7)));
	            vo.setAddress(String.valueOf(lo.get(8)));
	            vo.setState(0);
	            //vo.setRegTime(Date.valueOf(String.valueOf(lo.get(2)))); 
	            //由于数据库中此字段是datetime，所以要将字符串时间格式：yyyy-MM-dd HH:mm:ss，转为Date类型
			/*
			 * if (lo.get(2) != null && lo.get(2) != "") { SimpleDateFormat sdf = new
			 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 * vo.setRegTime(sdf.parse(String.valueOf(lo.get(2)))); }else {
			 * vo.setRegTime(new Date()); }
			 */
	            System.out.println("从excel中读取的实体类对象："+ vo);
	            ump.add(vo);
	            Relation re=new Relation();
	            re.setUrid(UUIDUtil.getUUID());
	            re.setUid(uid);
	            re.setRid("129");
	            ram.add(re);
			/*if(j == null)
			{
		            userMapper.insert(vo);
			}
			else
			{
		            userMapper.updateByPrimaryKey(vo);
			}*/
        }
        System.out.println("文件导入成功！");
        return "文件导入成功！";

	}


}
