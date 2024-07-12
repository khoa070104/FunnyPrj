package DAO.impl;

import DAO.DBConnect;

import DAO.IItemDao;
import model.Category;
import model.Course;
import model.LessonTime;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAOImpl extends DBConnect implements IItemDao {

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
                course.setCreatedDate(resultSet.getString("createdDate"));
                course.setUpdatedDate(resultSet.getString("updatedDate"));
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
                course.setCreatedDate(resultSet.getString("createdDate"));
                course.setUpdatedDate(resultSet.getString("updatedDate"));
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

    public List<Course> filterCoursesByCriteria(int categoryId) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM tblCourse WHERE 1=1";

        // Filter by categoryId
        if (categoryId != 0) {
            sql += " AND id_category = ?";
        }

        // Order by createdDate descending by default
        sql+= " ORDER BY createdDate DESC";


        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            if(categoryId != 0) statement.setInt(1, categoryId);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Course course = new Course();
                course.setId(resultSet.getInt("id"));
                course.setName(resultSet.getString("name"));
                course.setRate(resultSet.getInt("rate"));
                course.setPrice(resultSet.getDouble("price"));
                course.setTimeCourse(resultSet.getString("time_course"));
                course.setDescription(resultSet.getString("description"));
                course.setCreatedDate(resultSet.getString("createdDate"));
                course.setUpdatedDate(resultSet.getString("updatedDate"));
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

    public Course getCourseById(int id) {
        Course course = null;
        String sql = "SELECT * FROM tblCourse WHERE id = ?";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                course = new Course();
                course.setId(resultSet.getInt("id"));
                course.setName(resultSet.getString("name"));
                course.setPrice(resultSet.getDouble("price"));
                course.setDescription(resultSet.getString("description"));
                course.setTypeCourse(resultSet.getBoolean("type_course"));
                course.setIdLessonTime(resultSet.getString("id_lesson_time"));
                course.setIdCategory(resultSet.getInt("id_category"));
                course.setImg(resultSet.getString("img"));
                course.setCreatedDate(resultSet.getDate("createdDate"));
                course.setUpdatedDate(resultSet.getDate("updatedDate"));
                course.setCreatedBy(resultSet.getString("createdBy"));
                course.setUpdatedBy(resultSet.getString("updatedBy"));
                course.setTotalLesson(resultSet.getInt("total_lesson"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return course;
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

    public Course getCoursesByCategoryId(int idCategory) {
        Course course = new Course();
        String sql = "SELECT * FROM tblCourse WHERE id_category = ?";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setInt(1, idCategory);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                course.setId(resultSet.getInt("id"));
                course.setName(resultSet.getString("name"));
                course.setRate(resultSet.getInt("rate"));
                course.setPrice(resultSet.getDouble("price"));
                course.setTimeCourse(resultSet.getString("time_course"));
                course.setDescription(resultSet.getString("description"));
                course.setCreatedDate(resultSet.getString("createdDate"));
                course.setUpdatedDate(resultSet.getString("updatedDate"));
                course.setCreatedBy(resultSet.getString("createdBy"));
                course.setUpdatedBy(resultSet.getString("updatedBy"));
                course.setIdCategory(resultSet.getInt("id_category"));
                course.setTypeCourse(resultSet.getBoolean("type_course"));
                course.setIdLessonTime(resultSet.getString("id_lesson_time"));
                course.setTotalLesson(resultSet.getInt("total_lesson"));
                course.setImg(resultSet.getString("img"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return course;
    }

    public List<Category> getAll() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM tblCategory";

        try (
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()) {

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
    public List<Course> searchCourses(String searchQuery)  {
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
                    course.setIdCategory(rs.getInt("id_category"));
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

    public void deleteCourse(int courseId) {
        String sql = "DELETE FROM tblCourse WHERE id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, courseId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean createCourse(String name, Double price, String description, int typeCourse, String idLessonTime, int idCategory, String img) {
        String sql = "INSERT INTO tblCourse (name, price, description, type_course, id_lesson_time, id_category, img) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, description);
            ps.setInt(4, typeCourse);
            ps.setString(5, idLessonTime);
            ps.setInt(6, idCategory);
            ps.setString(7, img);

            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public List<LessonTime> getAllLessonTimes() {
        List<LessonTime> lessonTimes = new ArrayList<>();
        String sql = "SELECT * FROM tblLessonTime";

        try (
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                LessonTime lessonTime = new LessonTime();
                lessonTime.setId(resultSet.getString("id"));
                lessonTime.setName(resultSet.getString("name"));

                lessonTimes.add(lessonTime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return lessonTimes;
    }

    public void updateCourse(Course course) {
        String sql = "UPDATE tblCourse SET name=?, price=?, description=?, type_course=?, " +
                "id_lesson_time=?, id_category=?, img=? WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, course.getName());
            stmt.setDouble(2, course.getPrice());
            stmt.setString(3, course.getDescription());
            stmt.setBoolean(4, course.getTypeCourse());
            stmt.setString(5, course.getIdLessonTime());
            stmt.setInt(6, course.getIdCategory());
            stmt.setString(7, course.getImg());
            stmt.setInt(8, course.getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCourseWithoutImg(Course course) {
        String sql = "UPDATE tblCourse SET name=?, price=?, description=?, type_course=?, " +
                "id_lesson_time=?, id_category=? WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, course.getName());
            stmt.setDouble(2, course.getPrice());
            stmt.setString(3, course.getDescription());
            stmt.setBoolean(4, course.getTypeCourse());
            stmt.setString(5, course.getIdLessonTime());
            stmt.setInt(6, course.getIdCategory());
            stmt.setInt(7, course.getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ItemDAOImpl i = new ItemDAOImpl();
        i.deleteCourse(3);
    }


}




