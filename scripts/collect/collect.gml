function collect(){
	// 显示CPU手牌
	for (var i = 0; i < ds_list_size(global.cpu_hand); i++) {
	    var card_id = ds_list_find_value(global.cpu_hand, i);
	    with (card_id) {
	        showFront = true;
	    }
	}
	
	var discard_pile_x = 704 // 弃牌堆的X坐标
	var discard_pile_y = 448 // 弃牌堆的Y坐标

	// 移动玩家手牌到弃牌堆
	for (var i = 0; i < ds_list_size(global.player_hand); i++) {
	    var card_id = ds_list_find_value(global.player_hand, i);
	    with (card_id) {
	        target_x = discard_pile_x;
	        target_y = discard_pile_y;
	        state = "moving_to_discard"; // 更新状态控制移动逻辑
			ds_list_add(global.discard_pile, card_id);
			
	    }
	}
	ds_list_clear(global.player_hand);

	// 移动CPU手牌到弃牌堆
	for (var i = 0; i < ds_list_size(global.cpu_hand); i++) {
	    var card_id = ds_list_find_value(global.cpu_hand, i);
	    with (card_id) {
	        target_x = discard_pile_x;
	        target_y = discard_pile_y;
	        state = "moving_to_discard";
			ds_list_add(global.discard_pile, card_id);
			
	    }
	}
	ds_list_clear(global.cpu_hand);
	global.dealing_to = "player";
	global.cards_dealt_to_player = 0;
	global.cards_dealt_to_cpu = 0;


}