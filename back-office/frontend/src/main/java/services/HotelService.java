package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Hotel;
import utils.DatabaseConnection;

public class HotelService {
   public HotelService() {
   }

   public static void insert(Hotel var0) throws SQLException {
      Connection var1 = null;
      PreparedStatement var2 = null;

      try {
         var1 = DatabaseConnection.getConnection();
         String var3 = "INSERT INTO HOTEL (nom) VALUES (?)";
         var2 = var1.prepareStatement(var3, 1);
         var2.setString(1, var0.getNom());
         int var4 = var2.executeUpdate();
         if (var4 > 0) {
            ResultSet var5 = var2.getGeneratedKeys();
            if (var5.next()) {
               var0.setId(var5.getInt(1));
            }
         }
      } finally {
         if (var2 != null) {
            var2.close();
         }

         DatabaseConnection.closeConnection(var1);
      }

   }

   public List<Hotel> findAll() throws SQLException {
      Connection var1 = null;
      PreparedStatement var2 = null;
      ResultSet var3 = null;
      ArrayList var4 = new ArrayList();

      try {
         var1 = DatabaseConnection.getConnection();
         String var5 = "SELECT * FROM HOTEL ORDER BY id";
         var2 = var1.prepareStatement(var5);
         var3 = var2.executeQuery();

         while(var3.next()) {
            Hotel var6 = new Hotel();
            var6.setId(var3.getInt("id"));
            var6.setNom(var3.getString("nom"));
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

   public Hotel findById(int var1) throws SQLException {
      Connection var2 = null;
      PreparedStatement var3 = null;
      ResultSet var4 = null;
      Hotel var5 = null;

      try {
         var2 = DatabaseConnection.getConnection();
         String var6 = "SELECT * FROM HOTEL WHERE id = ?";
         var3 = var2.prepareStatement(var6);
         var3.setInt(1, var1);
         var4 = var3.executeQuery();
         if (var4.next()) {
            var5 = new Hotel();
            var5.setId(var4.getInt("id"));
            var5.setNom(var4.getString("nom"));
         }
      } finally {
         if (var4 != null) {
            var4.close();
         }

         if (var3 != null) {
            var3.close();
         }

         DatabaseConnection.closeConnection(var2);
      }

      return var5;
   }
}
