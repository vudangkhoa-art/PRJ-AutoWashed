<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.Car"%>
<%@page import="dto.Customer"%>
<!DOCTYPE html>

<%
     Customer us = (Customer) session.getAttribute("USER");
    if (us == null) {
        request.getRequestDispatcher("login_page.jsp").forward(request, response);
        return;
    }
    List<Car> list = (ArrayList) request.getAttribute("LISTCARS");
    String editCarId = request.getParameter("txtid");
    request.setAttribute("EDIT_CAR_ID", editCarId);
    if(list != null && !list.isEmpty()){
%>
<html>
    <head>
        <title>Car Management</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Your Car's List</h1>
        <table border="1">
            <tr>
                <th>License Template</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Color</th>
                <th>Action</th>
            </tr>
            <%
                for(Car c : list){ 
                    boolean isEditing = (editCarId != null && editCarId.equals(String.valueOf(c.getId())));
                    
                    if(isEditing) {
         
            %>
                    <form action="UpdateCarController" method="post">
                        <input type="hidden" value="<%= c.getId() %>" name="txtid"/>
                        <tr>
                            <td>
                                <%= c.getLicensePlate() %>
                                <input type="text" value="<%= c.getLicensePlate() %>" readonly="" name="txtlicense"/>
                            </td>
                            <td><input type="text" value="<%= c.getBrand() %>" name="txtbrand"/></td>
                            <td><input type="text" value="<%= c.getModel() %>" name="txtmodel"/></td>
                            <td><input type="text" value="<%= c.getColor() %>" name="txtcolor"/></td>
                            <td>
                                <input type="submit" value="save" name="btn"/>
                                <a href="MainController?action=car_management">Cancel</a>
                            </td>
                        </tr>
                    </form>
            <%
                    } else {
            %>
                    <tr>
                        <td><%= c.getLicensePlate() %></td>
                        <td><%= c.getBrand() %></td>
                        <td><%= c.getModel() %></td>
                        <td><%= c.getColor() %></td>
                        <td>
                            <a href="MainController?action=edit_mode&txtid=<%= c.getId() %>">Edit</a> | 
                            <a href="RemoveCarController?txtid=<%= c.getId() %>" onclick="return confirm('Are you sure?')">Remove</a>
                        </td>
                    </tr>
            <% 
                    } 
                } 
            %> 
        </table> 
    </body>
</html>
<% 
    }
%>