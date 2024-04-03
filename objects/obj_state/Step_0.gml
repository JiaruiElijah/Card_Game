switch (global.game_state) {
    case "INIT":

		if(global.isShuffle){
			shuffle_deck()
		}
	
		if (current_time - global.startTime >= global.delayDuration) {
			global.isTime = true;
			global.game_state = "DEAL_CARDS";
		}
		

		//global.game_state = "DEAL_CARDS";
        //alarm[0] = room_speed * 2; // 延时2秒后触发Alarm 0事件
		//show_debug_message(current_time);
        break;
    case "DEAL_CARDS":
        // 发牌逻辑
        //draw2_cards()
		show_debug_message("deallingggggg")
		draw3();
		time();
		if (current_time - global.startTime >= global.delayDuration * 2) {
			global.game_state = "PLAYER_CHOOSE";
		}
        //global.game_state = "PLAYER_CHOOSE";

        break;
    case "PLAYER_CHOOSE":
        // 检查玩家是否已经选择了一张卡牌
        if (global.player_has_chosen) {
			time();
			if (current_time - global.startTime >= global.delayDuration) {
				global.isTime = true;
				global.game_state = "CPU_CHOOSE";
				global.cpu_has_chosen = false;
			}
        }
        break;
    case "CPU_CHOOSE":
        // CPU选择卡牌
		if(!global.cpu_has_chosen){
			cpu_choose_card();
		}

		time();
		if (current_time - global.startTime >= global.delayDuration) {
			global.isTime = true;
			global.game_state = "RESOLVE_BATTLE";
		}
        break;
    case "RESOLVE_BATTLE":
        // 解析战斗，显示结果，更新分数
		flip()
		if(global.isJudge){
		  judge()
		}

		time()
		if (current_time - global.startTime >= global.delayDuration) {
			global.isTime = true;
			global.game_state = "DISCARD_CARDS";
			global.isJudge = true;
		}
        break;
    case "DISCARD_CARDS":
        // 将卡牌移动到弃牌堆
        collect();
		time();
		if (current_time - global.startTime >= global.delayDuration/2) {
			global.isTime = true;
			global.game_state = "CHECK_DECK";
		}
        break;
    case "CHECK_DECK":
        // 检查发牌堆是否需要重置
        check_and_reset_deck();
		time();
		if (current_time - global.startTime >= global.delayDuration/2) {
			global.isTime = true;
			global.game_state = "DEAL_CARDS";
		}
        break;

}
show_debug_message(global.startTime)