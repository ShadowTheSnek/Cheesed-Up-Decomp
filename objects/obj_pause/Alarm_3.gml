pause = 0
scr_pause_stop_sounds()
scr_pause_activate_objects()
if (room == editor_entrance)
{
    with (obj_player)
        cyop_backtohubroom = -4
}
if instance_exists(obj_cyop_loader)
{
    with (obj_tv)
        tv_bg.sprite = spr_gate_cyopBG
}
var rm = room
if ((!hub) || (instance_exists(obj_cyop_loader) && (!is_string(obj_player1.backtohubroom))))
{
    pause = 0
    if instance_exists(obj_cyop_loader)
    {
        instance_destroy(obj_cyop_loader)
        obj_player1.targetRoom = editor_entrance
        scr_room_goto(editor_entrance)
    }
    else
    {
        obj_player1.targetRoom = Realtitlescreen
        scr_room_goto(Realtitlescreen)
        with (obj_player1)
        {
            character = "P"
            scr_characterspr()
        }
    }
    global.leveltosave = -4
    global.leveltorestart = -4
    scr_playerreset()
    alarm[0] = 2
    obj_player1.state = states.titlescreen
    obj_player1.targetDoor = "A"
    if instance_exists(obj_player2)
        obj_player2.targetDoor = "A"
    global.cowboyhat = 0
    global.coop = 0
}
else if (instance_exists(obj_cyop_loader) && is_string(obj_player1.backtohubroom))
{
    with (gml_Script_instance_create(0, 0, obj_backtohub_fadeout))
        fadealpha = 0.9
    global.levelreset = 1
    cyop_load_level_internal(global.custom_hub_level, 1)
}
else
{
    instance_destroy(obj_cyop_loader)
    with (gml_Script_instance_create(0, 0, obj_backtohub_fadeout))
        fadealpha = 0.9
    scr_playerreset()
    global.levelreset = 1
    obj_player1.targetDoor = "HUB"
    if instance_exists(obj_player2)
        obj_player2.targetDoor = "HUB"
    global.leveltorestart = -4
    global.leveltosave = -4
}
if (rm == boss_pizzaface || rm == boss_noise || rm == boss_pepperman || rm == boss_fakepep || rm == boss_vigilante)
    global.bossintro = 1
