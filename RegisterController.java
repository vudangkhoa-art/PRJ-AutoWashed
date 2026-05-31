/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import dto.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            PrintWriter out = response.getWriter();
            out.print("<html>");
            out.print("<body>");
            out.print("</body>");
            out.print("</html>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //lay cac noi dung nguoi dung da nhap
        String fullname = request.getParameter("name");
        //String faceimage=request.getParameter("txtfaceimage");
        //String brand=request.getParameter("txtbrand");
        //String option=request.getParameter("txtchk1");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Customer c = new Customer();
        c.setFullname(fullname);
        c.setEmail(email);
        c.setPassword(password);
        CustomerDAO d = new CustomerDAO();
        Customer found = d.getCustomer(email, password);
        if (found == null) {
            int result = d.createCustomer(c);
            if (result >= 1) {
                //chen thanh cong
                //mo lai trang index.html
                response.sendRedirect("index.jsp");
            } else {
                response.getWriter().print("comming soon");
            }
        } else {
            String msg = "duplicate Email";
            request.setAttribute("ERROR", msg);
            //mo file register_page.jsp de xuat msg
            request.getRequestDispatcher("register_page.jsp").forward(request, response);
        }
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
