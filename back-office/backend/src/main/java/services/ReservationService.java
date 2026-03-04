package services;

import models.Reservation;
import utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationService {
    
    public void insert(Reservation reservation) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        
        try {
            connection = DatabaseConnection.getConnection();
            String sql = "INSERT INTO RESERVATION (idClient, nbPassagers, dateHeureArrivee, idHotel) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            statement.setString(1, reservation.getIdClient());
            statement.setInt(2, reservation.getNbPassagers());
            statement.setTimestamp(3, Timestamp.valueOf(reservation.getDateHeureArrivee()));
            statement.setInt(4, reservation.getIdHotel());
            
            int affectedRows = statement.executeUpdate();
            
            if (affectedRows > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    reservation.setId(generatedKeys.getInt(1));
                }
            }
        } finally {
            if (statement != null) {
                statement.close();
            }
            DatabaseConnection.closeConnection(connection);
        }
    }
    
    public List<Reservation> findAll() throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Reservation> reservations = new ArrayList<>();
        
        try {
            connection = DatabaseConnection.getConnection();
            String sql = "SELECT * FROM RESERVATION ORDER BY dateHeureArrivee";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(resultSet.getInt("id"));
                reservation.setIdClient(resultSet.getString("idClient"));
                reservation.setNbPassagers(resultSet.getInt("nbPassagers"));
                reservation.setDateHeureArrivee(resultSet.getTimestamp("dateHeureArrivee").toLocalDateTime());
                reservation.setIdHotel(resultSet.getInt("idHotel"));
                reservations.add(reservation);
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            DatabaseConnection.closeConnection(connection);
        }
        
        return reservations;
    }
    
    public List<Reservation> findByDateRange(Date startDate, Date endDate) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Reservation> reservations = new ArrayList<>();
        
        try {
            connection = DatabaseConnection.getConnection();
            String sql = "SELECT * FROM RESERVATION WHERE dateHeureArrivee BETWEEN ? AND ? ORDER BY dateHeureArrivee";
            statement = connection.prepareStatement(sql);
            statement.setDate(1, startDate);
            statement.setDate(2, endDate);
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(resultSet.getInt("id"));
                reservation.setIdClient(resultSet.getString("idClient"));
                reservation.setNbPassagers(resultSet.getInt("nbPassagers"));
                reservation.setDateHeureArrivee(resultSet.getTimestamp("dateHeureArrivee").toLocalDateTime());
                reservation.setIdHotel(resultSet.getInt("idHotel"));
                reservations.add(reservation);
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            DatabaseConnection.closeConnection(connection);
        }
        
        return reservations;
    }
}
