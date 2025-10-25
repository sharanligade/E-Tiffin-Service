<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql., java.util."%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Turf</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #43cea2, #185a9d);
            font-family: 'Arial', sans-serif;
            color: #fff;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            max-width: 700px;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.2);
            color: #333;
        }
        h2 { 
            color: #185a9d; 
            margin-bottom: 20px; 
            text-align: center;
        }
        .form-group label { 
            font-weight: bold; 
            color: #444; 
            font-size: 16px; 
        }
        .form-control {
            border-radius: 10px;
            border: 2px solid #43cea2;
            padding: 10px;
            transition: border-color 0.3s;
            width: 100%; /* Ensure full width */
            box-sizing: border-box; /* Include padding/border in width */
        }
        .form-control:focus {
            border-color: #185a9d;
            box-shadow: 0 0 5px rgba(24, 90, 157, 0.5);
        }
        select.form-control {
            height: auto; /* Allow dropdown to expand naturally */
            padding: 8px 10px; /* Consistent padding */
        }
        .btn-custom {
            background: linear-gradient(45deg, #43cea2, #185a9d);
            border: none;
            padding: 12px;
            border-radius: 10px;
            color: white;
            font-size: 18px;
            width: 100%;
            transition: all 0.3s;
            margin-top: 10px;
        }
        .btn-custom:hover {
            background: linear-gradient(45deg, #185a9d, #43cea2);
            box-shadow: 0px 4px 15px rgba(24, 90, 157, 0.5);
        }
        .btn-secondary {
            background: linear-gradient(45deg, #f7971e, #ffd200);
            border: none;
            padding: 12px;
            border-radius: 10px;
            color: white;
            font-size: 18px;
            width: 100%;
            transition: all 0.3s;
            margin-top: 10px;
        }
        .btn-secondary:hover {
            background: linear-gradient(45deg, #ffd200, #f7971e);
            box-shadow: 0px 4px 15px rgba(247, 151, 30, 0.5);
        }
        .alert-danger {
            margin-top: 20px;
            font-size: 1rem;
        }
        @media (max-width: 768px) {
            .container { 
                padding: 20px; 
                margin: 10px; 
            }
            .btn-custom, .btn-secondary { 
                font-size: 16px; 
                padding: 10px; 
            }
            .form-control {
                font-size: 14px;
            }
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>Edit Turf</h2>
        <%
            String email = (String) session.getAttribute("vname");
            if (email == null) {
                response.sendRedirect("vendorlogin.html");
                return;
            }

            String selectedTurfName = request.getParameter("turfname");
            String turfname = "";
            String address = "";
            String addresslink = "";
            String price = "";
            String description = "";
            String errorMessage = null;
            List<String> turfNames = new ArrayList<>();

            try {
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmyturf", "root", "")) {
                    Statement stmt = con.createStatement();
                    // Fetch all turf names for this vendor
                    String turfQuery = "SELECT turfname FROM turfs WHERE vname = '" + email.replace("'", "\\'") + "'";
                    ResultSet rs = stmt.executeQuery(turfQuery);
                    while (rs.next()) {
                        turfNames.add(rs.getString("turfname"));
                    }
                    rs.close();

                    // If a turf is selected, load its details
                    if (selectedTurfName != null && !selectedTurfName.trim().isEmpty()) {
                        String query = "SELECT turfname, address, addresslink, price, description FROM turfs WHERE turfname = '" 
                            + selectedTurfName.replace("'", "\\'") + "' AND vname = '" + email.replace("'", "\\'") + "'";
                        rs = stmt.executeQuery(query);
                        if (rs.next()) {
                            turfname = rs.getString("turfname");
                            address = rs.getString("address");
                            addresslink = rs.getString("addresslink");
                            price = rs.getString("price");
                            description = rs.getString("description");
                        } else {
                            errorMessage = "Error: Turf not found or you don’t have permission to edit it.";
                        }
                        rs.close();
                    }
                    stmt.close();
                }
            } catch (Exception e) {
                errorMessage = "Error fetching turf details: " + e.getMessage();
            }
        %>

        <% if (errorMessage != null) { %>
            <div class="alert alert-danger"><%= errorMessage %></div>
            <a href="viewturf.jsp" class="btn btn-secondary">Back to Turf Details</a>
        <% } else if (turfNames.isEmpty()) { %>
            <div class="alert alert-danger">No turfs available to edit. Please add a turf first.</div>
            <a href="viewturf.jsp" class="btn btn-secondary">Back to Turf Details</a>
        <% } else { %>
            <form id="selectTurfForm" action="editturf.jsp" method="get">
                <div class="form-group">
                    <label for="turfname">Select Turf to Edit:</label>
                    <select class="form-control" name="turfname" id="turfname" onchange="this.form.submit()">
                        <option value="">-- Select a Turf --</option>
                        <% for (String name : turfNames) { %>
                            <option value="<%= name %>" <%= name.equals(selectedTurfName) ? "selected" : "" %>><%= name %></option>
                        <% } %>
                    </select>
                </div>
            </form>

            <% if (selectedtiffinname != null && !selectedtiffinName.trim().isEmpty()) { %>
                <form id="editTurfForm" action="processeditturf.jsp" method="post">
                    <input type="hidden" name="turfname" value="<%= turfname %>">
                    <div class="form-group">
                        <label for="newTurfName">Turf Name:</label>
                        <input type="text" class="form-control" name="newturfname" id="newTurfName" value="<%= turfname %>" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <textarea class="form-control" name="address" id="address" rows="2" required><%= address %></textarea>
                    </div>
                    <div class="form-group">
                        <label for="addressLink">Address Link (Google Maps):</label>
                        <input type="url" class="form-control" name="addresslink" id="addressLink" required>
                    </div>
                    <div class="form-group">
                        <label for="price">Price(₹):</label>
                        <input type="number" class="form-control" name="price" id="pricePerHour" required>
                    </div>
                    <div class="form-group">
                        <label for="tiffindescription">Tiffin Description:</label>
                        <textarea class="form-control" name="tiffindescription" id="tiffindescription" rows="3" required><%= description %></textarea>
                    </div>
                    <input type="submit" class="btn btn-custom" value="Save Changes">
                    <a href="viewtiffindetails.jsp" class="btn btn-secondary">Cancel</a>
                </form>
            <% } %>
        <% } %>

        <script>
         
    </div>
</body>
</html>