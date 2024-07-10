package DAO.impl;

import DAO.DBConnect;

import model.Category;
import model.Course;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAOImpl extends DBConnect {

    public List<Course> getTop10CoursesByDate() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT TOP 10 * FROM tblCourse ORDER BY createdDate DESC";

        try (
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
                course.setIdCategory(resultSet.getInt("id_category"));
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

    public int countCoursesByCategory(int id) {
        int courseCount = 0;
        String sql = "SELECT COUNT(*) AS course_count FROM tblCourse WHERE id_category = ?";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                courseCount = resultSet.getInt("course_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return courseCount;
    }

    public int countCoursesByTypeCourse(int id) {
        int courseCount = 0;
        String sql = "SELECT COUNT(*) AS course_count FROM tblCourse WHERE type_course = ?";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                courseCount = resultSet.getInt("course_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return courseCount;
    }


    public int countTotalCourses() {
        int totalCount = 0;
        String sql = "SELECT COUNT(*) AS total_count FROM tblCourse";

        try (
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql)) {

            if (resultSet.next()) {
                totalCount = resultSet.getInt("total_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return totalCount;
    }


    public List<Course> getCoursesByCategory(long categoryId) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM tblCourse WHERE id_category = ?";

        try (
                PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setLong(1, categoryId);
            ResultSet resultSet = statement.executeQuery();

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
                course.setIdCategory(resultSet.getInt("id_category"));
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

    public List<Course> filterCoursesByCriteria(Boolean typeCourse, int categoryId) {
        List<Course> courses = new ArrayList<>();
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM tblCourse WHERE 1=1");

        // Build the SQL query dynamically based on provided criteria
        List<Object> params = new ArrayList<>();

        // Filter by typeCourse
        if (typeCourse != null) {
            sqlBuilder.append(" AND type_course = ?");
            params.add(typeCourse);
        }

        // Filter by categoryId
        if (categoryId != 0) {
            sqlBuilder.append(" AND id_category = ?");
            params.add(categoryId);
        }

        // Order by createdDate descending by default
        sqlBuilder.append(" ORDER BY createdDate DESC");

        String sql = sqlBuilder.toString();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            // Set parameters
            for (int i = 0; i < params.size(); i++) {
                Object param = params.get(i);
                if (param instanceof Boolean) {
                    statement.setBoolean(i + 1, (Boolean) param);
                } else if (param instanceof Long) {
                    statement.setLong(i + 1, (Long) param);
                }
                // Add other types if necessary
            }

            ResultSet resultSet = statement.executeQuery();

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
                course.setIdCategory(resultSet.getInt("id_category"));
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

    public Category getCategoryById(int id) {
        Category category = null;
        String sql = "SELECT * FROM tblCategory WHERE id = ?";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setDescription(resultSet.getString("description"));
                category.setUpdatedBy(resultSet.getLong("updatedBy"));
                category.setUpdatedDate(resultSet.getDate("updatedDate"));
                category.setCreatedDate(resultSet.getDate("createdDate"));
                category.setCreatedBy(resultSet.getLong("createdBy"));
                category.setStatus(resultSet.getBoolean("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return category;
    }

    public List<Course> getCoursesByCategoryId(int idCategory) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM tblCourse WHERE id_category = ?";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setInt(1, idCategory);
            ResultSet resultSet = statement.executeQuery();

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
                course.setIdCategory(resultSet.getInt("id_category"));
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

    public List<Category> getAll() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM tblCategory";

        try (
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setDescription(resultSet.getString("description"));
                category.setUpdatedBy(resultSet.getLong("updatedBy"));
                category.setUpdatedDate(resultSet.getDate("updatedDate"));
                category.setCreatedDate(resultSet.getDate("createdDate"));
                category.setCreatedBy(resultSet.getLong("createdBy"));
                category.setStatus(resultSet.getBoolean("status"));

                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return categories;
    }


}




