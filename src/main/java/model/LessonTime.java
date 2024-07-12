package model;

public class LessonTime {
    private String id;
    private String name;

    // Constructors
    public LessonTime() {
    }

    public LessonTime(String id, String name) {
        this.id = id;
        this.name = name;
    }

    // Getters and setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
