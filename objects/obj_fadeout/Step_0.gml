var f = 1
if (group_arr != -4)
    f = 1.2
if (fadealpha > f)
{
    var q = 0
    if (!fadein)
    {
        q = 1
        with (obj_camera)
            lock = 0
        if (gamestart || (instance_exists(obj_cyop_loader) && obj_cyop_loader.gamestart))
        {
            with (obj_cyop_loader)
                gamestart = 0
            ini_open_from_string(obj_savesystem.ini_str)
            global.file_minutes = ini_read_real("Game", "minutes", 0)
            global.file_seconds = ini_read_real("Game", "seconds", 0)
            global.sandbox = ini_read_real("Game", "sandbox", 1)
            ini_close()
        }
        if restarttimer
        {
            global.level_minutes = 0
            global.level_seconds = 0
        }
    }
    if finalhallway
    {
        with (obj_player)
        {
            state = states.normal
            movespeed = 0
            landAnim = 0
            hallway = 1
            hallwaydirection = 1
            targetDoor = "C"
        }
    }
    fadein = 1
    if (q && group_arr != -4)
    {
        instance_destroy(obj_pigtotal)
        alarm[0] = 1
        with (gml_Script_instance_create(0, 0, obj_loadingscreen))
        {
            dark = 1
            group_arr = other.group_arr
            offload_arr = other.offload_arr
            persistent = 1
        }
    }
    else
    {
        event_perform(ev_alarm, 0)
        if (q && offload_arr != -4)
        {
            trace(string("[obj_fadeout] Flushing textures: {0}", offload_arr))
            var i = 0
            var n = array_length(offload_arr)
            while (i < n)
            {
                texture_flush(offload_arr[i])
                i++
            }
        }
    }
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
if instance_exists(obj_player)
{
    with (obj_player1)
    {
        if (other.fadein == 1 && (state == states.door || state == states.victory) && (sprite_index == spr_victory || sprite_index == spr_ratmountvictory || place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate) || (place_meeting(x, y, obj_exitgate) && instance_exists(obj_cyop_loader)) || place_meeting(x, y, obj_hubelevator)))
        {
            state = states.comingoutdoor
            image_index = 0
        }
        if (other.fadein == 1 && state == -1)
        {
            state = states.comingoutdoor
            image_index = 0
            visible = true
        }
        if (other.fadein == 1 && state == states.door && box)
        {
            if isgustavo
                state = states.ratmountcrouch
            else if (character == "S")
                state = states.normal
            else
            {
                state = states.crouchjump
                uncrouch = 20
            }
        }
    }
}
if (fadein == 1 && fadealpha < 0)
    instance_destroy()
