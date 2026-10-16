package loan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Opens a connection to the Loan Management System database.
 *
 * Configure these environment variables before running:
 * DB_URL, DB_USER, DB_PASSWORD
 */
public class DBConnection {

    private static final String DEFAULT_URL =
            "jdbc:mysql://localhost:3306/loan_system";

    public static Connection getConnection() {
        String url = System.getenv().getOrDefault("DB_URL", DEFAULT_URL);
        String username = System.getenv().getOrDefault("DB_USER", "root");
        String password = System.getenv("DB_PASSWORD");

        if (password == null || password.isBlank()) {
            System.out.println(
                    "Database password is not configured. Set DB_PASSWORD first.");
            return null;
        }

        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            System.out.println("Database connection failed: " + e.getMessage());
            return null;
        }
    }
}
