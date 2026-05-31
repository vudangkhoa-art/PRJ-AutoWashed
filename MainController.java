
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MainController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
         String url="index.jsp";
        try {
           String ac=request.getParameter("action");
          if (ac==null) ac="home";
          switch(ac) {
              case "home":
              url="index.jsp";
              break;
              case "booking":
               url="booking_page.jsp";
               break;
              case "car_management":
                  url="car_management_page.jsp";
                  break;
              case "membership":
                  url="membership_page.jsp";
                  break;
              case "about_us":
                  url="about_us.jsp";
                  break;
              case "login":
                  url="login_page.jsp";
                  break;
              case "register":
                  url="register_page.jsp";
                  break;
              case "logout":
                  url="LogoutController";
                  break;
              case "customerDashboard_page":
                  url="customerDashboard.jsp";
                  break;
                  case "edit_mode":
                  url = "GetAllCarController";
                  break;
          }  
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
