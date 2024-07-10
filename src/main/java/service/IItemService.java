package service;

import model.Course;

import java.util.List;

public interface IItemService {
    public int countNumCourse(int i);
    public int countTotal();
    public int countTotalTypeCourse(int i);

    List<Course> filterCoursesByCriteria(Boolean typeCourse, int categoryId);
}
