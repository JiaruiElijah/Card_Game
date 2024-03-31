function cpu_choose_card() {
    var cpu_cards_count = ds_list_size(global.cpu_hand); // 获取CPU手牌的数量
    if (cpu_cards_count > 0) {
        var chosen_index = irandom_range(0, cpu_cards_count - 1); // 随机选择一张卡牌
        var chosen_card_id = ds_list_find_value(global.cpu_hand, chosen_index); // 获取选中卡牌的实例ID
		show_debug_message("chosen")
		show_debug_message(chosen_index)
        with (chosen_card_id){
            target_x = 399; // CPU卡牌的目标X坐标
            target_y = 336; // CPU卡牌的目标Y坐标
            state = "moving_to_battle"; // 更新卡牌状态为移动到战斗区域
			global.cpu_choice = card_type; // 同样，card_type 是CPU选择的卡牌的类型
        }
		//ds_list_delete(global.cpu_hand, chosen_index);
		global.cpu_card_in_battle = chosen_card_id;  // 记录被选中的卡牌实例ID
		global.cpu_has_chosen = true;
    }
}
