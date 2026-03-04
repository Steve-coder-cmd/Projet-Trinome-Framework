package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import models.Reservation;
import utils.DatabaseConnection;

public class ReservationService {
   public ReservationService() {
   }

   public void insert(Reservation var1) throws SQLException {
      Connection var2 = null;
      PreparedStatement var3 = null;

      try {
         var2 = DatabaseConnection.getConnection();
         String var4 = "INSERT INTO RESERVATION (idClient, nbPassagers, dateHeureArrivee, idHotel) VALUES (?, ?, ?, ?)";
         var3 = var2.prepareStatement(var4, 1);
         var3.setString(1, var1.getIdClient());
         var3.setInt(2, var1.getNbPassagers());
         var3.setTimestamp(3, Timestamp.valueOf(var1.getDateHeureArrivee()));
         var3.setInt(4, var1.getIdHotel());
         int var5 = var3.executeUpdate();
         if (var5 > 0) {
            ResultSet var6 = var3.getGeneratedKeys();
            if (var6.next()) {
               var1.setId(var6.getInt(1));
            }
         }
      } finally {
         if (var3 != null) {
            var3.close();
         }

         DatabaseConnection.closeConnection(var2);
      }

   }

   public List<Reservation> findAll() throws SQLException {
      Connection var1 = null;
      PreparedStatement var2 = null;
      ResultSet var3 = null;
      ArrayList var4 = new ArrayList();

      try {
         var1 = DatabaseConnection.getConnection();
         String var5 = "SELECT * FROM RESERVATION ORDER BY dateHeureArrivee";
         var2 = var1.prepareStatement(var5);
         var3 = var2.executeQuery();

         while(var3.next()) {
            Reservation var6 = new Reservation();
            var6.setId(var3.getInt("id"));
            var6.setIdClient(var3.getString("idClient"));
            var6.setNbPassagers(var3.getInt("nbPassagers"));
            var6.setDateHeureArrivee(var3.getTimestamp("dateHeureArrivee").toLocalDateTime());
            var6.setIdHotel(var3.getInt("idHotel"));
            var4.add(var6);
         }
      } finally {
         if (var3 != null) {
            var3.close();
         }

         if (var2 != null) {
            var2.close();
         }

         DatabaseConnection.closeConnection(var1);
      }

      return var4;
   }

   public List<Reservation> findByDateRange(Date var1, Date var2) throws SQLException {
      Connection var3 = null;
      PreparedStatement var4 = null;
      ResultSet var5 = null;
      ArrayList var6 = new ArrayList();

      try {
         var3 = DatabaseConnection.getConnection();
         String var7 = "SELECT * FROM RESERVATION WHERE dateHeureArrivee BETWEEN ? AND ? ORDER BY dateHeureArrivee";
         var4 = var3.prepareStatement(var7);
         var4.setDate(1, var1);
         var4.setDate(2, var2);
         var5 = var4.executeQuery();

         while(var5.next()) {
            Reservation var8 = new Reservation();
            var8.setId(var5.getInt("id"));
            var8.setIdClient(var5.getString("idClient"));
            var8.setNbPassagers(var5.getInt("nbPassagers"));
            var8.setDateHeureArrivee(var5.getTimestamp("dateHeureArrivee").toLocalDateTime());
            var8.setIdHotel(var5.getInt("idHotel"));
            var6.add(var8);
         }
      } finally {
         if (var5 != null) {
            var5.close();
         }

         if (var4 != null) {
            var4.close();
         }

         DatabaseConnection.closeConnection(var3);
      }

      return var6;
   }
}
