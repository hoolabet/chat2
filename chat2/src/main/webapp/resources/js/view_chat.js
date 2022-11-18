/**
 * 
 */


$(document).on("keyup", function(e){
	if($("#user_id").val() == ""){
		return false;
	}
	if($("#message").css("display") != "none" && e.keyCode == 13 && $("#message").val() != ""){
		webSocket.sendChat();
	}
})

$("#btnSend").on("click", function() {
	if($("#user_id").val() == ""){
		return false;
	}
	webSocket.sendChat();
})

$("#chat_btn").on("click", function() {
	if($("#chat_box").css("display") == "none"){
		$("#chat_box").css("display","flex");
	}else{
		$("#chat_box").css("display","none");
	}
	$("#divChatData").scrollTop($("#divChatData")[0].scrollHeight);
})