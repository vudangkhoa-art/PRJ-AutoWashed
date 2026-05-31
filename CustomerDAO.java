/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbutils.DBUtils;
import dto.Customer;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author user
 */
public class CustomerDAO {

    public int createCustomer(Customer c) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "insert dbo.Customers(FullName,PhoneNumber,Password,[Email],[TierID],[CurrentPoints],[TotalSpend],Status)\n"
                        + "		values(?,?,?,?,?,?,?,?)";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, c.getFullname());
                st.setString(2, c.getPhoneNumber());
                st.setString(3, c.getPassword());
                st.setString(4, c.getEmail());
                st.setInt(5, c.getTierID());
                st.setInt(6, c.getCurrentPoints());
                st.setInt(7, c.getTotalSpend());
                st.setBoolean(8, true);
                result = st.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public Customer getCustomer(String email, String password) {
    Customer result = null;
    Connection cn = null;

    try {
        cn = DBUtils.getConnection();

        if (cn != null) {

            String sql =
                    "SELECT CustomerID, FullName, Email, PhoneNumber, "
                    + "TierID, CurrentPoints, TotalSpend, Password, "
                    + "CreatedAt, Status "
                    + "FROM Customers "
                    + "WHERE Email = ? AND Password = ?";

            PreparedStatement st = cn.prepareStatement(sql);

            st.setString(1, email);
            st.setString(2, password);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {

                int cusId = rs.getInt("CustomerID");
                String fullName = rs.getString("FullName");
                String customerEmail = rs.getString("Email");
                String phoneNumber = rs.getString("PhoneNumber");

                int tierID = rs.getInt("TierID");
                int currentPoints = rs.getInt("CurrentPoints");
                int totalSpend = rs.getInt("TotalSpend");

                String customerPassword = rs.getString("Password");

                Date createdAt = rs.getDate("CreatedAt");

                boolean status = rs.getBoolean("Status");

                result = new Customer(
                        cusId,
                        fullName,
                        customerEmail,
                        phoneNumber,
                        tierID,
                        currentPoints,
                        totalSpend,
                        customerPassword,
                        createdAt,
                        status
                );
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (cn != null) {
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return result;
}

    public int updateCustomer(Customer c) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE Customers\n"
                        + "SET FullName = ?,\n"
                        + "    PhoneNumber = ?,\n"
                        + "    Email = ?\n"
                        + "WHERE CustomerID = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, c.getFullname());
                st.setString(2, c.getPhoneNumber());
                st.setString(3, c.getEmail());
                st.setInt(4, c.getCusId());
                result = st.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public int deleteCustomer(Customer c) {

        int result = 0;
        Connection cn = null;

        try {
            cn = DBUtils.getConnection();
            String sql = "UPDATE Customers \n"
                    + "SET Status = 0\n"
                    + "WHERE CustomerID = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, c.getCusId());

            result = st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }
    public Customer getCustomerByEmail(String email) {
    Customer result = null;
    Connection cn = null;

    try {
        cn = DBUtils.getConnection();

        if(cn != null) {
            String sql =
                "SELECT * FROM Customers WHERE Email = ?";

            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();

            if(rs.next()) {
                result = new Customer();
                result.setCusId(rs.getInt("CustomerID"));
                result.setEmail(rs.getString("Email"));
            }
        }
    } catch(Exception e) {
        e.printStackTrace();
    }

    return result;
}
}
