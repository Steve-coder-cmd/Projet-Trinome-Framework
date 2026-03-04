package controllers;

import models.Hotel;
import models.Reservation;
import services.*;
import servlet.annotation.Controller;
import servlet.annotation.mappings.GetMapping;
import servlet.annotation.mappings.PostMapping;
import servlet.annotation.parameters.RequestParam;
import servlet.models.ModelView;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BackOfficeController {

    private final HotelService hotelService;
    private final ReservationService reservationService;
    private List<Hotel> hotels;
    private List<Reservation> reservations;
    private int nextHotelId;
    private int nextReservationId;

    public BackOfficeController() {
        this.hotelService = new HotelService();
        this.reservationService = new ReservationService();
        try {
            System.out.println("DEBUG: Tentative de connexion à la base de données...");
            this.hotels = hotelService.findAll();
            System.out.println("DEBUG: Hôtels trouvés: " + this.hotels.size());
            this.reservations = reservationService.findAll();
            System.out.println("DEBUG: Réservations trouvées: " + this.reservations.size());
            this.nextHotelId = hotels.isEmpty() ? 1 : hotels.get(hotels.size() - 1).getId() + 1;
            this.nextReservationId = reservations.isEmpty() ? 1 : reservations.get(reservations.size() - 1).getId() + 1;
        } catch (SQLException e) {
            System.err.println("ERREUR BASE DE DONNÉES: " + e.getMessage());
            e.printStackTrace();
            // En cas d'erreur de base de données, on utilise des listes vides
            this.hotels = new ArrayList<>();
            this.reservations = new ArrayList<>();
            this.nextHotelId = 1;
            this.nextReservationId = 1;
        }
    }

    public BackOfficeController(HotelService hotelService, ReservationService reservationService) {
        this.hotelService = hotelService;
        this.reservationService = reservationService;
        try {
            this.hotels = hotelService.findAll();
            this.reservations = reservationService.findAll();
            this.nextHotelId = hotels.isEmpty() ? 1 : hotels.get(hotels.size() - 1).getId() + 1;
            this.nextReservationId = reservations.isEmpty() ? 1 : reservations.get(reservations.size() - 1).getId() + 1;
        } catch (SQLException e) {
            e.printStackTrace();
            // En cas d'erreur de base de données, on utilise des listes vides
            this.hotels = new ArrayList<>();
            this.reservations = new ArrayList<>();
            this.nextHotelId = 1;
            this.nextReservationId = 1;
        }
    }

    @GetMapping(url = "/backoffice")
    public ModelView home() {
        ModelView mv = new ModelView("dashboard.jsp");
        mv.addData("hotels", hotels);
        mv.addData("reservations", reservations);
        mv.addData("debug", "JSP doit afficher ce message");
        return mv;
    }

    @GetMapping(url = "/backoffice/hotel/form")
    public ModelView hotelForm() {
        ModelView mv = new ModelView("hotel-form.jsp");
        return mv;
    }

    @PostMapping(url = "/backoffice/hotel/insert")
    public ModelView insertHotel(@RequestParam(value = "nom") String nom) throws SQLException {
        Hotel hotel = new Hotel(nextHotelId++, nom);
        hotelService.insert(hotel);
        hotels.add(hotel);

        ModelView mv = new ModelView("dashboard.jsp");
        mv.addData("hotels", hotels);
        mv.addData("reservations", reservations);
        mv.addData("message", "Hôtel inséré avec succès: " + nom);
        return mv;
    }

    @GetMapping(url = "/backoffice/reservation/form")
    public ModelView reservationForm() {
        ModelView mv = new ModelView("reservation-form.jsp");
        mv.addData("hotels", hotels);
        return mv;
    }

    @PostMapping(url = "/backoffice/reservation/insert")
    public ModelView insertReservation(
            @RequestParam(value = "idClient") String idClient,
            @RequestParam(value = "nbPassagers") int nbPassagers,
            @RequestParam(value = "dateHeureArrivee") String dateHeureArrivee,
            @RequestParam(value = "idHotel") int idHotel) throws SQLException {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime dateTime = LocalDateTime.parse(dateHeureArrivee, formatter);

        Reservation reservation = new Reservation(nextReservationId++, idClient, nbPassagers, dateTime, idHotel);
        reservationService.insert(reservation);
        reservations.add(reservation);

        ModelView mv = new ModelView("dashboard.jsp");
        mv.addData("hotels", hotels);
        mv.addData("reservations", reservations);
        mv.addData("message", "Réservation insérée avec succès pour le client: " + idClient);
        return mv;
    }
}
