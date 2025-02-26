<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contract Entry</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: 0 auto;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label, input {
            margin: 5px 0;
        }
        button {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Enter Contract Information</h1>
        <form action="submitContract" method="post">
            <label for="contractId">Contract ID:</label>
            <input type="text" id="contractId" name="contractId" required>

            <label for="bookingId">Booking ID:</label>
            <input type="text" id="bookingId" name="bookingId" required>

            <label for="tenantId">Tenant ID:</label>
            <input type="text" id="tenantId" name="tenantId" required>

            <label for="landlordId">Landlord ID:</label>
            <input type="text" id="landlordId" name="landlordId" required>

            <label for="creationDate">Creation Date:</label>
            <input type="date" id="creationDate" name="creationDate" required>

            <label for="content">Content:</label>
            <input type="text" id="content" name="content" required>

            <label for="status">Status:</label>
            <input type="text" id="status" name="status" required>

            <label for="requestId">Request ID:</label>
            <input type="text" id="requestId" name="requestId" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
