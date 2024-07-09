package service.Impl;

import DAO.impl.ItemDAOImpl;
import service.IItemService;

public class ItemServiceImpl implements IItemService {
    @Override
    public int countNumCourse(int i) {
        return new ItemDAOImpl().countCoursesByCategory(i);
    }
    @Override
    public int countTotal() {
        return new ItemDAOImpl().countTotalCourses();
    }
}
