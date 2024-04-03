function judge(){
		// （0剪刀、1布、2石头）
	var result = (3 + global.player_choice - global.cpu_choice) % 3;

	switch (result) {
	    case 1: // CPU胜
	        global.cpu_score += 1;
			audio_play_sound(Sound2, 1, false);
	        break;
	    case 2: // 玩家胜
	        global.player_score += 1;
			audio_play_sound(Sound1, 1, false);
	        break;
	    case 0: // 平局，不更改分数
	        break;
	}
	global.isJudge = false


}