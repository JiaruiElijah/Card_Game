var battle_zone_x = 399;
var battle_zone_y = 575;


if (global.game_state == "PLAYER_CHOOSE") {
    if (isPlayerCard && showFront) {  // 确保这张卡属于玩家并且正面朝上
    target_x = battle_zone_x; // 设置卡牌移动到战斗区域的目标X坐标
    target_y = battle_zone_y; // 设置卡牌移动到战斗区域的目标Y坐标
    state = "moving_to_battle"; // 更新卡牌状态为移动到战斗区域
    
	global.player_card_in_battle = id; // chosen_card_id 是玩家选择的卡牌实例ID
	global.player_choice = card_type; // card_type 是选择的卡牌的类型
	global.player_has_chosen = true;
}
} else {

    return;
}
