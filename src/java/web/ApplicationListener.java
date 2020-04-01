
package web;

import model.Product;
import java.util.ArrayList;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class ApplicationListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ArrayList<Product> products = new ArrayList<Product>();
        
        products.add(new Product(1, "Mouse", 4990, 4)); 
        products.add(new Product(2, "Pendrive", 7990, 7)); 
        products.add(new Product(3, "Teclado", 14990, 10));
        
        sce.getServletContext().setAttribute("productList", products);
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
