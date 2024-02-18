if (abs((x - obj_player1.x)) > 30)
    image_xscale = sign((obj_player1.x - x))
if (instance_exists(obj_cyop_loader) && (!instance_exists(obj_soundtest)))
    return;
if (safe_get(obj_soundtest, "play") || global.jukebox != -4)
    other.sprite_index = spr_scrimbsoundtest_dance
else
    other.sprite_index = spr_scrimbsoundtest
