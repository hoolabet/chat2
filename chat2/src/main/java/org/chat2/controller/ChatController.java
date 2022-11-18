package org.chat2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {

	// 채팅방 입장
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String view_chat(String id,String chat_url,HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		model.addAttribute("url",chat_url);
		return "view_chat";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public void main(String id, HttpSession session) {
		session.setAttribute("userId",id);
	}
}