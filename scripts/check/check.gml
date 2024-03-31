function check_and_reset_deck() {
    if (ds_list_size(global.deck_instances) == 0) { // 发牌堆没有牌了
        // 将弃牌堆的牌加入发牌堆，重置游戏状态
        reset_deck();
    }
}
