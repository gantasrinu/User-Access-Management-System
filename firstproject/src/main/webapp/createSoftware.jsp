<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Request Submission</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4c3; /* Light yellow-green background */
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #558b2f; /* Deep green for title */
            margin-bottom: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            text-align: left;
            padding: 12px;
            border: 1px solid #ccc;
        }

        th {
            background-color: #c5e1a5; /* Light green header */
            color: #33691e; /* Deep green text */
        }

        td {
            background-color: #f9fbe7; /* Lighter green rows */
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #558b2f; /* Deep green for button */
            color: #ffffff;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #6d8c3e;
        }

        .message {
            padding: 10px;
            margin-top: 10px;
            background-color: #dcedc8;
            color: #33691e;
            border: 1px solid #c5e1a5;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h2>Access Request Submission</h2>
    <div class="container">
        <!-- Default Data Table -->
        <h3>Submitted Access Requests</h3>
        <table>
            <thead>
                <tr>
                    <th>Software Name</th>
                    <th>Access Type</th>
                    <th>Reason</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <!-- Default rows with known data -->
                <tr>
                    <td>Microsoft Office</td>
                    <td>Read</td>
                    <td>For documentation work</td>
                    <td>Approved</td>
                </tr>
                <tr>
                    <td>Salesforce</td>
                    <td>Write</td>
                    <td>Client management</td>
                    <td>Pending</td>
                </tr>
                <!-- Example row for unknown/new software -->
                <tr>
                    <td>Unknown Software</td>
                    <td>Admin</td>
                    <td>Testing access for unknown tool</td>
                    <td>Submitted</td>
                </tr>
            </tbody>
        </table>

        <!-- Submission Form -->
        <h3>Request Access to a New Software</h3>
        <form id="accessRequestForm" onsubmit="submitRequest(event)">
            <label for="software">Software Name</label>
            <select id="software" name="software" required>
                <option value="">-- Select Software --</option>
                <option value="JIRA">JIRA</option>
                <option value="Confluence">Confluence</option>
                <option value="Zoom">Zoom</option>
                <option value="Other">Other (Specify in Reason)</option>
            </select>

            <label for="accessType">Access Type</label>
            <select id="accessType" name="accessType" required>
                <option value="Read">Read</option>
                <option value="Write">Write</option>
                <option value="Admin">Admin</option>
            </select>

            <label for="reason">Reason for Access</label>
            <textarea id="reason" name="reason" rows="4" placeholder="Enter the reason for your access request" required></textarea>

            <button type="submit">Submit Request</button>
        </form>

        <!-- Confirmation Message -->
        <div id="confirmationMessage" class="message" style="display: none;">
            Your request has been submitted successfully!
        </div>
    </div>

    <script>
        function submitRequest(event) {
            event.preventDefault(); // Prevent form submission
            const confirmationMessage = document.getElementById("confirmationMessage");
            confirmationMessage.style.display = "block"; // Show confirmation message
            setTimeout(() => {
                confirmationMessage.style.display = "none"; // Hide after 5 seconds
            }, 5000);
        }
    </script>
       <p><a href=" index.html">Back To Home</a><p>
</body>
</html>
  