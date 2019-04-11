import com.eastebiz.Application;
import com.eastebiz.dao.ProductDao;
import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.Product;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes= Application.class)
public class TestProductDao {

    @Autowired
    private ProductDao productDao;

    @Test
    public void Test1(){
        EbizCompany ebizCompany = new EbizCompany(3);

        Product product = new Product("1","2","笔记本","4","5","6","7","8",9.00,10.00,11.00,12.00,13.00,14,15.00,16.00,17,18.00,"19","20","21","22","23",new java.util.Date(),ebizCompany);
        productDao.insertProduct(product);
    }


    @Test
    public void Test2(){
        Product product = new Product(1,"2","88888","6","7","8",9.00,10.00,11.00,12.00,13.00,14,15.00,16.00,17,18.00,"19","20","21","22","23",new java.util.Date());
        productDao.updatebProduct(product);
    }

    @Test
    public void Test3(){
        List<Product> products = productDao.selectAllNameAndValue(3,"id", "7");
        System.out.println(products);
    }

    @Test
    public void Test4(){
        List<Product> products = productDao.selectAllValue(3, "笔 ");
        System.out.println(products);
    }

    @Test
    public void Test5(){
        List<Product> products = productDao.seclectAllEbizcompanyId(1);
        System.out.println(products);

    }
}
