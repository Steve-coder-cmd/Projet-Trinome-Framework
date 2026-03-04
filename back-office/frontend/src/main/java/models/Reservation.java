package models;

import java.time.LocalDateTime;

public class Reservation {
   private int id;
   private String idClient;
   private int nbPassagers;
   private LocalDateTime dateHeureArrivee;
   private int idHotel;

   public Reservation() {
   }

   public Reservation(String var1, int var2, LocalDateTime var3, int var4) {
      this.idClient = var1;
      this.nbPassagers = var2;
      this.dateHeureArrivee = var3;
      this.idHotel = var4;
   }

   public Reservation(int var1, String var2, int var3, LocalDateTime var4, int var5) {
      this.id = var1;
      this.idClient = var2;
      this.nbPassagers = var3;
      this.dateHeureArrivee = var4;
      this.idHotel = var5;
   }

   public int getId() {
      return this.id;
   }

   public void setId(int var1) {
      this.id = var1;
   }

   public String getIdClient() {
      return this.idClient;
   }

   public void setIdClient(String var1) {
      this.idClient = var1;
   }

   public int getNbPassagers() {
      return this.nbPassagers;
   }

   public void setNbPassagers(int var1) {
      this.nbPassagers = var1;
   }

   public LocalDateTime getDateHeureArrivee() {
      return this.dateHeureArrivee;
   }

   public void setDateHeureArrivee(LocalDateTime var1) {
      this.dateHeureArrivee = var1;
   }

   public int getIdHotel() {
      return this.idHotel;
   }

   public void setIdHotel(int var1) {
      this.idHotel = var1;
   }

   public String toString() {
      int var10000 = this.id;
      return "Reservation{id=" + var10000 + ", idClient='" + this.idClient + "', nbPassagers=" + this.nbPassagers + ", dateHeureArrivee=" + String.valueOf(this.dateHeureArrivee) + ", idHotel=" + this.idHotel + "}";
   }
}
