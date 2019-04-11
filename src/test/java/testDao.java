import com.eastebiz.Application;

import com.eastebiz.dao.EbizUserDao;
import com.eastebiz.entity.EbizUser;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest(classes= Application.class)
public class testDao {

    @Autowired
    private  EbizUserDao ebizUserDao;







    @Test
    public void Test3(){
        ebizUserDao.updateAndUpdateTime(1,new java.util.Date());

    }

    @Test
    public void Test4(){
        EbizUser ebizUser = new EbizUser(1,"1","21681615","15462841118","sh","155","1","1","1","1","22");
        ebizUserDao.updateEbizUser(ebizUser);

    }

    @Test
    public void Test5(){
        EbizUser ebizUser = ebizUserDao.selectOneUserName("yinxiang");
        System.out.println(ebizUser);

    }

}
