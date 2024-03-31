function draw3(){
// 在Step事件中
	var player_target_x = 224; 
	var player_target_y = 768; 
	var cpu_target_x = 224; 
	var cpu_target_y = 128; 

	
	global.player_has_chosen = false;

	if (global.deal_counter <= 0) {
	    if (global.dealing_to == "player" && global.cards_dealt_to_player < 3) {
	        // 给玩家发牌的逻辑
	        var card = ds_list_find_value(global.deck_instances, 0);
	        // 发牌动画逻辑（需要自行实现）
		    card.isDeck = false;
		    card.target_x = player_target_x + global.spacing;
		    card.target_y = player_target_y;
		    card.state = "moving_to_player";
			
			card.showFront = true;
			card.isPlayerCard = true;
		    global.total_cards_in_deck -= 1;
			

		    ds_list_add(global.player_hand, card);
			audio_play_sound(Sound3, 1, false);
			
			
	        global.cards_dealt_to_player += 1;
	        
			ds_list_delete(global.deck_instances, 0); // 从牌堆中移除这张牌
			global.spacing += 175;
	        if (global.cards_dealt_to_player >= 3) {
	            global.dealing_to = "cpu"; // 切换到给CPU发牌
				global.spacing = 0;
	        }
	    } 
		
		else if (global.dealing_to == "cpu" && global.cards_dealt_to_cpu < 3) {
	        // 给CPU发牌的逻辑
			
	        var card = ds_list_find_value(global.deck_instances, 0);
	        // 发牌动画逻辑（需要自行实现）
	        card.isDeck = false;
		    card.target_x = cpu_target_x + global.spacing;
		    card.target_y = cpu_target_y;
		    card.state = "moving_to_cpu";

		    global.total_cards_in_deck -= 1;
		    ds_list_add(global.cpu_hand, card);
			audio_play_sound(Sound3, 1, false);
	        global.cards_dealt_to_cpu += 1;
	        ds_list_delete(global.deck_instances, 0); // 从牌堆中移除这张牌
			global.spacing += 175;
			
			if (global.cards_dealt_to_cpu >= 3) {
				global.spacing = 0;

	        }
	    }
    
	    global.deal_counter = global.deal_delay; // 重置计时器
	} else {
	    global.deal_counter -= 1; // 减少计时器直到下一次发牌
	}


}