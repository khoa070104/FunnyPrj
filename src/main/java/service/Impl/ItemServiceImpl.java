package service.Impl;

import DAO.IItemDao;
import DAO.impl.ItemDAOImpl;
import model.Category;
import model.Course;
import model.LessonTime;
import service.IItemService;

import java.util.List;

public class ItemServiceImpl implements IItemService {
    private IItemDao itemDao = new ItemDAOImpl();
    @Override
    public int countCoursesByCategory(int i) {
        return itemDao.countCoursesByCategory(i);
    }
    @Override
    public int countTotalCourses() {
        return itemDao.countTotalCourses();
    }

    @Override
    public int countCoursesByTypeCourse(int i) {
        return itemDao.countCoursesByTypeCourse(i);
    }

    @Override
    public List<Course> filterCoursesByCriteria(int categoryId) {
        return itemDao.filterCoursesByCriteria(categoryId);
    }

    @Override
    public List<Course> getTop10CoursesByDate() {
        return itemDao.getTop10CoursesByDate();
    }

    @Override
    public List<Course> getCoursesByCategory(long categoryId) {
        return itemDao.getCoursesByCategory(categoryId);
    }

    @Override
    public Category getCategoryById(int id) {
        return itemDao.getCategoryById(id);
    }

//    @Override
//    public List<Course> getCoursesByCategoryId(int idCategory) {
//        return itemDao.getCoursesByCategoryId(idCategory);
//    }
    public void deleteCourse(int courseId){
        itemDao.deleteCourse(courseId);
    }

    @Override
    public List<Category> getAll() {
        return itemDao.getAll();
    }

    @Override
    public List<Course> searchCourses(String searchQuery) {
        return itemDao.searchCourses(searchQuery);
    }
    public List<LessonTime> getAllLessonTimes(){
        return itemDao.getAllLessonTimes();
    }
    public boolean createCourse(String name, Double price, String description, int typeCourse, String idLessonTime, int idCategory, String img){
        return itemDao.createCourse(name, price, description, typeCourse, idLessonTime, idCategory, img);

    }
    public Course getCourseById(int id){
        return itemDao.getCourseById(id);
    }
    public void updateCourse(Course course) {
        itemDao.updateCourse(course);
    }
    public void updateCourseWithoutImg(Course course) {
        itemDao.updateCourseWithoutImg(course);
    }
}
