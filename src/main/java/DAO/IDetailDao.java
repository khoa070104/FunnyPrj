package DAO;

import model.Post;
import model.detail.CourseDetail;
import model.detail.Lesson;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface IDetailDao {
    public List<Lesson> getLessonsByCourseId(int courseId);
    public CourseDetail getCourseById(int id);
    public boolean deleteLesson(int lessonId);
    public boolean createLesson(Lesson lesson);
    public boolean editLesson(Lesson lesson);

}
