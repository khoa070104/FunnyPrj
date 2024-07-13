package model.detail;

public class Lesson {
    private int id;
    private String nameLesson;
    private int idCourse;
    private String content;
    private String timeLesson;

    // Constructors
    public Lesson() {}

    public Lesson(int id, String nameLesson, int idCourse, String content, String timeLesson) {
        this.id = id;
        this.nameLesson = nameLesson;
        this.idCourse = idCourse;
        this.content = content;
        this.timeLesson = timeLesson;
    }

    public Lesson(int id, String nameLesson, String content, String timeLesson) {
        this.id = id;
        this.nameLesson = nameLesson;
        this.content = content;
        this.timeLesson = timeLesson;
    }
    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameLesson() {
        return nameLesson;
    }

    public void setNameLesson(String nameLesson) {
        this.nameLesson = nameLesson;
    }

    public int getIdCourse() {
        return idCourse;
    }

    public void setIdCourse(int idCourse) {
        this.idCourse = idCourse;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTimeLesson() {
        return timeLesson;
    }

    public void setTimeLesson(String timeLesson) {
        this.timeLesson = timeLesson;
    }
}
