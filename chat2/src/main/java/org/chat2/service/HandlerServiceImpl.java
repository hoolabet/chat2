package org.chat2.service;

import org.chat2.mapper.HandlerMapper;
import org.chat2.model.ChatVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HandlerServiceImpl implements HandlerService{
	@Autowired
	HandlerMapper hm;
	
	public void insertChat(ChatVO cvo) {
		hm.insertChat(cvo);
	}
	
}
