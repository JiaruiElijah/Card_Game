if (showFront) {
    // 展示卡牌的正面，假设有sprite_front_stone、sprite_front_scissors、sprite_front_paper
    switch (card_type) {
        case 0:
            draw_sprite(spr_cissor, 0, x, y);
            break;
        case 1:
            draw_sprite(spr_paper, 0, x, y);
            break;
        case 2:
            draw_sprite(spr_rock, 0, x, y);
            break;
    }
} else {
  
    draw_sprite(spr_cardback, 0, x, y);
}
