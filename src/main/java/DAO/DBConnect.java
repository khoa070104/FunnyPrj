package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.InputStream;
import java.util.Properties;

public class DBConnect {
    protected Connection connection;

    public DBConnect() {
        Properties properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                System.out.println("Sorry, unable to find db.properties");
                return;
            }

            // Load the properties file
            properties.load(input);

            String url = properties.getProperty("db.url");
            String username = properties.getProperty("db.username");
            String password = properties.getProperty("db.password");
            String driver = properties.getProperty("db.driver");

            // Load the JDBC driver
            Class.forName(driver);

            // Establish the connection
            connection = DriverManager.getConnection(url, username, password);
            if (connection != null) {
                System.out.println("Connection established successfully.");
            }
//        } catch (ClassNotFoundException e) {
//            System.err.println("SQL Server JDBC Driver not found.");
//            e.printStackTrace();
//        } catch (SQLException e) {
//            System.err.println("Connection failed. Check the output console.");
//            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("An error occurred.");
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Connection closed successfully.");
            }
        } catch (SQLException e) {
            System.err.println("Error closing connection: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        new DBConnect();
    }
}
