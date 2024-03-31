// 在某个适合显示分数的对象的Draw事件中

draw_set_font(Font1);

// 绘制玩家分数
var player_score_text = "Player Score: " + string(global.player_score);
draw_text(831, 63, player_score_text);

// 绘制CPU分数
var cpu_score_text = "CPU Score: " + string(global.cpu_score);
draw_text(831, 100, cpu_score_text);