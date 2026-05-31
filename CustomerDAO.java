/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbutils.DBUtils;
import dto.customer;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author user
 */
public class CustomerDAO {

    public int createCustomer(customer c) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "insert dbo.Customers(FullName,PhoneNumber,Password,[Email],[TierID],[CurrentPoints],[TotalSpend],Status)\n"
                        + "		value(?,?,?,?,?,?,?,?)";
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

    public customer getCustomer(String email, String password) {
        customer result = null;
        Connection cn = null;
        try {
            //buoc 1: make connection
            cn = DBUtils.getConnection();
            if (cn != null) {
                //buoc 2 : viet sql
                String sql = "select [CustomerID],FullName,Email,password,TierID,[CurrentPoints],[TotalSpend],Status\n"
                        + "from dbo.Customers\n"
                        + "where Email=? and password=?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, email);
                st.setString(2, password);

                ResultSet table = st.executeQuery();
                //buoc 3: doc data trong bien table
                while (table.next()) {
                    int cusid = table.getInt("CustomerID");
                    String name = table.getString("FullName");
                    //String email=table.getString("Email");
                    //String password=table.getString("password");
                    int tierid = table.getInt("TierID");
                    Date createDate = table.getDate("CreatedAt");
                    boolean status = table.getBoolean("status");
                    result = new customer(cusid, name, email, name, tierid,
                            cusid, tierid, password, createDate, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //buoc 4
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public int updateCustomer(customer c) {
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

    public int deleteCustomer(customer c) {

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
}
