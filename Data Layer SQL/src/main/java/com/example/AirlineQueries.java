package com.example;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AirlineQueries {

    public static int getTotalNumberOfFlights() throws SQLException {
        String query = "SELECT COUNT(*) AS total_flights FROM Flights";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            if (resultSet.next()) {
                return resultSet.getInt("total_flights");
            }
        }
        return 0;
    }

    public static double getAverageFlightDistance() throws SQLException {
        String query = "SELECT AVG(flight_mileage) AS average_distance FROM Flights";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            if (resultSet.next()) {
                return resultSet.getDouble("average_distance");
            }
        }
        return 0;
    }

    public static double getAverageNumberOfSeats() throws SQLException {
        String query = "SELECT AVG(total_seats) AS average_seats FROM Flights";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            if (resultSet.next()) {
                return resultSet.getDouble("average_seats");
            }
        }
        return 0;
    }

    public static void getAverageMilesFlownByCustomerStatus() throws SQLException {
        String query = "SELECT customer_status, AVG(total_mileage) AS average_mileage " +
                "FROM Customers GROUP BY customer_status";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                String status = resultSet.getString("customer_status");
                double averageMileage = resultSet.getDouble("average_mileage");
                System.out.println("Status: " + status + ", Average Mileage: " + averageMileage);
            }
        }
    }

    public static void getMaxMilesFlownByCustomerStatus() throws SQLException {
        String query = "SELECT customer_status, MAX(total_mileage) AS max_mileage " +
                "FROM Customers GROUP BY customer_status";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                String status = resultSet.getString("customer_status");
                double maxMileage = resultSet.getDouble("max_mileage");
                System.out.println("Status: " + status + ", Max Mileage: " + maxMileage);
            }
        }
    }

    public static int getTotalNumberOfBoeingAircraft() throws SQLException {
        String query = "SELECT COUNT(*) AS total_boeing_aircraft " +
                "FROM Flights WHERE aircraft LIKE '%Boeing%'";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            if (resultSet.next()) {
                return resultSet.getInt("total_boeing_aircraft");
            }
        }
        return 0;
    }

    public static void getFlightsBetweenDistance(int minDistance, int maxDistance) throws SQLException {
        String query = "SELECT * FROM Flights WHERE flight_mileage BETWEEN " + minDistance + " AND " + maxDistance;
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                String flightNumber = resultSet.getString("flight_number");
                String aircraft = resultSet.getString("aircraft");
                int totalSeats = resultSet.getInt("total_seats");
                int flightMileage = resultSet.getInt("flight_mileage");
                System.out.println("Flight Number: " + flightNumber + ", Aircraft: " + aircraft +
                        ", Total Seats: " + totalSeats + ", Flight Mileage: " + flightMileage);
            }
        }
    }

    public static void getAverageFlightDistanceByCustomerStatus() throws SQLException {
        String query = "SELECT c.customer_status, AVG(f.flight_mileage) AS average_flight_distance " +
                "FROM Bookings b " +
                "JOIN Customers c ON b.customer_id = c.customer_id " +
                "JOIN Flights f ON b.flight_id = f.flight_id " +
                "GROUP BY c.customer_status";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                String status = resultSet.getString("customer_status");
                double averageFlightDistance = resultSet.getDouble("average_flight_distance");
                System.out.println("Status: " + status + ", Average Flight Distance: " + averageFlightDistance);
            }
        }
    }

    public static void getMostOftenBookedAircraftByGoldMembers() throws SQLException {
        String query = "SELECT f.aircraft, COUNT(*) AS booking_count " +
                "FROM Bookings b " +
                "JOIN Customers c ON b.customer_id = c.customer_id " +
                "JOIN Flights f ON b.flight_id = f.flight_id " +
                "WHERE c.customer_status = 'Gold' " +
                "GROUP BY f.aircraft " +
                "ORDER BY booking_count DESC " +
                "LIMIT 1";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            if (resultSet.next()) {
                String aircraft = resultSet.getString("aircraft");
                int bookingCount = resultSet.getInt("booking_count");
                System.out.println("Most Often Booked Aircraft by Gold Members: " + aircraft +
                        ", Booking Count: " + bookingCount);
            }
        }
    }

  
}
