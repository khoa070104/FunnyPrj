package service.Impl;

import DAO.impl.ItemDAOImpl;
import model.Course;
import service.IItemService;

import java.util.List;

public class ItemServiceImpl implements IItemService {
    @Override
    public int countNumCourse(int i) {
        return new ItemDAOImpl().countCoursesByCategory(i);
    }
    @Override
    public int countTotal() {
        return new ItemDAOImpl().countTotalCourses();
    }

    @Override
    public int countTotalTypeCourse(int i) {
        return new ItemDAOImpl().countCoursesByTypeCourse(i);
    }

    @Override
    public List<Course> filterCoursesByCriteria(Boolean typeCourse, int categoryId) {
        return new ItemDAOImpl().filterCoursesByCriteria(typeCourse, categoryId);
    }
}
