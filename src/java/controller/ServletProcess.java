
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;


@WebServlet(name = "ServletProcess", urlPatterns = {"/process.do"})
public class ServletProcess extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<String> errors = new ArrayList<String>();
        int code = 0, price = 0, stock = 0;
        String name;
        try{
            code = Integer.parseInt(request.getParameter("txtcode"));
        }catch(Exception e) {
            errors.add("El código debe ser un número");
        }
        
        name = request.getParameter("txtname");
        
        try{
            price = Integer.parseInt(request.getParameter("txtprice"));
        }catch(Exception e) {
            errors.add("El precio debe ser un número");
        }
        
        try{
            stock = Integer.parseInt(request.getParameter("txtstock"));
        }catch(Exception e) {
            errors.add("El stock debe ser un número");
        }
        
        
        if (errors.isEmpty()) {
            ArrayList<Product> products = (ArrayList<Product>) getServletContext().getAttribute("productList");      
            products.add(new Product(code, name, price, stock));
            
            getServletContext().setAttribute("productList", products);
            
            response.sendRedirect("index.jsp");
            
        } else {
            getServletContext().setAttribute("errorList", errors);
            response.sendRedirect("errors.jsp");
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
