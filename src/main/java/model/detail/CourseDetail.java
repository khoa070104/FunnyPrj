package model.detail;

import java.util.Date;
import java.util.List;

public class CourseDetail {
    private int id;
    private String name;
    private String description;
    private Double price;
    private String timeCourse;




    private int idCategory;
    private Boolean typeCourse; // true for zoom, false for record
    private String idLessonTime;
    private Integer totalLesson;
    private List<Lesson> lessons;

    // Constructors
    public CourseDetail() {
    }

    public String getTimeCourse() {
        return timeCourse;
    }

    public void setTimeCourse(String timeCourse) {
        this.timeCourse = timeCourse;
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

    public List<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
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


    public Double getPrice() {                   
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
