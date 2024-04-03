function draw_cards() {
	var deck_x = 96; 
    var deck_y = 448; 
    var spacing = 175; // 卡牌之间的间隔
	var player_target_x = 224; 
	var player_target_y = 768; 
	var cpu_target_x = 224; 
	var cpu_target_y = 128; 
	
	
	var cards_to_draw = 3; // 每次给玩家和CPU发三张牌
    var player_cards_drawn = 0;
    var cpu_cards_drawn = 0;
    global.player_hand = ds_list_create();
    global.cpu_hand = ds_list_create();

    while (player_cards_drawn < cards_to_draw) {
        with (instance_find(obj_card, player_cards_drawn + cpu_cards_drawn)) {
            if (isDeck) {
                isDeck = false; // 标记卡牌不再属于牌堆
               // moving = true; // 标记卡牌开始移动
                target_x = player_target_x + (player_cards_drawn * spacing) // 设置玩家卡牌的目标X坐标
                target_y = player_target_y; // 设置玩家卡牌的目标Y坐标
                state = "moving_to_player";
                global.total_cards_in_deck -= 1; // 更新牌堆中剩余的卡牌数量
                player_cards_drawn += 1;
            }
        }
    }

    while (cpu_cards_drawn < cards_to_draw) {
        with (instance_find(obj_card, player_cards_drawn + cpu_cards_drawn)) {
            if (isDeck) {
                isDeck = false;
               // moving = true;
                target_x = cpu_target_x + (cpu_cards_drawn * spacing); // 设置CPU卡牌的目标X坐标
                target_y = cpu_target_y; // 设置CPU卡牌的目标Y坐标
                state = "moving_to_cpu";
                global.total_cards_in_deck -= 1;
                cpu_cards_drawn += 1;
            }
        }
    }
}

	    //for (var i = 0; i < 3; i++) {
        // 给玩家抽牌并设置动画
        //var card = instance_create_layer(deck_x, deck_y, "Instances", obj_card);
        //card.card_type = ds_list_find_value(global.deck, 0);
        //ds_list_delete(global.deck, 0);
        //card.target_x = player_target_x + (i * spacing); // 为每张卡牌设置不同的X坐标
        //card.target_y = player_target_y;
        //card.state = "moving_to_player"; // 标记卡牌正在移动

        // 给CPU抽牌并设置动画
        //card = instance_create_layer(deck_x, deck_y, "Instances", obj_card);
        //card.card_type = ds_list_find_value(global.deck, 0);
       // ds_list_delete(global.deck, 0);
        //card.target_x = cpu_target_x + (i * spacing);
        //card.target_y = cpu_target_y;
        //card.state = "moving_to_cpu";
    //}
	
	// 给玩家发牌