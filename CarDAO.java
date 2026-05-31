/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author admin
 */
import dbutils.DBUtils;
import dto.Car;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {
    public List<Car> getAllCars(int cusId){
        List<Car> carList=new ArrayList<>();
        Connection cn=null;
        try {
            cn=DBUtils.getConnection();
            
            if(cn!=null){
                String sql = "SELECT [VehicleID],\n"
                        + "[CustomerID],\n"
                        + "[LicensePlate],\n"
                        + "[Brand],\n"
                        + "[Model],\n"
                        + "[Color]\n"
                        + "FROM [AutoWashPro].[dbo].[Vehicles]\n"
                        + "WHERE [CustomerID]=?";
                
                PreparedStatement st=cn.prepareStatement(sql);
                
                st.setInt(1, cusId);
                
                ResultSet table=st.executeQuery();
                if(table!=null){
                    while(table.next()){
                        int carId=table.getInt("VehicleID");
                        String licensePlate=table.getString("LicensePlate");
                        String brand=table.getString("Brand");
                        String model=table.getString("Model");
                        String color=table.getString("Color");
                        Car c=new Car(carId, cusId, licensePlate, brand, model, color);
                        carList.add(c);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return carList;
    }
    
    public Car getCarById(int carId){
        Connection cn=null;
        try {
            cn=DBUtils.getConnection();
            
            if(cn!=null){
                String sql="SELECT [VehicleID],\n"
                        + "[CustomerID],\n"
                        + "[LicensePlate],\n"
                        + "[Brand],\n"
                        + "[Model],\n"
                        + "[Color]\n"
                        + "FROM [AutoWashPro].[dbo].[Vehicles]\n"
                        + "WHERE [VehicleID]=?";

                PreparedStatement st=cn.prepareStatement(sql);
                
                st.setInt(1,carId);

                ResultSet table=st.executeQuery();

                if(table!=null){
                    if(table.next()){
                        int cusId=table.getInt("CustomerID");
                        String licensePlate=table.getString("LicensePlate");
                        String brand=table.getString("Brand");
                        String model=table.getString("Model");
                        String color=table.getString("Color");
                        Car car=new Car(carId, cusId, licensePlate, brand, model, color);
                        return car;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean isLicensePlateExist(String licensePlate){
        Connection cn=null;
        try {
            cn=DBUtils.getConnection();
            if(cn!=null){
                String sql="SELECT [VehicleID]\n"
                        + "FROM [AutoWashPro].[dbo].[Vehicles]\n"
                        + "WHERE [LicensePlate]=?";

                PreparedStatement st=cn.prepareStatement(sql);
                st.setString(1,licensePlate);

                ResultSet table=st.executeQuery();

                if(table!=null){
                    return table.next();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean saveCar(Car car){
        Connection cn=null;
        try {
            cn=DBUtils.getConnection();
            
            if(cn!=null){
                String sql="INSERT INTO [AutoWashPro].[dbo].[Vehicles]\n"
                        + "([CustomerID],\n"
                        + "[LicensePlate],\n"
                        + "[Brand],\n"
                        + "[Model],\n"
                        + "[Color])\n"
                        + "VALUES(?,?,?,?,?)";

                PreparedStatement st=cn.prepareStatement(sql);
                
                st.setInt(1,car.getCusId());
                st.setString(2,car.getLicensePlate());
                st.setString(3,car.getBrand());
                st.setString(4,car.getModel());
                st.setString(5,car.getColor());

                return st.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean removeCar(int carId){
        Connection cn=null;
        try {
            cn=DBUtils.getConnection();
            
            if(cn!=null){
                String sql="DELETE FROM [AutoWashPro].[dbo].[Vehicles]\n"
                        + "WHERE [VehicleID]=?";

                PreparedStatement st=cn.prepareStatement(sql);
                
                st.setInt(1,carId);

                return st.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateCar(Car car){
        Connection cn=null;
        try{
            cn=DBUtils.getConnection();

            if(cn!=null){
                String sql
                        = "UPDATE [AutoWashPro].[dbo].[Vehicles]\n"
                        + "SET "
                        + "[Brand]=?, "
                        + "[Model]=?, "
                        + "[Color]=? "
                        + "WHERE [VehicleID]=?";

                PreparedStatement st=cn.prepareStatement(sql);

                st.setString(1, car.getBrand());
                st.setString(2, car.getModel());
                st.setString(3, car.getColor());
                st.setInt(4, car.getId());

                return st.executeUpdate()>0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
