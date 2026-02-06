package models;

import java.time.LocalDateTime;

public class Reservation {
    private int id;
    private String idClient;
    private int nbPassagers;
    private LocalDateTime dateHeureArrivee;
    private int idHotel;

    public Reservation() {}

    public Reservation(String idClient, int nbPassagers, LocalDateTime dateHeureArrivee, int idHotel) {
        this.idClient = idClient;
        this.nbPassagers = nbPassagers;
        this.dateHeureArrivee = dateHeureArrivee;
        this.idHotel = idHotel;
    }

    public Reservation(int id, String idClient, int nbPassagers, LocalDateTime dateHeureArrivee, int idHotel) {
        this.id = id;
        this.idClient = idClient;
        this.nbPassagers = nbPassagers;
        this.dateHeureArrivee = dateHeureArrivee;
        this.idHotel = idHotel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }

    public int getNbPassagers() {
        return nbPassagers;
    }

    public void setNbPassagers(int nbPassagers) {
        this.nbPassagers = nbPassagers;
    }

    public LocalDateTime getDateHeureArrivee() {
        return dateHeureArrivee;
    }

    public void setDateHeureArrivee(LocalDateTime dateHeureArrivee) {
        this.dateHeureArrivee = dateHeureArrivee;
    }

    public int getIdHotel() {
        return idHotel;
    }

    public void setIdHotel(int idHotel) {
        this.idHotel = idHotel;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "id=" + id +
                ", idClient='" + idClient + '\'' +
                ", nbPassagers=" + nbPassagers +
                ", dateHeureArrivee=" + dateHeureArrivee +
                ", idHotel=" + idHotel +
                '}';
    }
}
