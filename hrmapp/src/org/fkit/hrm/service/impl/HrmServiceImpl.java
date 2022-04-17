package org.fkit.hrm.service.impl;

import org.fkit.hrm.dao.*;
import org.fkit.hrm.domain.*;
import org.fkit.hrm.service.HrmService;
import org.fkit.hrm.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 肖文吉    36750064@qq.com
 * @version V1.0
 * @Description: 非遗管理系统服务层接口实现类
 * <br>网站：<a href="http://www.fkit.org">疯狂Java</a>
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service("hrmService")
public class HrmServiceImpl implements HrmService {

    /**
     * 自动注入持久层Dao对象
     */
    @Autowired
    private UserDao userDao;

    @Autowired
    private DeptDao deptDao;

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private JobDao jobDao;

    @Autowired
    private NoticeDao noticeDao;

    @Autowired
    private DocumentDao documentDao;

    @Autowired
    private FyDao fyDao;

    /*****************用户服务接口实现*************************************/
    /**
     * HrmServiceImpl接口login方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public User login(String loginname, String password) {
//		System.out.println("HrmServiceImpl login -- >>");
        return userDao.selectByLoginnameAndPassword(loginname, password);
    }

    /**
     * HrmServiceImpl接口findUser方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public List<User> findUser(User user, PageModel pageModel) {
        /** 当前需要分页的总数据条数  */
        Map<String, Object> params = new HashMap<>();
        params.put("user", user);
        int recordCount = userDao.count(params);
        pageModel.setRecordCount(recordCount);
        if (recordCount > 0) {
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }
        List<User> users = userDao.selectByPage(params);

