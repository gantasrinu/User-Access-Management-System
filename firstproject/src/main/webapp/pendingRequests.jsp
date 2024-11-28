<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Requests</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff3e0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f57c00;
            color: white;
        }

        button {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
        }

        .approve {
            background-color: #28a745;
            color: white;
            border: none;
        }

        .reject {
            background-color: #dc3545;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Pending Access Requests</h2>
        <table>
            <thead>
                <tr>
                    <th>Employee</th>
                    <th>Software</th>
                    <th>Access Type</th>
                    <th>Reason</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>GANTA SRINU</td>
                    <td>JIRA</td>
                    <td>Read</td>
                    <td>Needs access for task completion</td>
                    <td>
                        <button class="approve">Approve</button>
                        <button class="reject">Reject</button>
                    </td>
                </tr>
                <!-- Additional rows can be dynamically added -->
            </tbody>
        </table>
    </div>
       <p><a href=" index.html">Back To Home</a><p>
</body>
</html>
    