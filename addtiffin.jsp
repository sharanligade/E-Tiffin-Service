<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Tiffin</title>
    
    <!-- Bootstrap 3 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            font-family: 'Arial', sans-serif;
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: left;
            color: #333;
        }

        .form-group label {
            font-weight: bold;
            color: #444;
        }

        .form-control {
            border-radius: 8px;
            border: 2px solid #ff7e5f;
        }

        .btn-custom {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            padding: 12px;
            border-radius: 8px;
            color: white;
            font-size: 18px;
            width: 100%;
            transition: all 0.3s;
            margin-bottom: 10px;
        }

        .btn-custom:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0px 4px 10px rgba(255, 75, 43, 0.5);
        }

        .btn-secondary {
            background: linear-gradient(45deg, #36d1dc, #5b86e5);
            border: none;
            padding: 12px;
            border-radius: 8px;
            color: white;
            font-size: 18px;
            width: 100%;
            transition: all 0.3s;
        }

        .btn-secondary:hover {
            background: linear-gradient(45deg, #5b86e5, #36d1dc);
            box-shadow: 0px 4px 10px rgba(91, 134, 229, 0.5);
        }

        .image-preview {
            display: block;
            max-width: 100%;
            height: auto;
            margin-top: 10px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>

    <!-- jQuery and Bootstrap 3 JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
</head>
<body>

<div class="container">
    <h2 class="text-center" style="color: #ff4b2b;">🍱 Add Tiffin 🍱</h2>
    <form  action="tiffindetails.jsp" method="post">

        <!-- Tiffin Name -->
        <div class="form-group">
            <label for="tiffinName">Tiffin Name:</label>
            <input type="text" class="form-control" name="tiffinname" id="tiffinName" placeholder="Enter tiffin name" required>
        </div>

        <!-- Price -->
        <div class="form-group">
            <label for="price">Price (₹):</label>
            <input type="number" class="form-control" name="price" id="price" placeholder="Enter price" required>
        </div>

        <!-- Category -->
        <div class="form-group">
            <label for="category">Category:</label>
            <select class="form-control" name="category" id="category" required>
                <option value="Vegetarian">🌱 Vegetarian</option>
                <option value="Non-Vegetarian">🍗 Non-Vegetarian</option>
            </select>
        </div>
        <div class="form-group">
            <label for="type">Choose This:</label>
            <select class="form-control" name="type" id="type" required>
                <option value="Tiffin">Tiffin</option>
                <option value="Thali">Thali</option>
            </select>
        </div>

        <!-- Description -->
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" name="description" id="description" rows="3" placeholder="Enter tiffin description" required></textarea>
        </div>

        <!-- Image Upload -->
        <div class="form-group">
            <label for="imageUpload">Upload Image:</label>
            <input type="file" class="form-control" name="imageupload" id="imageUpload" required="">
            <img id="imagePreview" class="image-preview" style="display: none;">
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-custom">➕ Add Tiffin</button>

        <!-- View Tiffin Details Button -->
        
        <a href="agentdashboard.jsp" class="btn btn-secondary">📜 Agent Dashboard</a>
        

    </form>
</div>

<!-- JavaScript for Image Preview & Form Handling -->
<script>
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('imagePreview');
            output.src = reader.result;
            output.style.display = 'block';
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    $(document).ready(function(){
        $("#tiffinForm").submit(function(event){
            var tiffinName = $("#tiffinName").val().trim();
            var price = $("#price").val().trim();
            var category = $("#category").val();
            var type = $("#type").val();
            var description = $("#description").val().trim();
            var imageUpload = $("#imageUpload").val();

            if(tiffinName === "" || price === "" || category === "" || type === "" || description === "" || imageUpload === "") {
                alert("⚠️ Please fill in all fields!");
                event.preventDefault();
            }
        });
    });
</script>

</body>
</html>
