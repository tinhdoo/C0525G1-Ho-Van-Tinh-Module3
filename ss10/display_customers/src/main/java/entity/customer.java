package entity;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class customer {
    private String name;
    private LocalDate dob;
    private String address;
    private String img;

    public customer() {
    }

    public customer(String name, LocalDate dob, String address, String img) {
        this.name = name;
        this.dob = dob;
        this.address = address;
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public String getDobFormatted() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        return dob.format(formatter);
    }
}
