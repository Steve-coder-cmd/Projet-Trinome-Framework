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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        
        .header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .actions {
            padding: 30px;
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        
        .content {
            padding: 0 30px 30px;
        }
        
        .section {
            margin-bottom: 40px;
        }
        
        .section h2 {
            color: #333;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid #4facfe;
        }
        
        .message {
            padding: 15px;
            margin: 20px 0;
            border-radius: 8px;
            font-weight: 600;
        }
        
        .message.success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background: #f8f9fa;
            font-weight: 600;
            color: #333;
        }
        
        tr:hover {
            background: #f8f9fa;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🏨 Back-Office Agence de Voyage</h1>
            <p>Gestion des réservations et des hôtels</p>
        </div>
        
        <div class="actions">
            <a href="hotel/form" class="btn btn-primary">➕ Ajouter un hôtel</a>
            <a href="reservation/form" class="btn btn-secondary">📋 Ajouter une réservation</a>
        </div>
        
        <div class="content">
            <% if (request.getAttribute("message") != null) { %>
                <div class="message success">
                    <%= request.getAttribute("message") %>
                </div>
            <% } %>
            
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
                            <% for (Hotel hotel : hotels) { %>
                                <tr>
                                    <td><%= hotel.getId() %></td>
                                    <td><%= hotel.getNom() %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } else { %>
                    <div class="empty-state">
                        Aucun hôtel enregistré. Ajoutez votre premier hôtel !
                    </div>
                <% } %>
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
                                <th>Date/Heure Arrivée</th>
                                <th>ID Hôtel</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Reservation res : reservations) { %>
                                <tr>
                                    <td><%= res.getId() %></td>
                                    <td><%= res.getIdClient() %></td>
                                    <td><%= res.getNbPassagers() %></td>
                                    <td><%= res.getDateHeureArrivee() %></td>
                                    <td><%= res.getIdHotel() %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } else { %>
                    <div class="empty-state">
                        Aucune réservation enregistrée. Ajoutez votre première réservation !
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>
