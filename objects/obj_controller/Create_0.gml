global.Rock = 0;
global.Paper = 1;
global.Scissors = 2;



global.deck = ds_list_create();
global.deck_instances = ds_list_create();

// 添加卡牌到ds_list
for (var i = 0; i < 8; i++) {
    ds_list_add(global.deck, 0); // 添加石头
    ds_list_add(global.deck, 1); // 添加剪刀
    ds_list_add(global.deck, 2); // 添加布
}
//global.player_hand = [];
//global.cpu_hand = [];
global.total_cards_in_deck = 24; // 初始时牌堆中有24张卡牌


player_target_x = 224; // 玩家卡牌的目标X坐标
player_target_y = 768; // 玩家卡牌的目标Y坐标
cpu_target_x = 224; // CPU卡牌的目标X坐标
cpu_target_y = 168; // CPU卡牌的目标Y坐标

// 创建牌堆的卡牌对象
var deck_x = 96; // 牌堆的X坐标
var deck_y = 348; // 牌堆的Y坐标
var card_height = 50; // 假设卡牌的高度（用于堆叠效果）


for (var i = 0; i < ds_list_size(global.deck); i++) {
    var card_type = ds_list_find_value(global.deck, i);
    var card = instance_create_layer(deck_x, deck_y + (i * card_height * 0.1), "Instances", obj_card);
    card.card_type = card_type;
	card.deck_position = i; // 设置卡牌在牌堆中的位置
    card.isDeck = true; // 可选：标记这些卡牌属于牌堆
	
	// 添加卡牌实例的id到global.deck_instances
    ds_list_add(global.deck_instances, card);
}
global.player_has_chosen = false;
global.cpu_has_chosen = false;

global.player_hand = ds_list_create();
global.cpu_hand = ds_list_create();

global.player_card_in_battle = noone; // 用于追踪玩家在战斗区的卡牌
global.cpu_card_in_battle = noone; // 用于追踪CPU在战斗区的卡牌

global.player_score = 0;
global.cpu_score = 0;

global.discard_pile = ds_list_create();



global.spacing = 0;// 初始化变量
global.cards_dealt_to_player = 0;
global.cards_dealt_to_cpu = 0;
global.dealing_to = "player"; // 控制当前是给玩家发牌还是给CPU发牌
global.deal_delay = room_speed * 0.5; // 控制每张牌发出的时间间隔，这里设置为半秒
global.deal_counter = global.deal_delay; // 计时器，用于控制发牌速度