import com.eastebiz.Application;
import com.eastebiz.dao.PackageListDao;
import com.eastebiz.entity.PackageList;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest(classes = Application.class)
@RunWith(SpringRunner.class)
public class PackageDaoTest {
    //测试 fork 是否成功
    @Autowired
    private PackageListDao packageListDao;

    @Test
    public  void  Test3(){
        List<PackageList> lists = packageListDao.selectAllPackageByUserId(22);
        for (PackageList list : lists) {
            System.out.println(list);
        }
    }
}
