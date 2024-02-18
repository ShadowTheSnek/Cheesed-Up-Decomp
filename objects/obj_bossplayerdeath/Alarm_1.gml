with (obj_player1)
{
    global.player_damage = 0
    global.peppino_damage = 0
    global.bossplayerhurt = 0
    global.pistol = 0
    global.leveltorestart = -4
    global.leveltosave = -4
    global.startgate = 0
    ds_list_clear(global.saveroom)
    ds_list_clear(global.baddieroom)
    pistolanim = -4
    targetDoor = "HUB"
    targetRoom = backtohubroom
    scr_room_goto(backtohubroom)
    x = backtohubstartx
    y = backtohubstarty
    x = backtohubstartx
    y = (backtohubstarty - (obj_screensizer.actual_height * 2))
    state = states.backtohub
    sprite_index = spr_slipbanan1
    image_index = 10
}
global.level_minutes = 0
global.level_seconds = 0
with (obj_screensizer)
    camzoom = 1
with (gml_Script_instance_create(0, 0, obj_backtohub_fadeout))
{
    fadealpha = 1
    fadein = 0
    pos_player = 1
}
