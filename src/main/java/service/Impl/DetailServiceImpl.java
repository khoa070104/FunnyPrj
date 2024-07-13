package service.Impl;

import DAO.IDetail;
import DAO.impl.DetailDAOImpl;
import model.detail.CourseDetail;
import model.detail.Lesson;
import service.IDetailService;

import java.util.List;

public class DetailServiceImpl implements IDetailService {
    IDetail i = new DetailDAOImpl();
    @Override
    public List<Lesson> getLessonsByCourseId(int courseId) {
        return i.getLessonsByCourseId(courseId);
    }

    @Override
    public CourseDetail getCourseById(int id) {
        return i.getCourseById(id);
    }

    @Override
    public boolean deleteLesson(int lessonId) {
        return i.deleteLesson(lessonId);
    }

    @Override
    public boolean createLesson(Lesson lesson) {
        return i.createLesson(lesson);
    }

    @Override
    public boolean editLesson(Lesson lesson) {
        return  i.editLesson(lesson);
    }
}
