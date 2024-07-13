package DAO;

import model.detail.CourseDetail;
import model.detail.Lesson;
import java.util.List;

public interface IDetail {
    public List<Lesson> getLessonsByCourseId(int courseId);
    public CourseDetail getCourseById(int id);
    public boolean deleteLesson(int lessonId);
    public boolean createLesson(Lesson lesson);
    public boolean editLesson(Lesson lesson);

}
