package dto;

public class Car {
    private int carId;
    private int cusId;
    private String liensePlate;
    private String brand;
    private String model;
    private String color;
    public Car() {
    }

    public Car(int carId, int cusId, String liensePlate, String brand, String model, String color) {
        this.carId = carId;
        this.cusId = cusId;
        this.liensePlate = liensePlate;
        this.brand = brand;
        this.model = model;
        this.color = color;
    }

    public Car(int cusId, String liensePlate, String brand, String model, String color) {
        this.cusId = cusId;
        this.liensePlate = liensePlate;
        this.brand = brand;
        this.model = model;
        this.color = color;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public int getCusId() {
        return cusId;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
    }

    public String getLiensePlate() {
        return liensePlate;
    }

    public void setLiensePlate(String liensePlate) {
        this.liensePlate = liensePlate;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
