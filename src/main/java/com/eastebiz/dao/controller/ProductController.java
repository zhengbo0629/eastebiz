package com.eastebiz.dao.controller;

import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.Product;
import com.eastebiz.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Product")
public class ProductController {

    @Autowired
    private ProductService productService;





    //  添加和修改
    @RequestMapping("/registerProductAndAmendbProduct")
    public String registerProductAndAmendbProduct(Product product,HttpSession session){
        Integer id = product.getId();
        if(id==null){
            //获取公司ID    名字
            EbizCompany ebizCompany =(EbizCompany) session.getAttribute("EbizCompany");
            Integer ebizcompanyId = ebizCompany.getId();
            String companyName = ebizCompany.getCompanyName();

            product.setEbizCompany(new EbizCompany(ebizcompanyId));
            product.setCompanyName(companyName);


            //添加时间
            Date date = new Date();
            product.setCreatedTime(date);

            productService.registerProduct(product);
            return "redirect:/product/queryAllProduct.jsp";
        }else {
            //添加时间
            Date date = new Date();
            product.setUpdateTime(date);
            productService.amendbProduct(product);
            return "redirect:/product/queryAllProduct.jsp";
        }

    }


    //根据ID查询一个（用于修改）
    @RequestMapping("/queryOneProduct")
    public String queryOneProduct(Integer id,HttpSession session){

        Product product = productService.selectOneProduct(id);
        session.setAttribute("product",product);
        return "forward:/product/amendProuct.jsp";
    }


    //根据ID查询一个（用于领票）
    @RequestMapping("/queryReportPackage")
    public String queryReportPackage(Integer id,HttpSession session){
        Product newProduct = productService.selectOneProduct(id);

        session.setAttribute("newProduct",newProduct);
        return "forward:/package/reportPackage.jsp";
    }



    //模糊查询  名字或者条件
    @RequestMapping("/queryAllNameAndValue")
    @ResponseBody
    public List<Product> queryAllNameAndValue( String name , String value,HttpSession session){

      EbizCompany    ebizCompany =(EbizCompany) session.getAttribute("EbizCompany");
        Integer ebizcompanyId = ebizCompany.getId();

        if(name .equals("0")){
            List<Product> products = productService.queryAllValue(ebizcompanyId, value);
            return products;

        }else {
            List<Product> products = productService.queryAllNameAndValue(ebizcompanyId, name, value);
            return products;

        }
    }

    //根据状态查询
    @RequestMapping("/queryAndStatus")
    @ResponseBody
    public List<Product> queryAndStatus(String status ,HttpSession session){

        EbizCompany ebizCompany =(EbizCompany) session.getAttribute("EbizCompany");
        Integer ebizcompanyId = ebizCompany.getId();

        List<Product> products = productService.queryAndStatus(status,ebizcompanyId);
        return products;
    }

    //根据公司ID查询公司旗下有多少产品
    @RequestMapping("/seclectAllEbizcompanyId")
    @ResponseBody
    public List<Product> seclectAllEbizcompanyId( HttpSession session){

        EbizCompany ebizCompany =(EbizCompany) session.getAttribute("EbizCompany");
        Integer id = ebizCompany.getId();
        List<Product> products = productService.seclectAllEbizcompanyId(id);
        return products;
    }

    //根据公司ID查询公司在收购的产品
    @RequestMapping("/queryAllPurchaseProduct")
    @ResponseBody
    public List<Product> queryAllPurchaseProduct(HttpSession session){
        EbizCompany ebizCompany =(EbizCompany) session.getAttribute("EbizCompany");
        Integer id = ebizCompany.getId();
        return productService.queryAllEbizcompany(id);
    }

}
