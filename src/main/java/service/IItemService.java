package service;

import model.Category;
import model.Course;
import model.LessonTime;

import java.util.List;

public interface IItemService {
    public List<Course> getTop10CoursesByDate();
    public int countCoursesByCategory(int id) ;
    public int countCoursesByTypeCourse(int id);
    public int countTotalCourses();
    public List<Course> getCoursesByCategory(long categoryId);
    public List<Course> filterCoursesByCriteria(int categoryId);
    public Category getCategoryById(int id);
    //public List<Course> getCoursesByCategoryId(int idCategory);
    public List<Category> getAll();
    public List<Course> searchCourses(String searchQuery);
    public void deleteCourse(int courseId);
    public List<LessonTime> getAllLessonTimes();
    public boolean createCourse(String name, Double price, String description, int typeCourse, String idLessonTime, int idCategory, String img);
    public Course getCourseById(int id);
    public void updateCourse(Course course);
    public void updateCourseWithoutImg(Course course);
    public List<Course> searchCourse(String courseName);
    //List<Course> getAllCourses();
}
