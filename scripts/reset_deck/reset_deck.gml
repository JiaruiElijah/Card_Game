function reset_deck(){
	global.z_height = 0;
	 // 遍历弃牌堆的卡牌，将它们加入发牌堆
    for (var i = 0; i < ds_list_size(global.discard_pile); i++) {
        var card_id = ds_list_find_value(global.discard_pile, i);
        ds_list_add(global.deck_instances, card_id);
        
        with (card_id) {
            showFront = false; // 隐藏卡牌符号
            target_x = 96; // 发牌堆的X坐标
            target_y = 348 + global.z_height; // 发牌堆的Y坐标
            state = "moving_to_deck"; // 更新状态控制移动逻辑
			
        }
		global.z_height += 5;
		
    }

    // 清空弃牌堆
    ds_list_clear(global.discard_pile);

    // 重新洗牌
	global.isShuffle = true
    shuffle_deck();

    // 重置游戏的其他必要状态

}