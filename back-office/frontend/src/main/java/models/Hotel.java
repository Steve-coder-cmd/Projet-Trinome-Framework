package models;

public class Hotel {
   private int id;
   private String nom;

   public Hotel() {
   }

   public Hotel(String var1) {
      this.nom = var1;
   }

   public Hotel(int var1, String var2) {
      this.id = var1;
      this.nom = var2;
   }

   public int getId() {
      return this.id;
   }

   public void setId(int var1) {
      this.id = var1;
   }

   public String getNom() {
      return this.nom;
   }

   public void setNom(String var1) {
      this.nom = var1;
   }

   public String toString() {
      return "Hotel{id=" + this.id + ", nom='" + this.nom + "'}";
   }
}