        return users;
    }

    /**
     * HrmServiceImpl接口findUserById方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public User findUserById(Integer id) {
        return userDao.selectById(id);
    }

    /**
     * HrmServiceImpl接口removeUserById方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void removeUserById(Integer id) {
        userDao.deleteById(id);

    }

    /**
     * HrmServiceImpl接口addUser方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void modifyUser(User user) {
        userDao.update(user);

    }

    /**
     * HrmServiceImpl接口modifyUser方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void addUser(User user) {
        userDao.save(user);

    }

    /*****************部门服务接口实现*************************************/
    @Transactional(readOnly = true)
    @Override
    public List<Dept> findAllDept() {

        return deptDao.selectAllDept();
    }

    /**
     * HrmServiceImpl接口findDept方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public List<Dept> findDept(Dept dept, PageModel pageModel) {
        /** 当前需要分页的总数据条数  */
        Map<String, Object> params = new HashMap<>();
        params.put("dept", dept);
        int recordCount = deptDao.count(params);
        pageModel.setRecordCount(recordCount);

        if (recordCount > 0) {
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }

        List<Dept> depts = deptDao.selectByPage(params);

        return depts;
    }

    /**
     * HrmServiceImpl接口removeUserById方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void removeDeptById(Integer id) {
        deptDao.deleteById(id);

    }

    /**
     * HrmServiceImpl接口addDept方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void addDept(Dept dept) {
        deptDao.save(dept);

    }

    /**
     * HrmServiceImpl接口findDeptById方法实现
     *
     * @see { HrmService }
     */
    @Override
    public Dept findDeptById(Integer id) {

        return deptDao.selectById(id);
    }

    /**
     * HrmServiceImpl接口modifyDept方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void modifyDept(Dept dept) {
        deptDao.update(dept);

    }
    /*****************员工服务接口实现*************************************/
    /**
     * HrmService接口findEmployee方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public List<Employee> findEmployee(Employee employee, PageModel pageModel) {
        /** 当前需要分页的总数据条数  */
        Map<String, Object> params = new HashMap<>();
        params.put("employee", employee);

        int recordCount = employeeDao.count(params);
        pageModel.setRecordCount(recordCount);

        if (recordCount > 0) {
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }
        List<Employee> employees = employeeDao.selectByPage(params);
        return employees;
    }

    /**
     * HrmService接口removeEmployeeById方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void removeEmployeeById(Integer id) {
        employeeDao.deleteById(id);

    }

    /**
     * HrmService接口findEmployeeById方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public Employee findEmployeeById(Integer id) {

        return employeeDao.selectById(id);
    }

    /**
     * HrmService接口addEmployee方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void addEmployee(Employee employee) {
        employeeDao.save(employee);

    }

    /**
     * HrmService接口modifyEmployee方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void modifyEmployee(Employee employee) {
        employeeDao.update(employee);
    }

    /*****************职位接口实现*************************************/

    /**
     * HrmService接口findAllJob方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public List<Job> findAllJob() {

        return jobDao.selectAllJob();
    }

    /**
     * HrmService接口findJob方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public List<Job> findJob(Job job, PageModel pageModel) {
        /** 当前需要分页的总数据条数  */
        Map<String, Object> params = new HashMap<>();
        params.put("job", job);
        int recordCount = jobDao.count(params);
        pageModel.setRecordCount(recordCount);

        if (recordCount > 0) {
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }

        List<Job> jobs = jobDao.selectByPage(params);

        return jobs;
    }

    /**
     * HrmService接口removeJobById方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void removeJobById(Integer id) {
        jobDao.deleteById(id);

    }

    /**
     * HrmService接口addJob方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void addJob(Job job) {
        jobDao.save(job);

    }

    /**
     * HrmService接口findJobById方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public Job findJobById(Integer id) {

        return jobDao.selectById(id);
    }

    /**
     * HrmService接口modifyJob方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void modifyJob(Job job) {
        jobDao.update(job);

    }

    /*****************公告接口实现*************************************/
    @Transactional(readOnly = true)
    @Override
    public List<Notice> findNotice(Notice notice, PageModel pageModel) {
        /** 当前需要分页的总数据条数  */
        Map<String, Object> params = new HashMap<>();
        params.put("notice", notice);
        int recordCount = noticeDao.count(params);
        pageModel.setRecordCount(recordCount);

        if (recordCount > 0) {
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }

        List<Notice> notices = noticeDao.selectByPage(params);

        return notices;
    }

    /**
     * HrmService接口findNoticeById方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public Notice findNoticeById(Integer id) {

        return noticeDao.selectById(id);
    }

    /**
     * HrmService接口removeNoticeById方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void removeNoticeById(Integer id) {
        noticeDao.deleteById(id);

    }

    /**
     * HrmService接口addNotice方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void addNotice(Notice notice) {
        noticeDao.save(notice);

    }

    /**
     * HrmService接口modifyNotice方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void modifyNotice(Notice notice) {
        noticeDao.update(notice);

    }

    /*****************文件接口实现*************************************/

    /**
     * HrmService接口findDocument方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public List<Document> findDocument(Document document, PageModel pageModel) {
        /** 当前需要分页的总数据条数  */
        Map<String, Object> params = new HashMap<>();
        params.put("document", document);
        int recordCount = documentDao.count(params);
        pageModel.setRecordCount(recordCount);

        if (recordCount > 0) {
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }

        List<Document> documents = documentDao.selectByPage(params);

        return documents;
    }

    /**
     * HrmService接口addDocument方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void addDocument(Document document) {
        documentDao.save(document);

    }

    /**
     * HrmService接口removeDocumentById方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void removeDocumentById(Integer id) {
        documentDao.deleteById(id);

    }

    /**
     * HrmService接口modifyDocument方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void modifyDocument(Document document) {
        documentDao.update(document);

    }

    /**
     * HrmService接口findDocumentById方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public Document findDocumentById(Integer id) {

        return documentDao.selectById(id);
    }


    /*****************非遗服务接口实现*************************************/
    @Transactional(readOnly = true)
    @Override
    public List<Fy> findAllFy() {

        return fyDao.selectAllFy();
    }

    /**
     * HrmServiceImpl接口findFy方法实现
     *
     * @see { HrmService }
     */
    @Transactional(readOnly = true)
    @Override
    public List<Fy> findFy(Fy fy, PageModel pageModel) {
        /** 当前需要分页的总数据条数  */
        Map<String, Object> params = new HashMap<>();
        params.put("fy", fy);
        int recordCount = fyDao.count(params);
        pageModel.setRecordCount(recordCount);

        if (recordCount > 0) {
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }

        List<Fy> fys = fyDao.selectByPage(params);

        return fys;
    }

    /**
     * HrmServiceImpl接口removeFyById方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void removeFyById(Integer id) {
        fyDao.deleteById(id);

    }

    /**
     * HrmServiceImpl接口addFy方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void addFy(Fy fy) {
        fyDao.save(fy);

    }

    /**
     * HrmServiceImpl接口findFyById方法实现
     *
     * @return
     * @see { HrmService }
     */
    @Override
    public Fy findFyById(Integer id) {

        return fyDao.selectById(id);
    }

    /**
     * HrmServiceImpl接口modifyFy方法实现
     *
     * @see { HrmService }
     */
    @Override
    public void modifyFy(Fy fy) {
        fyDao.update(fy);

    }

}
