<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Tiffin Agent Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f4f4f4;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            background: #333;
            color: white;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px;
            margin: 5px 15px;
            border-radius: 5px;
        }
        .sidebar a:hover {
            background: #555;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
        }
        .dashboard-cards .card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .orders-table {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center" style="color: red" >Agent Dashboard</h3>
        <a href="addtiffin.jsp">Add Tiffin</a>
        <a href="viewtiffindetails.jsp">Edit/Delete Tiffins</a>
        <a href="viewtiffincust.jsp">View Tiffins</a>
        <a href="updatestatus.jsp">Update Status</a>
        <a href="mypaymentsm.jsp">My Payments</a>
        <a href="agentsignout.jsp" style="background-color: red" >Sign Out</a>

     
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Agent Dashboard</h2>

        <!-- Dashboard Summary Cards -->
        <div class="row dashboard-cards">
            <div class="col-md-4">
                <div class="card">
                    <h4>Total Orders</h4>
                    <h3></h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h4>Total Earnings</h4>
                    <h3></h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h4>Active Customers</h4>
                    <h3></h3>
                </div>
            </div>
        </div>

        <!-- Orders Chart -->
       
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Orders Chart
        var ctx = document.getElementById("ordersChart").getContext("2d");
        new Chart(ctx, {
            type: "bar",
            data: {
                labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                datasets: [{
                    label: "Orders Per Day",
                    data: [45, 60, 38, 70, 90, 50, 65],
                    backgroundColor: "blue"
                }]
            }
        });
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>
</html>
