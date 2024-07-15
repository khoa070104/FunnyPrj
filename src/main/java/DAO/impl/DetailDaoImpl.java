package DAO.impl;

import DAO.DBConnect;

import DAO.IDetailDao;
import model.detail.CourseDetail;
import model.detail.Lesson;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class DetailDaoImpl extends DBConnect implements IDetailDao {


    public List<Lesson> getLessonsByCourseId(int courseId) {
        List<Lesson> lessons = new ArrayList<>();
        String sql = "SELECT * FROM tblLesson WHERE id_course = ?";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setInt(1, courseId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Lesson lesson = new Lesson();
                lesson.setId(resultSet.getInt("id"));
                lesson.setNameLesson(resultSet.getString("namelesson"));
                lesson.setIdCourse(resultSet.getInt("id_course"));
                lesson.setContent(resultSet.getString("content"));
                lesson.setTimeLesson(resultSet.getString("time_lesson"));

                lessons.add(lesson);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException here or throw it to caller
        }

        return lessons;
    }

    public CourseDetail getCourseById(int id) {
        List<CourseDetail> courses = new ArrayList<>();
        String sql = "select c.id, c.name, c.description, c.price, c.time_course, c.id_category, " +
                "c.id_lesson_time, l.id as lesson_id, l.namelesson, l.content, l.time_lesson, c.total_lesson " +
                "from tblCourse c join tblLesson l on c.id = l.id_course where c.id = ?";
        String sql2 = "select * from tblCourse where id = ?";

        boolean hasResults = false;

        // Try the first SQL query
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                hasResults = true;
                // Course details
                int courseId = rs.getInt("id");
                String courseName = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String timeCourse = rs.getString("time_course");
                int categoryID = rs.getInt("id_category");
                String idLessonTime = rs.getString("id_lesson_time");
                int totalLesson = rs.getInt("total_lesson");

                // Lesson details
                int lessonId = rs.getInt("lesson_id");
                String lessonName = rs.getString("namelesson");
                String content = rs.getString("content");
                String timeLesson = rs.getString("time_lesson");

                // Check if course already exists in list
                CourseDetail course = null;
                for (CourseDetail c : courses) {
                    if (c.getId() == courseId) {
                        course = c;
                        break;
                    }
                }

                if (course == null) {
                    // If course does not exist, create new course and add to list
                    course = new CourseDetail();
                    course.setId(courseId);
                    course.setName(courseName);
                    course.setDescription(description);
                    course.setPrice(price);
                    course.setTimeCourse(timeCourse);
                    course.setIdCategory(categoryID);
                    course.setIdLessonTime(idLessonTime);
                    course.setTotalLesson(totalLesson);
                    course.setLessons(new ArrayList<>());
                    courses.add(course);
                }

                // Add lesson to the course's lesson list
                Lesson lesson = new Lesson();
                lesson.setId(lessonId);
                lesson.setNameLesson(lessonName);
                lesson.setContent(content);
                lesson.setTimeLesson(timeLesson);
                course.getLessons().add(lesson);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (!hasResults) {
            try (PreparedStatement statement = connection.prepareStatement(sql2)) {
                statement.setInt(1, id);
                ResultSet rs = statement.executeQuery();

                if (rs.next()) {
                    int courseId = rs.getInt("id");
                    String courseName = rs.getString("name");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    String timeCourse = rs.getString("time_course");
                    int categoryID = rs.getInt("id_category");
                    String idLessonTime = rs.getString("id_lesson_time");
                    int totalLesson = rs.getInt("total_lesson");

                    CourseDetail course = new CourseDetail();
                    course.setId(courseId);
                    course.setName(courseName);
                    course.setDescription(description);
                    course.setPrice(price);
                    course.setTimeCourse(timeCourse);
                    course.setIdCategory(categoryID);
                    course.setIdLessonTime(idLessonTime);
                    course.setTotalLesson(totalLesson);
                    course.setLessons(new ArrayList<>());

                    courses.add(course);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return courses.isEmpty() ? null : courses.get(0);
    }


    public boolean deleteLesson(int lessonId) {
        String sql = "DELETE FROM tblLesson WHERE id = ?";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setInt(1, lessonId);

            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or rethrow SQLException as appropriate for your application
        }

        return false;
    }

    public boolean createLesson(Lesson lesson) {
        String sql = "INSERT INTO tblLesson (namelesson, id_course, content, time_lesson) VALUES (?, ?, ?, ?)";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setString(1, lesson.getNameLesson());
            statement.setInt(2, lesson.getIdCourse());
            statement.setString(3, lesson.getContent());
            statement.setString(4, lesson.getTimeLesson());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or rethrow SQLException as appropriate for your application
        }

        return false;
    }

    public boolean editLesson(Lesson lesson) {
        String sql = "UPDATE tblLesson SET namelesson = ?, content = ?, time_lesson = ? WHERE id = ?";

        try (PreparedStatement statement = getConnection().prepareStatement(sql)) {
            statement.setString(1, lesson.getNameLesson());
            statement.setString(2, lesson.getContent());
            statement.setString(3, lesson.getTimeLesson());
            statement.setInt(4, lesson.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or rethrow SQLException as appropriate for your application
        }

        return false;
    }

    public static void main(String[] args) {
        DetailDaoImpl d = new DetailDaoImpl();
        //List<Lesson> lessons = d.getLessonsByCourseId(16);
//        for (Lesson lesson : lessons) {
//            System.out.println(lesson);
//        }
        CourseDetail c = d.getCourseById(5);
        System.out.println(c);
    }

}

