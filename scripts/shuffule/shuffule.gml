
function shuffle_deck() {
	audio_play_sound(Sound4, 1, false);
    var size = ds_list_size(global.deck_instances);
    for (var i = size - 1; i >= 0; i--) {
        var j = irandom(i);
        var temp = ds_list_find_value(global.deck_instances, i);
        ds_list_set(global.deck_instances, i, ds_list_find_value(global.deck_instances, j));
        ds_list_set(global.deck_instances, j, temp);
    }
	global.isShuffle = false;
}
