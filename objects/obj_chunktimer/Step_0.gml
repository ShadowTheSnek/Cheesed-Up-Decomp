if (((!(((global.panic || global.snickchallenge) && ((!instance_exists(obj_ghostcollectibles)) || global.leveltosave == "sucrose" || global.leveltosave == "secretworld")))) || global.tutorial_room || global.MOD.DeathMode) && (!((global.lapmode == (2 << 0) && global.laps >= 2))))
    return;
if (room == timesuproom || room == rank_room || instance_exists(obj_endlevelfade))
    return;
if (global.fill > 0)
    global.fill -= 0.2
else
{
    global.fill = 0
    if (!instance_exists(obj_pizzaface))
    {
        var s = string_letters(room_get_name(room))
        var tower = string_copy(s, 1, 5) == "tower"
        if (((!tower) || global.lapmode == (2 << 0)) && (!global.snickchallenge))
        {
            gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_pizzaface)
            scr_pizzaface_laugh()
        }
        else
        {
            global.snickchallenge = 0
            with (obj_player1)
            {
                instance_destroy(obj_fadeout)
                targetDoor = "A"
                scr_room_goto(timesuproom)
                state = states.timesup
                sprite_index = spr_Timesup
                image_index = 0
                if tower
                {
                    backtohubroom = tower_finalhallway
                    backtohubstartx = 206
                    backtohubstarty = 690
                }
                if isgustavo
                    sprite_index = spr_ratmount_timesup
                visible = true
                image_blend = c_white
                stop_music()
            }
        }
    }
}
