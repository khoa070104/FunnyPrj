package model;

import java.util.Date;

public class Course {
    private int id;
    private String name;
    private Integer rate;
    private Double price;
    private String timeCourse;
    private String description;
    private String createdDate;
    private String updatedDate;
    private String createdBy;
    private String updatedBy;
    private int idCategory;
    private Boolean typeCourse; // true for zoom, false for record
    private String idLessonTime;
    private Integer totalLesson;
    private String img;

    // Constructors
    public Course() {
    }

    public Course(String name, Integer rate, Double price, String timeCourse, String description,
                  String createdDate, String updatedDate, String createdBy, String updatedBy,
                  int idCategory, Boolean typeCourse, String idLessonTime, Integer totalLesson, String img) {
        this.name = name;
        this.rate = rate;
        this.price = price;
        this.timeCourse = timeCourse;
        this.description = description;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.createdBy = createdBy;
        this.updatedBy = updatedBy;
        this.idCategory = idCategory;
        this.typeCourse = typeCourse;
        this.idLessonTime = idLessonTime;
        this.totalLesson = totalLesson;
        this.img = img;
    }

    // Getters and setters
    public int getId() {
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

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getTimeCourse() {
        return timeCourse;
    }

    public void setTimeCourse(String timeCourse) {
        this.timeCourse = timeCourse;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public Boolean getTypeCourse() {
        return typeCourse;
    }

    public void setTypeCourse(Boolean typeCourse) {
        this.typeCourse = typeCourse;
    }

    public String getIdLessonTime() {
        return idLessonTime;
    }

    public void setIdLessonTime(String idLessonTime) {
        this.idLessonTime = idLessonTime;
    }

    public Integer getTotalLesson() {
        return totalLesson;
    }

    public void setTotalLesson(Integer totalLesson) {
        this.totalLesson = totalLesson;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
