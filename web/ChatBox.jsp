<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.ChatBox"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Chat Box</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .chat-box {
                max-width: 600px;
                margin: 50px auto;
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 20px;
                background-color: #f9f9f9;
            }
            .message {
                margin-bottom: 15px;
            }
            .message.sender {
                text-align: right;
            }
            .message.receiver {
                text-align: left;
            }
            .message .msg-content {
                display: inline-block;
                max-width: 80%;
                padding: 10px;
                border-radius: 15px;
            }
            .message.sender .msg-content {
                background-color: #d1f7d6;
            }
            .message.receiver .msg-content {
                background-color: #f0f0f0;
            }
            .input-group {
                margin-top: 20px;
            }
            .input-group input {
                border-radius: 10px;
            }
            .avatar {
                width: 30px;  /* Giảm kích thước ảnh */
                height: 30px;
                border-radius: 50%; /* Làm tròn ảnh */
                margin-right: 5px;
            }

        </style>
    </head>
    <body>
        <div class="chat-box">
            <div class="messages">
                <% 
                  List<ChatBox> list = (List<ChatBox>) request.getAttribute("list");
                  String sendId = (String) request.getAttribute("sendId");
                   String roomId = (String) request.getAttribute("roomId");
                  for (ChatBox chat : list) {
                      boolean isSender = chat.getSender().equals(sendId);
                %>
                <div class="message <%= isSender ? "sender" : "receiver" %>">
                    <% if (!isSender) { %>
                    <img src="${pageContext.request.contextPath}/images/<%= chat.getImange() %>" alt="Avatar" class="avatar">
                    <% } %>
                    <div class="msg-content"><%= chat.getContent() %></div>
                    <% if (isSender) { %>
                    <img src="${pageContext.request.contextPath}/images/<%= chat.getImange() %>" alt="Avatar" class="avatar">
                    <% } %>
                </div>
                <% } %>
            </div>
            <!-- Message Input Form -->
            <form action="SendMessageServlet" method="post" class="input-group">
                  <input type="hidden" name="roomId" value="<%= roomId %>">
                <input type="hidden" name="senderId" value="<%= sendId %>">
                <input type="hidden" name="receiverId" value="<%= request.getAttribute("reveivedId") %>">
                <input type="text" name="message" class="form-control" placeholder="Type a message..." required>
                <button type="submit" class="btn btn-primary">Send</button>
            </form>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
