<%@page import="java.util.List"%>
<%@page import="dto.Customer"%>
<%@page import="dto.Booking"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Customer us = (Customer) session.getAttribute("USER");
    if (us == null) {
        request.getRequestDispatcher("login_page.jsp").forward(request, response);
        return; 
    }
    
    List<Booking> historyList = (List<Booking>) request.getAttribute("BOOKING_HISTORY");
    
    String tierName = (String) request.getAttribute("TIER_NAME");
    if(tierName == null) tierName = "Member"; 
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard - G6 CARWASH</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
<body>

    <div class="dashboard-container">
        <div class="profile-grid">
            <div class="membership-card">
                <div class="card-brand"><i class="fa-solid fa-id-card"></i> G6 MEMBERSHIP</div>
                <div class="card-holder">
                    <label>Card Holder</label>
                    <div class="name"><%= us.getFullName() %></div>
                </div>
                
                <div class="card-stats">
                    <label><i class="fa-solid fa-wallet"></i> Total Spent</label>
                    <div class="amount"><%= String.format("%,.0f", us.getTotalSpend()) %> VND</div>
                </div>

                <div class="card-meta">
                    <div>
                        <label style="font-size: 11px; color: #64748b; display:block;">Phone (ID)</label>
                        <span style="font-size: 14px; font-weight: 500;"><%= us.getPhoneNumber() %></span>
                    </div>
                    <span class="rank-badge"><%= tierName %></span>
                </div>
            </div>

            <div class="profile-details">
                <h2 class="section-title">Personal Information</h2>
                <form action="UpdateProfileController" method="POST">
                    <div class="form-group">
                        <label>Phone Number (Login ID)</label>
                        <input type="text" class="form-control" value="<%= us.getPhoneNumber() %>" disabled />
                    </div>
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" class="form-control" name="txtfullname" value="<%= us.getFullName() %>" required />
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" name="txtemail" value="<%= us.getEmail() != null ? us.getEmail() : "" %>" />
                    </div>
                    <button type="submit" class="btn-save"><i class="fa-solid fa-floppy-disk"></i> Save Changes</button>
                </form>
            </div>
        </div>

        <div class="history-section">
            <h2 class="section-title"><i class="fa-solid fa-clock-rotate-left"></i> Booking & Transaction History</h2>
            <table class="history-table">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Car License</th>
                        <th>Service Name</th>
                        <th>Date</th>
                        <th>Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if(historyList != null && !historyList.isEmpty()) {
                            for(Booking b : historyList) {
                                String statusClass = "status-pending";
                                if("Completed".equalsIgnoreCase(b.getBookingStatus())) {
                                    statusClass = "status-done";
                                }
                    %>
                    <tr>
                        <td>#BK-<%= b.getBookingID() %></td>
                        <td><span style="background:#0f172a; padding:4px 8px; border-radius:4px; font-weight:600;"><%= b.getLicensePlate() %></span></td>
                        <td><%= b.getServiceName() %></td>
                        <td><%= b.getBookingDate() %></td>
                        <td style="color: #22c55e; font-weight: 600;"><%= String.format("%,.0f", b.getTotalAmount()) %> VND</td>
                        <td><span class="status-badge <%= statusClass %>"><%= b.getBookingStatus() %></span></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" style="text-align: center; color: #64748b; padding: 20px; font-style: italic;">You haven't made any bookings yet.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>