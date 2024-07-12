package service;

import model.Category;
import model.Course;

import java.util.List;

public interface IItemService {
    public List<Course> getTop10CoursesByDate();
    public int countCoursesByCategory(int id) ;
    public int countCoursesByTypeCourse(int id);
    public int countTotalCourses();
    public List<Course> getCoursesByCategory(long categoryId);
    public List<Course> filterCoursesByCriteria(int categoryId);
    public Category getCategoryById(int id);
    public List<Course> getCoursesByCategoryId(int idCategory);
    public List<Category> getAll();
    public List<Course> searchCourses(String searchQuery);
}
