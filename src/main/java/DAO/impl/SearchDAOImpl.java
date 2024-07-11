package DAO.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import DAO.DBConnect;
import model.Course;

public class SearchDAOImpl extends DBConnect {

    public List<Course> searchCourses(String searchQuery) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.id, c.name, c.rate, c.price, c.time_course, c.description, " +
                "       c.createddate, c.updateddate, c.createdby, c.updatedby, c.id_category, " +
                "       c.type_course, c.id_lesson_time, c.total_lesson, c.img " +
                "FROM [dbo].[tblcourse] c " +
                "JOIN [dbo].[tblcategory] cat ON c.id_category = cat.id " +
                "WHERE LOWER(c.name) LIKE ? " +
                "   OR LOWER(c.description) LIKE ? " +
                "   OR LOWER(cat.name) LIKE ? " + // Tìm kiếm theo tên danh mục
                "   OR CAST(c.id_category AS VARCHAR) LIKE ?"; // Tìm kiếm theo id_category

        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            String searchPattern = "%" + searchQuery.toLowerCase() + "%"; // Chuyển đổi tìm kiếm thành chữ thường
            stmt.setString(1, searchPattern.toLowerCase()); // Tìm kiếm theo tên khóa học
            stmt.setString(2, searchPattern.toLowerCase()); // Tìm kiếm theo mô tả khóa học
            stmt.setString(3, searchPattern.toLowerCase()); // Tìm kiếm theo tên danh mục
            stmt.setString(4, searchPattern); // Tìm kiếm theo id_category (có thể không cần lowercase)

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Course course = new Course();
                    course.setId(rs.getInt("id"));
                    course.setName(rs.getString("name"));
                    course.setRate(rs.getInt("rate"));
                    course.setPrice(rs.getDouble("price"));
                    course.setTimeCourse(rs.getString("time_course"));
                    course.setDescription(rs.getString("description"));
                    course.setCreatedDate(rs.getString("createddate"));
                    course.setUpdatedDate(rs.getString("updateddate"));
                    course.setCreatedBy(rs.getString("createdby"));
                    course.setUpdatedBy(rs.getString("updatedby"));
                    course.setIdCategory(rs.getLong("id_category"));
                    course.setTypeCourse(rs.getBoolean("type_course")); // true cho zoom, false cho record
                    course.setIdLessonTime(rs.getString("id_lesson_time"));
                    course.setTotalLesson(rs.getInt("total_lesson"));
                    course.setImg(rs.getString("img"));
                    courses.add(course);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public static void main(String[] args) {
        // Ví dụ kiểm tra tìm kiếm với chuỗi chữ thường
        List<Course> lCourse = new SearchDAOImpl().searchCourses("3"); // Thay đổi chuỗi tìm kiếm
        for (Course c : lCourse) {
            System.out.println(c.getName());
        }
    }
}
