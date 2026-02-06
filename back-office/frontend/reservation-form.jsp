<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Hotel" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une réservation - Back-Office</title>
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
            max-width: 700px;
            margin: 50px auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 2rem;
            margin-bottom: 10px;
        }
        
        .header p {
            font-size: 1rem;
            opacity: 0.9;
        }
        
        .form-container {
            padding: 40px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 1rem;
        }
        
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        
        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #f093fb;
            box-shadow: 0 0 0 3px rgba(240, 147, 251, 0.1);
        }
        
        .form-group input::placeholder {
            color: #999;
        }
        
        .form-row {
            display: flex;
            gap: 20px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            flex: 1;
            padding: 15px 20px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        
        .btn-secondary {
            background: #f8f9fa;
            color: #333;
            border: 2px solid #e1e5e9;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        
        .btn-secondary:hover {
            background: #e9ecef;
        }
        
        .required {
            color: #e74c3c;
        }
        
        .help-text {
            font-size: 0.85rem;
            color: #666;
            margin-top: 5px;
        }
        
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-weight: 600;
        }
        
        .alert-warning {
            background: #fff3cd;
            color: #856404;
            border: 1px solid #ffeaa7;
        }
        
        .no-hotels {
            text-align: center;
            padding: 40px;
            color: #666;
        }
        
        .no-hotels a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 24px;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📋 Ajouter une réservation</h1>
            <p>Remplissez les informations pour ajouter une nouvelle réservation</p>
        </div>
        
        <div class="form-container">
            <% 
            List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
            if (hotels == null || hotels.isEmpty()) {
            %>
                <div class="no-hotels">
                    <h3>⚠️ Aucun hôtel disponible</h3>
                    <p>Vous devez d'abord ajouter des hôtels avant de pouvoir créer des réservations.</p>
                    <a href="../hotel/form">➕ Ajouter un hôtel</a>
                </div>
            <% } else { %>
                <form action="insert" method="post">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="idClient">
                                ID Client <span class="required">*</span>
                            </label>
                            <input 
                                type="text" 
                                id="idClient" 
                                name="idClient" 
                                placeholder="Ex: CLI001"
                                required
                                maxlength="4"
                                pattern="[A-Z0-9]{4}"
                                title="Format: 4 caractères alphanumériques (ex: CLI001)"
                            >
                            <div class="help-text">
                                4 caractères alphanumériques (ex: CLI001)
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="nbPassagers">
                                Nombre de passagers <span class="required">*</span>
                            </label>
                            <input 
                                type="number" 
                                id="nbPassagers" 
                                name="nbPassagers" 
                                placeholder="Ex: 2"
                                required
                                min="1"
                                max="10"
                            >
                            <div class="help-text">
                                Entre 1 et 10 passagers
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="dateHeureArrivee">
                            Date et heure d'arrivée <span class="required">*</span>
                        </label>
                        <input 
                            type="datetime-local" 
                            id="dateHeureArrivee" 
                            name="dateHeureArrivee"
                            required
                        >
                        <div class="help-text">
                            Sélectionnez la date et l'heure d'arrivée
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="idHotel">
                            Hôtel <span class="required">*</span>
                        </label>
                        <select id="idHotel" name="idHotel" required>
                            <option value="">-- Sélectionnez un hôtel --</option>
                            <% for (Hotel hotel : hotels) { %>
                                <option value="<%= hotel.getId() %>">
                                    <%= hotel.getNom() %> (ID: <%= hotel.getId() %>)
                                </option>
                            <% } %>
                        </select>
                        <div class="help-text">
                            Choisissez l'hôtel pour cette réservation
                        </div>
                    </div>
                    
                    <div class="btn-group">
                        <button type="submit" class="btn btn-primary">
                            ✅ Ajouter la réservation
                        </button>
                        <a href="../backoffice" class="btn btn-secondary">
                            ❌ Annuler
                        </a>
                    </div>
                </form>
            <% } %>
        </div>
    </div>
    
    <script>
        // Set minimum datetime to current time
        const datetimeInput = document.getElementById('dateHeureArrivee');
        if (datetimeInput) {
            const now = new Date();
            const year = now.getFullYear();
            const month = String(now.getMonth() + 1).padStart(2, '0');
            const day = String(now.getDate()).padStart(2, '0');
            const hours = String(now.getHours()).padStart(2, '0');
            const minutes = String(now.getMinutes()).padStart(2, '0');
            
            datetimeInput.min = `${year}-${month}-${day}T${hours}:${minutes}`;
        }
        
        // Form validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const idClient = document.getElementById('idClient').value.trim();
            const nbPassagers = parseInt(document.getElementById('nbPassagers').value);
            const dateHeureArrivee = document.getElementById('dateHeureArrivee').value;
            const idHotel = document.getElementById('idHotel').value;
            
            // Validate ID Client format
            if (!/^[A-Z0-9]{4}$/.test(idClient)) {
                alert('L\'ID client doit contenir exactement 4 caractères alphanumériques (ex: CLI001)');
                e.preventDefault();
                return;
            }
            
            // Validate number of passengers
            if (nbPassagers < 1 || nbPassagers > 10) {
                alert('Le nombre de passagers doit être entre 1 et 10');
                e.preventDefault();
                return;
            }
            
            // Validate date is not in the past
            const selectedDate = new Date(dateHeureArrivee);
            const now = new Date();
            if (selectedDate < now) {
                alert('La date d\'arrivée ne peut pas être dans le passé');
                e.preventDefault();
                return;
            }
            
            // Validate hotel selection
            if (!idHotel) {
                alert('Veuillez sélectionner un hôtel');
                e.preventDefault();
                return;
            }
        });
        
        // Auto-focus on first input
        const firstInput = document.getElementById('idClient');
        if (firstInput) {
            firstInput.focus();
        }
        
        // Auto-format ID Client to uppercase
        document.getElementById('idClient').addEventListener('input', function(e) {
            e.target.value = e.target.value.toUpperCase();
        });
    </script>
</body>
</html>
