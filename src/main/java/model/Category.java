package model;

import java.util.Date;

public class Category {
    private int id;
    private String name;
    private String description;
    private String updatedBy;
    private String updatedDate;
    private String createdDate;
    private String createdBy;
    private boolean status;

    // Constructors
    public Category() {
    }

    public Category(int id, String name, String description, String updatedBy, String updatedDate,
                    String createdDate, String createdBy, boolean status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.updatedBy = updatedBy;
        this.updatedDate = updatedDate;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
        this.status = status;
    }

    // Getters and Setters
    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
