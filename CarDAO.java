package dao;

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
                String sql = "SELECT * "
                        + "FROM Vehicles "
                        + "WHERE VehicleID=?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, carId);
                ResultSet table=st.executeQuery();
                if(table.next()){
                    return new Car(
                        table.getInt("VehicleID"),
                        table.getInt("CustomerID"),
                        table.getString("LicensePlate"),
                        table.getString("Brand"),
                        table.getString("Model"),
                        table.getString("Color")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean saveCar(Car car){
        Connection cn=null;
        try {
            cn=DBUtils.getConnection();
            if(cn!=null){
                String sql = "INSERT INTO Vehicles "
                        + "(CustomerID, LicensePlate, Brand, Model, Color) "
                        + "VALUES (?, ?, ?, ?, ?)";
                PreparedStatement st=cn.prepareStatement(sql);
                st.setInt(1, car.getCusId());
                st.setString(2, car.getLiensePlate());
                st.setString(3, car.getBrand());
                st.setString(4, car.getModel());
                st.setString(5, car.getColor());
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
                String sql = "DELETE FROM Vehicles "
                        + "WHERE VehicleID=?";
                PreparedStatement st=cn.prepareStatement(sql);
                st.setInt(1, carId);
                return st.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
