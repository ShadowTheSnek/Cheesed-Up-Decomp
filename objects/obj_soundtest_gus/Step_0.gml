if (instance_exists(obj_cyop_loader) && (!instance_exists(obj_soundtest)))
    return;
if (safe_get(obj_soundtest, "play") || global.jukebox != -4)
    other.sprite_index = (other.gus ? spr_pepdance : spr_gusdance)
else
    other.sprite_index = (other.gus ? spr_player_idle : obj_player1.spr_lonegustavoidle)
