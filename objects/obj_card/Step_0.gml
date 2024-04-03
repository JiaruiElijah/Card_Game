depth = -y;
if (state == "moving_to_player" || state == "moving_to_cpu") {
	//show_debug_message("moving")
	

    var card_speed = 0.1; // 调整这个值以控制移动速度
    x += (target_x - x) * card_speed;
    y += (target_y - y) * card_speed;
    
    // 检查是否接近目标位置 停止移动
    if (point_distance(x, y, target_x, target_y) < 1) {
		x = target_x; // 精确对齐到目标位置
        y = target_y;
        state = "idle"; // 到达目标位置后更新状态
		
    }
}

if (state == "moving_to_battle") {

    var move_speed = 0.1;
    x += (target_x - x) * move_speed;
    y += (target_y - y) * move_speed;

    // 检查卡牌是否接近目标位置
    if (point_distance(x, y, target_x, target_y) < 1) {
        x = target_x; // 对齐到目标位置
        y = target_y;
        state = "idle"; // 到达后更新状态
    }
}

if (state == "moving_to_discard") {

    var move_speed = 0.1;
    x += (target_x - x) * move_speed;
    y += (target_y - y) * move_speed;

    // 检查卡牌是否接近目标位置
    if (point_distance(x, y, target_x, target_y) < 1) {
        x = target_x; // 对齐到目标位置
        y = target_y;
        state = "idle"; // 到达后更新状态
    }
}
if (state == "moving_to_deck") {

    var move_speed = 0.1;
    x += (target_x - x) * move_speed;
    y += (target_y - y) * move_speed;

    // 检查卡牌是否接近目标位置
    if (point_distance(x, y, target_x, target_y) < 1) {
        x = target_x; // 对齐到目标位置
        y = target_y;
        state = "idle"; // 到达后更新状态
    }
}
