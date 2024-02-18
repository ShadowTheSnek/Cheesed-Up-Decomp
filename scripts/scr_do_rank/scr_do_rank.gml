function scr_is_p_rank() //gml_Script_scr_is_p_rank
{
    var enemykilled = (global.prank_enemykilled || global.MOD.Pacifist || global.MOD.FromTheTop)
    var lap = (global.lap || global.MOD.FromTheTop)
    if (global.leveltosave == "dragonlair" || global.leveltosave == "grinch")
        return ((!global.combodropped) && enemykilled);
    if (global.leveltosave == "etb")
        return ((!global.combodropped) && global.secretfound >= 2 && (global.lap || global.MOD.DeathMode));
    if (global.leveltosave == "snickchallenge")
        return ((!global.combodropped) && (!(string_starts_with(room_get_name(room), "medieval"))));
    if global.MOD.OldLevels
        return (global.secretfound >= 6 && global.treasure && (!global.combodropped) && enemykilled);
    else if (global.leveltosave != "exit" && global.leveltosave != "secretworld" && (!global.MOD.DeathMode))
        return (lap && global.secretfound >= 3 && global.treasure && (!global.combodropped) && enemykilled);
    else if global.MOD.DeathMode
        return (global.secretfound >= 3 && global.treasure && (!global.combodropped) && enemykilled && global.shroomfollow && global.cheesefollow && global.tomatofollow && global.sausagefollow && global.pineapplefollow);
    else if (global.leveltosave == "exit")
        return (!global.combodropped);
    else
        return ((!global.combodropped) && enemykilled);
}

function scr_do_rank(argument0, argument1) //gml_Script_scr_do_rank
{
    if (argument0 == undefined)
        argument0 = 1
    if (argument1 == undefined)
        argument1 = 0
    fmod_event_instance_stop(global.snd_escaperumble, 1)
    var ex = x
    var ey = y
    var cx = (camera_get_view_x(view_camera[0]) + obj_screensizer.normal_size_fix_x)
    var cy = (camera_get_view_y(view_camera[0]) + obj_screensizer.normal_size_fix_y)
    rankpos_x = (ex - cx)
    rankpos_y = (ey - cy)
    if (global.timeattack == 1)
        obj_timeattack.stop = 1
    with (obj_wartimer)
        notification_push((47 << 0), [minutes, (seconds + addseconds)])
    targetDoor = "none"
    obj_camera.alarm[2] = -1
    if (!global.tutorial_room)
    {
        if (!argument1)
            scr_savescore(global.leveltosave)
        else
        {
            ini_open_from_string(obj_savesystem.ini_str)
            var _hats = global.hats
            if (ini_read_real("Hats", global.leveltosave, 0) < _hats)
                ini_write_real("Hats", global.leveltosave, _hats)
            var _extrahats = global.extrahats
            if (ini_read_real("Extrahats", global.leveltosave, 0) < _extrahats)
                ini_write_real("Extrahats", global.leveltosave, _extrahats)
            var _rank = "d"
            var maxhats = (6 + global.srank)
            var currhats = (_extrahats + _hats)
            if (currhats >= maxhats && (!global.bossplayerhurt))
                _rank = "p"
            else if (currhats >= (maxhats - 2))
                _rank = "s"
            else if (currhats >= (maxhats - 4))
                _rank = "a"
            else if (currhats >= (maxhats - 6))
                _rank = "b"
            else if (currhats >= (maxhats - 8))
                _rank = "c"
            global.rank = _rank
            scr_write_rank(global.leveltosave)
            scr_play_rank_music()
            obj_savesystem.ini_str = ini_close()
            gamesave_async_save()
        }
        notification_push((5 << 0), [global.leveltosave, global.secretfound, global.level_minutes, global.level_seconds])
        with (obj_achievementtracker)
            event_perform(ev_step, ev_step_normal)
    }
    else
    {
        var _lap = 0
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real("Tutorial", "finished", 1)
        if ((global.level_minutes < 2 || global.level_minutes < 1 || (global.level_minutes == 1 && global.level_seconds <= 40)) && ini_read_real("Tutorial", "lapunlocked", 0) == 0)
        {
            ini_write_real("Tutorial", "lapunlocked", 1)
            _lap = 1
        }
        obj_savesystem.ini_str = ini_close()
        if (_lap && (!global.sandbox))
            create_transformation_tip(gml_Script_lang_get_value("tutorial_lapunlock"))
    }
    if (global.combo > 0)
    {
        global.combotime = 0
        global.combo = 0
        with (obj_camera)
        {
            spr_palette = -4
            paletteselect = 0
            alarm[4] = -1
            for (var i = 0; i < min(global.comboscore, 500); i += 10)
            {
                var spr = scr_collectspr(obj_collect, undefined, 0)
                create_collect((obj_player1.x + irandom_range(-60, 60)), ((obj_player1.y - 100) + irandom_range(-60, 60)), spr, 10, spr_palette, paletteselect)
            }
        }
        global.comboscore = 0
    }
    if (!instance_exists(obj_endlevelfade))
    {
        with (gml_Script_instance_create(x, y, obj_endlevelfade))
        {
            do_rank = 1
            toppinvisible = argument0
            if (room == tower_tutorial1)
            {
                do_rank = 0
                targetRoom = tower_entrancehall
                targetDoor = "HUB"
            }
            else if (global.leveltosave == "secretworld")
                toppinvisible = 0
            else if (room == tower_entrancehall)
            {
                with (obj_followcharacter)
                    persistent = 0
                if (!global.exitrank)
                {
                    do_rank = 0
                    targetRoom = Endingroom
                    targetDoor = "A"
                    instance_destroy(obj_pigtotal)
                    stop_music()
                    fmod_event_instance_stop(global.snd_rank)
                    sound_play("event:/sfx/ending/towercollapsetrack")
                }
                else
                    toppinvisible = 0
            }
        }
    }
    with (obj_player)
    {
        state = states.door
        sprite_index = (isgustavo ? spr_ratmountenterdoor : spr_lookdoor)
    }
    obj_endlevelfade.alarm[0] = 235
    if check_sugarychar()
        obj_endlevelfade.alarm[0] = 190
    image_index = 0
    global.panic = 0
    global.snickchallenge = 0
    global.leveltorestart = -4
    gamesave_async_save()
}

