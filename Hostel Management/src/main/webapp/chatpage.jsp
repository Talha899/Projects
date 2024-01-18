<% 
if(session.getAttribute("userID")==null)
{
	response.sendRedirect("login.jsp");
}

%>

<%@page import="jclass.model.ChatMessage"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .chat-container {
            width: 400px;
            margin: 20px auto;
            border: 1px solid #ccc;
            padding: 10px;
        }

        .message-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
            max-height: 300px;
            overflow-y: auto;
        }

        .message {
            margin-bottom: 10px;
        }

        .message.sender {
            text-align: right !important;
        }

        .message.receiver {
            text-align: left !important;
        }

        .message input {
            width: 80%;
            padding: 5px;
            margin-right: 5px;
        }

        .message button {
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>

<!-- ... (existing code) -->

<body>
    <div class="chat-container">
       <ul class="message-list" id="messageList">
            <c:forEach var="message" items="${chatMessages}">
                <c:choose>
                    <c:when test="${message.myID eq 1}">
                        <li class="message sender">${message.message}</li>
                    </c:when>
                    <c:otherwise>
                        <li class="message receiver">${message.message}</li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul> 
                        <div class="row">
                    <% List<ChatMessage> chats = (List<ChatMessage>)request.getAttribute("chatMessages");
                    if (chats != null && !chats.isEmpty()) {
                        for (ChatMessage c : chats) {
                    %>
                    <div class="col-md-4 my-3">
                        <div class="card w-100">
                            <div class="card-body">   
                             <%if(c.getMyID()==1){ %>
                                <h5 style="text-align : right;"><%=c.getMessage()%></h5> 
                              
                              <%}else if(c.getMyID()==0){ %>
                                <h5 style="text-align : left;" ><%=c.getMessage()%></h5>
                               <%}%>
                               
                            </div>
                        </div>
                    </div>
                    <% }
                    } else {
                    	  out.println("There are no messages");
                    }
                    %>
                </div>
        <div class="message sender">
            <form action="sendMessage" method="post">
                <input style="width: 392px;" type="text" name="senderID" value="${senderID}">
                <input style="width: 392px;" type="text" name="sendername" value="${sendername}">
                <input style="width: 392px;" type="text" name="receiverID" value="${receiverID}">
                <input style="width: 392px;" type="text" name="receivername" value="${receivername}">
                <textarea style="width: 392px;" name="message" id="messageInput" placeholder="Type your message"></textarea>
                <input style="width: 392px;" type="submit" value="Send Message">
                <input style="width: 392px;" type="submit" value="Refresh">
            </form>
        </div>
    </div>
    <!-- ... (existing code) -->
</body>
<!-- ... (existing code) -->

</html>
