package com.faker.service.impl;

import com.faker.domain.BaseResult;
import com.faker.domain.Student;
import com.faker.mapper.StudentMapper;
import com.faker.page.PageBean;
import com.faker.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by jbtms940317 on 18/1/26.
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService {

    /*Service层调用持久层的接口对象声明*/
    @Resource
    private StudentMapper studentMapper;

    public List<Student> selectAll() {
        return studentMapper.selectAll();
    }

    public List<Student> selectPage(PageBean<Student>pageBean) {
        return studentMapper.selectPage(pageBean);
    }

    public BaseResult<Student> pageSelect(int pageIndex, int pageSize,Student student) {

        BaseResult<Student> result = new BaseResult<Student>();

        PageBean<Student> pg = new PageBean<Student>(1,3,3);

        pg.setParameter(student);

        //获得总条数
        int total = studentMapper.getTotalRecord(pg);

        //构建分页对象
        PageBean<Student> pageBean = new PageBean<Student>(pageIndex+1,pageSize,total);

        //更新分页查询中的参数
        pageBean.setParameter(student);

        /*获取当前页数据*/
        List<Student> datas = studentMapper.selectPage(pageBean);

        /*将总记录数与当前页data数据设置到BaseResult对象中*/
        result.setTotal(total);
        result.setData(datas);
        return result;
    }
}
