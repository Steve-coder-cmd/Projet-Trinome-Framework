<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un hôtel - Back-Office</title>
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
            max-width: 600px;
            margin: 50px auto;
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
        
        .form-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #4facfe;
            box-shadow: 0 0 0 3px rgba(79, 172, 254, 0.1);
        }
        
        .form-group input::placeholder {
            color: #999;
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🏨 Ajouter un hôtel</h1>
            <p>Remplissez les informations pour ajouter un nouvel hôtel</p>
        </div>
        
        <div class="form-container">
            <form action="insert" method="post">
                <div class="form-group">
                    <label for="nom">
                        Nom de l'hôtel <span class="required">*</span>
                    </label>
                    <input 
                        type="text" 
                        id="nom" 
                        name="nom" 
                        placeholder="Ex: Hôtel Plaza Paris"
                        required
                        maxlength="255"
                    >
                    <div class="help-text">
                        Entrez le nom complet de l'hôtel
                    </div>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">
                        ✅ Ajouter l'hôtel
                    </button>
                    <a href="../backoffice" class="btn btn-secondary">
                        ❌ Annuler
                    </a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        // Simple validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const nomInput = document.getElementById('nom');
            const nom = nomInput.value.trim();
            
            if (nom.length < 2) {
                alert('Le nom de l\'hôtel doit contenir au moins 2 caractères');
                e.preventDefault();
                return;
            }
        });
        
        // Auto-focus on first input
        document.getElementById('nom').focus();
    </script>
</body>
</html>
