package DAO.impl;

import DAO.DBConnect;
import model.Course;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAOImpl extends DBConnect {

    public List<Course> getTop10CoursesByDate() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT TOP 10 * FROM tblCourse ORDER BY createdDate DESC";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Course course = new Course();
                course.setId(resultSet.getInt("id"));
                course.setName(resultSet.getString("name"));
                course.setRate(resultSet.getInt("rate"));
                course.setPrice(resultSet.getDouble("price"));
                course.setTimeCourse(resultSet.getString("time_course"));
                course.setDescription(resultSet.getString("description"));
                course.setCreatedDate(resultSet.getDate("createdDate"));
                course.setUpdatedDate(resultSet.getDate("updatedDate"));
                course.setCreatedBy(resultSet.getString("createdBy"));
                course.setUpdatedBy(resultSet.getString("updatedBy"));
                course.setIdCategory(resultSet.getLong("id_category"));
                course.setTypeCourse(resultSet.getBoolean("type_course"));
                course.setIdLessonTime(resultSet.getString("id_lesson_time"));
                course.setTotalLesson(resultSet.getInt("total_lesson"));
                course.setImg(resultSet.getString("img"));

                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return courses;
    }

}
