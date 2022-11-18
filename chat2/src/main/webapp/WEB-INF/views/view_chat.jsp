<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹소켓 채팅</title>
<link rel="stylesheet" href="../resources/css/view_chat.css">
</head>
<body>
	<input type="hidden" id="user_id" value="${userId}">
	<input type="hidden" id="url" value="${url}">
	<div id="chat_box">
		<div id="divChatData"></div>
		<div id="chat_ctrl">
			<input type="text" id="message" /> <input type="button" id="btnSend"
				value="채팅 전송" />
		</div>
	</div>
	<div id="chat_btn">💬</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<script>
	$(window).on('load', function () {
		webSocket.init({ url: '<c:url value="/chat" />' });	
	});


	const webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function() {
				this._sendMessage('${param.chat_url}', 'CMD_MSG_SEND', $("#user_id").val(), $('#message').val());
				$('#message').val('');
			},
			sendEnter: function() {
				this._sendMessage('${param.chat_url}', 'CMD_ENTER', $("#user_id").val(), $('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(msgData) {

				// 정의된 CMD 코드에 따라서 분기 처리
				if(msgData.cmd == 'CMD_MSG_SEND') {					
					$('#divChatData').append('<div>' + msgData.msg + '</div>');
					$("#divChatData").scrollTop($("#divChatData")[0].scrollHeight);
				}
				/* // 입장
					else if(msgData.cmd == 'CMD_ENTER') {
						$('#divChatData').append('<div>' + msgData.msg + '</div>');
					}
					// 퇴장
					else if(msgData.cmd == 'CMD_EXIT') {					
						$('#divChatData').append('<div>' + msgData.msg + '</div>');
					} */
			},
			closeMessage: function(str) {
				$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onopen = function() {
					webSocket.sendEnter();
				};
				this._socket.onmessage = function(e) {
					webSocket.receiveMessage(JSON.parse(e.data));
				};
				this._socket.onclose = function(e) {
					webSocket.closeMessage(JSON.parse(e.data));
				}
			},
			_sendMessage: function(chat_url, cmd, id, msg) {
				const msgData = {
						chat_url,
						cmd,
						id,
						msg
				};
				const jsonData = JSON.stringify(msgData);
				this._socket.send(jsonData);
			}
	};
	</script>
	<script src="../resources/js/view_chat.js"></script>
</body>
</html>