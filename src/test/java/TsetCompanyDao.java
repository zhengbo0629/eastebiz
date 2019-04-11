import com.eastebiz.Application;

import com.eastebiz.dao.EbizCompanyDao;
import com.eastebiz.entity.EbizCompany;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest(classes= Application.class)
public class TsetCompanyDao {

    @Autowired
    private EbizCompanyDao ebizCompanyDao;


    @Test
    public void Test3() {
        EbizCompany ebizCompany = ebizCompanyDao.selectOneCompanyName("殷氏公司");
        System.out.println(ebizCompany);

    }

    @Test
    public void Tset4() {
        EbizCompany ebizCompany = ebizCompanyDao.selectOneOwerName("yinxiang");
        System.out.println(ebizCompany);

    }

    @Test
    public void Test5() {
        Date date = new java.util.Date();
        System.out.println(date);
        ebizCompanyDao.updateAndUpdateTime(1, date);
    }
}

