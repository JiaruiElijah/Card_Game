function draw2_cards() {
	var deck_x = 96; 
    var deck_y = 448; 
    var spacing = 175; 
	var player_target_x = 224; 
	var player_target_y = 768; 
	var cpu_target_x = 224; 
	var cpu_target_y = 128; 
	
	
	var cards_to_draw = 3; 
    var player_cards_drawn = 0;
    var cpu_cards_drawn = 0;
    global.player_hand = ds_list_create();
    global.cpu_hand = ds_list_create();
	
	global.player_has_chosen = false;



	for (var i = 0; i < cards_to_draw; i++) {
	    // 给玩家发牌
	    var card = ds_list_find_value(global.deck_instances, 0);
		//var card = instance_find(obj_card, player_cards_drawn + cpu_cards_drawn)
	    card.isDeck = false;
		player_cards_drawn +=1;
	    card.target_x = player_target_x + (i * spacing);
	    card.target_y = player_target_y;
	    card.state = "moving_to_player";
		card.showFront = true;
		card.isPlayerCard = true;
	    global.total_cards_in_deck -= 1;
	    ds_list_delete(global.deck_instances, 0);
	    ds_list_add(global.player_hand, card);
		audio_play_sound(Sound3, 1, false);

	    // 给CPU发牌
	    card = ds_list_find_value(global.deck_instances, 0);
		//var card = instance_find(obj_card, player_cards_drawn + cpu_cards_drawn)
	    card.isDeck = false;
		cpu_cards_drawn +=1;
	    card.target_x = cpu_target_x + (i * spacing);
	    card.target_y = cpu_target_y;
	    card.state = "moving_to_cpu";
		

	    global.total_cards_in_deck -= 1;
	    ds_list_delete(global.deck_instances, 0);
	    ds_list_add(global.cpu_hand, card);
	}


    
}
