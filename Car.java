package dto;

public class Car {
    private int Id;
    private int cusId;
    private String licensePlate;
    private String brand;
    private String model;
    private String color;
    public Car() {
    }

    public Car(int Id, int cusId, String licensePlate, String brand, String model, String color) {
        this.Id = Id;
        this.cusId = cusId;
        this.licensePlate = licensePlate;
        this.brand = brand;
        this.model = model;
        this.color = color;
    }

    public Car(int cusId, String licensePlate, String brand, String model, String color) {
        this.cusId = cusId;
        this.licensePlate = licensePlate;
        this.brand = brand;
        this.model = model;
        this.color = color;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getCusId() {
        return cusId;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
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
