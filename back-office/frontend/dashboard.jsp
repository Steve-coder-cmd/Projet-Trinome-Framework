<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Hotel" %>
<%@ page import="models.Reservation" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Back-Office - Agence de Voyage</title>
    <% System.out.println("DEBUG: JSP dashboard.jsp est en cours d'exécution!"); %>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .header { background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border-radius: 15px; padding: 30px; text-align: center; margin-bottom: 30px; }
        .header h1 { color: white; font-size: 2.5rem; margin-bottom: 10px; }
        .header p { color: rgba(255,255,255,0.8); font-size: 1.1rem; }
        .actions { text-align: center; margin-bottom: 30px; }
        .btn { display: inline-block; padding: 12px 24px; margin: 0 10px; text-decoration: none; border-radius: 8px; font-weight: 600; transition: all 0.3s ease; }
        .btn-primary { background: #4CAF50; color: white; }
        .btn-primary:hover { background: #45a049; transform: translateY(-2px); }
        .btn-secondary { background: #2196F3; color: white; }
        .btn-secondary:hover { background: #1976D2; transform: translateY(-2px); }
        .content { background: rgba(255,255,255,0.95); border-radius: 15px; padding: 30px; }
        .section { margin-bottom: 30px; }
        .section h2 { color: #333; margin-bottom: 20px; font-size: 1.5rem; }
        .message { padding: 15px; margin: 20px 0; border-radius: 8px; font-weight: 600; }
        .message.success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f8f9fa; font-weight: 600; color: #333; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🏨 Back-Office Agence de Voyage</h1>
            <p>Gestion des réservations et des hôtels</p>
        </div>
        
        <div class="actions">
            <a href="/TestFramework/backoffice/hotel/form" class="btn btn-primary">➕ Ajouter un hôtel</a>
            <a href="/TestFramework/backoffice/reservation/form" class="btn btn-secondary">📋 Ajouter une réservation</a>
        </div>
        
        <div class="content">
            <%
                String message = (String) request.getAttribute("message");
                if (message != null && !message.trim().isEmpty()) {
            %>
                <div class="message success">
                    <%= message %>
                </div>
            <%
                }
            %>
            
            <div class="section">
                <h2>🏨 Hôtels</h2>
                <%
                    List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
                    if (hotels != null && !hotels.isEmpty()) {
                %>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Hotel hotel : hotels) {
                            %>
                                <tr>
                                    <td><%= hotel.getId() %></td>
                                    <td><%= hotel.getNom() %></td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                <%
                    } else {
                %>
                    <p>Aucun hôtel trouvé.</p>
                <%
                    }
                %>
            </div>
            
            <div class="section">
                <h2>📋 Réservations</h2>
                <%
                    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                    if (reservations != null && !reservations.isEmpty()) {
                %>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>ID Client</th>
                                <th>Passagers</th>
                                <th>Date Arrivée</th>
                                <th>ID Hôtel</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Reservation reservation : reservations) {
                            %>
                                <tr>
                                    <td><%= reservation.getId() %></td>
                                    <td><%= reservation.getIdClient() %></td>
                                    <td><%= reservation.getNbPassagers() %></td>
                                    <td><%= reservation.getDateHeureArrivee() %></td>
                                    <td><%= reservation.getIdHotel() %></td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                <%
                    } else {
                %>
                    <p>Aucune réservation trouvée.</p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
