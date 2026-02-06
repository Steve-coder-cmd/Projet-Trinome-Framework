package controllers;

import models.Hotel;
import models.Reservation;
import servlet.annotation.Controller;
import servlet.annotation.mappings.GetMapping;
import servlet.annotation.mappings.PostMapping;
import servlet.annotation.parameters.RequestParam;
import servlet.models.ModelView;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BackOfficeController {

    private List<Hotel> hotels = new ArrayList<>();
    private List<Reservation> reservations = new ArrayList<>();
    private int nextHotelId = 1;
    private int nextReservationId = 1;

    @GetMapping(url = "/backoffice")
    public ModelView home() {
        ModelView mv = new ModelView("backoffice.jsp");
        mv.addData("hotels", hotels);
        mv.addData("reservations", reservations);
        return mv;
    }

    @GetMapping(url = "/backoffice/hotel/form")
    public ModelView hotelForm() {
        ModelView mv = new ModelView("hotel-form.jsp");
        return mv;
    }

    @PostMapping(url = "/backoffice/hotel/insert")
    public ModelView insertHotel(@RequestParam(value = "nom") String nom) {
        Hotel hotel = new Hotel(nextHotelId++, nom);
        hotels.add(hotel);

        ModelView mv = new ModelView("backoffice.jsp");
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
            @RequestParam(value = "idHotel") int idHotel) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime dateTime = LocalDateTime.parse(dateHeureArrivee, formatter);

        Reservation reservation = new Reservation(nextReservationId++, idClient, nbPassagers, dateTime, idHotel);
        reservations.add(reservation);

        ModelView mv = new ModelView("backoffice.jsp");
        mv.addData("hotels", hotels);
        mv.addData("reservations", reservations);
        mv.addData("message", "Réservation insérée avec succès pour le client: " + idClient);
        return mv;
    }
}
