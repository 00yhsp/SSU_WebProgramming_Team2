<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script>
var webSocket
    = new WebSocket("<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
var chatWindow, chatMessage, chatId;

// 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장
window.onload = function() {
    chatWindow = document.getElementById("chatWindow");
    chatMessage = document.getElementById("chatMessage");
    chatId = document.getElementById('chatId').value;    
}

// 메시지 전송
function sendMessage() {
    // 대화창에 표시
    chatWindow.innerHTML += "<div class='myMsg'>" + chatId + ": "+ chatMessage.value + "</div>"
    webSocket.send(chatId + '|' + chatMessage.value);  // 서버로 전송
    chatMessage.value = "";  // 메시지 입력창 내용 지우기
    chatWindow.scrollTop = chatWindow.scrollHeight;  // 대화창 스크롤
}

// 서버와의 연결 종료
function disconnect() {
    webSocket.close();
}

// 웹소켓 서버에 연결됐을 때 실행
webSocket.onopen = function(event) {   
    chatWindow.innerHTML += "채팅 서버에 연결되었습니다.<br/>";
};

// 웹소켓이 닫혔을 때(서버와의 연결이 끊겼을 때) 실행
webSocket.onclose = function(event) {
    chatWindow.innerHTML += "채팅 서버가 종료되었습니다.<br/>";
};

// 에러 발생 시 실행
webSocket.onerror = function(event) { 
    alert(event.data);
    chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br/>";
}; 

// 메시지를 받았을 때 실행
webSocket.onmessage = function(event) { 
    var message = event.data.split("|");  // 대화명과 메시지 분리
    var sender = message[0];   // 보낸 사람의 대화명
    var content = message[1];  // 메시지 내용
    if (content != "") {
        if (content.match("/")) {  // 귓속말
            if (content.match(("/" + chatId))) {  // 나에게 보낸 메시지만 출력
                var temp = content.replace(("/" + chatId), "[귓속말] : ");
                chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
            }
        }
        else {  // 일반 대화
            chatWindow.innerHTML += "<div>" + sender + " : " + content + "</div>";
        }
    }
    chatWindow.scrollTop = chatWindow.scrollHeight; 
};
</script>

    
    <title>웹소켓 채팅</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script>
        // JavaScript 코드는 기존과 동일하게 유지합니다.
    </script>
    <style>
        #chatWindow {
            border: 1px solid #ddd;
            height: 300px;
            overflow-y: scroll;
            padding: 15px;
            background-color: #f7f7f7;
            margin-bottom: 10px;
            border-radius: 4px;
        }
        .myMsg {
            text-align: right;
            color: #31708f;
        }
        #chatId {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
            	<input style="display:none;" id="chatId" value="${param.chatId}"/>
                <h2 class="text-center" style="margin-bottom: 20px;">당근나라 채팅 서버</h2>
                <div id="chatWindow"></div>
                <input type="text" id="chatMessage" class="form-control" placeholder="메시지 입력"/>
                <button id="sendBtn" onclick="sendMessage();" class="btn btn-primary" style="margin-top: 10px;">전송</button>
                <button id="closeBtn" onclick="disconnect();" class="btn btn-default" style="margin-top: 10px;">채팅 종료</button>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
