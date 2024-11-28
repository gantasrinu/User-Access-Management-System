<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Request Access</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e3f2fd;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background: #fff;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #007BFF;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Request Access</h2>
        <form action="RequestServlet" method="post">
    <label for="software">Select Software:</label>
    <select name="software" id="software" required>
        <option value="JIRA">JIRA</option>
        <option value="Salesforce">Salesforce</option>
        <option value="ZOOM">ZOOM</option>
    </select>
    <label for="accessType">Access Type:</label>
    <select name="accessType" id="accessType" required>
        <option value="Read">Read</option>
        <option value="Write">Write</option>
        <option value="Admin">Admin</option>
    </select>
    <label for="reason">Reason for Access:</label>
    <textarea name="reason" id="reason" rows="4" placeholder="Why do you need this access?" required></textarea>
    <button type="submit">Submit Request</button>
</form>
 <p><a href=" index.html">Back To Home</a><p>

    </div>
    
</body>
</html>
    