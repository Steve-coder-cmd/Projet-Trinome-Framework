package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
   private static final String URL = "jdbc:postgresql://localhost:5432/agencevoyage";
   private static final String USER = "postgres";
   private static final String PASSWORD = "261005";

   public DatabaseConnection() {
   }

   public static Connection getConnection() throws SQLException {
      return DriverManager.getConnection("jdbc:postgresql://localhost:5432/agencevoyage", "postgres", "261005");
   }

   public static void closeConnection(Connection var0) {
      if (var0 != null) {
         try {
            var0.close();
         } catch (SQLException var2) {
            System.err.println("Erreur lors de la fermeture de la connexion: " + var2.getMessage());
         }
      }

   }

   static {
      try {
         Class.forName("org.postgresql.Driver");
      } catch (ClassNotFoundException var1) {
         System.err.println("Driver PostgreSQL non trouvé: " + var1.getMessage());
      }

   }
}
