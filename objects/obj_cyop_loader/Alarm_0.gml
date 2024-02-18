var struct, varNames, j, ini, name, horDifference, verDifference, e, _temp_local_var_1, _temp_local_var_4, _temp_local_var_41, _temp_local_var_45;
ds_list_clear(global.cyop_broken_tiles)
with (obj_persistent)
{
    room_tiles = []
    room_bgs = []
}
var __yy_breakEx76 = 0
var __yy_continueEx76 = 0
@@try_hook@@(6820, 6900)
while 1
{
    if __yy_continueEx76
        break
    else
    {
        var _room = @@Global@@().custom_rooms[room_ind][1]
        var prop = _room.properties
        var i = 0
        var n = array_length(_room.instances)
        while (i < n)
        {
            var inst_data = _room.instances[i]
            if inst_data.deleted
                __yy_continueEx76 = 1
            else
            {
                if (inst_data.object >= array_length(objects))
                {
                    audio_stop_all()
                    audio_play_sound(sfx_pephurt, 0, false)
                    show_message(string("This tower is incompatible, because it was made using a mod that adds extra objects.\n\nSuggest fixing this in a forum post or something.\n\nName: {0}\nID: {1}", global.custom_tower_name, filename_name(global.custom_path)))
                    with (obj_pause)
                    {
                        hub = 0
                        event_perform(ev_alarm, 3)
                    }
                    return;
                    var _temp_local_var_1 = @@try_unhook@@()
                }
                var asset_name = objects[inst_data.object]
                var asset = asset_name
                switch asset
                {
                    case "obj_teleporter_receptor":
                        asset = obj_teleporter
                        break
                    case "obj_pizzasona_spawn":
                        asset = obj_bigcollect
                        break
                    default:
                        if is_string(asset)
                        {
                            trace("levelLoader - ", asset_name, " disallowed")
                            audio_stop_all()
                            audio_play_sound(sfx_pephurt, 0, false)
                            show_message(string("This tower is incompatible, because it probably uses one of those CYOP fixed objects mods.\n\nSuggest fixing this in a forum post or something.\n\nName: {0}\nID: {1}", global.custom_tower_name, filename_name(global.custom_path)))
                            with (obj_pause)
                            {
                                hub = 0
                                event_perform(ev_alarm, 3)
                            }
                            @@try_unhook@@()
                            return;
                        }
                }

            }
            i++
        }
        var backgrounds = variable_struct_get_names(_room.backgrounds)
        i = 0
        n = array_length(backgrounds)
        while (i < n)
        {
            var bg_data = variable_struct_get(_room.backgrounds, array_get(backgrounds, i))
            var layer_num = real(backgrounds[i])
            if (layer_num < 0)
                var lay = layer_create_fix((-500 - (layer_num * 10)))
            else
                lay = layer_create_fix((500 + (layer_num * 10)))
            var bg = layer_background_create_fix(lay, cyop_resolvevalue(((bg_data.panic_sprite != -1 && global.panic) ? bg_data.panic_sprite : bg_data.sprite), "spr"))
            layer_background_speed(bg, bg_data.image_speed)
            layer_background_htiled(bg, bg_data.tile_x)
            layer_background_vtiled(bg, bg_data.tile_y)
            layer_hspeed(lay, bg_data.hspeed)
            layer_vspeed(lay, bg_data.vspeed)
            layer_x(lay, bg_data.x)
            layer_y(lay, bg_data.y)
            with (obj_persistent)
            {
                array_push(room_bgs, 
                {
                    layer_id: lay,
                    layer_name: concat("Backgrounds_", i),
                    x: bg_data.x,
                    y: bg_data.y,
                    bg_id: bg,
                    bg_sprite: layer_background_get_sprite(bg),
                    par_x: (1 - bg_data.scroll_x),
                    par_y: (1 - bg_data.scroll_y)
                }
)
            }
            i++
        }
        with (obj_persistent)
            array_sort(room_bgs, function(argument0, argument1) //gml_Script_anon@4980@gml_Object_obj_cyop_loader_Alarm_0
            {
                return (layer_get_depth(argument1.layer_id) - layer_get_depth(argument0.layer_id));
                var _temp_local_var_45 = @@try_unhook@@()
            }
)
        var tile_layers = variable_struct_get_names(_room.tile_data)
        var f = method(
        {
            room_x: _room.properties.roomX,
            room_y: _room.properties.roomY,
            _room: _room
        }
, function(argument0, argument1) //gml_Script_anon@5280@gml_Object_obj_cyop_loader_Alarm_0
        {
            var tilelayer_data = variable_struct_get(_room.tile_data, argument0)
            var tiles = variable_struct_get_names(tilelayer_data)
            if (!array_length(tiles))
            {
                return;
                var _temp_local_var_41 = @@try_unhook@@()
            }
            layer_num = real(argument0)
            if (layer_num < 0)
                var depp = (-100 + layer_num)
            else
                depp = (layer_num * 5)
            var secret = layer_num <= -5
            var tilelayer = new cyop_tilelayer((-room_x), (-room_y), tilelayer_data, depp, secret)
            var inst = instance_create_depth(0, 0, depp, obj_cyop_tilelayer, 
            {
                tilelayer: tilelayer,
                secrettile: secret
            }
)
            if secret
            {
                if struct_exists(tilelayer_data, "ID")
                    inst.ID = tilelayer_data.ID
                else
                    struct_set(tilelayer_data, "ID", inst.id)
                if in_saveroom(inst.id)
                    inst.revealed = 1
            }
        }
)
        array_foreach(tile_layers, f, 0, infinity)
        var song = _room.properties.song
        var fade = _room.properties.songTransitionTime
        var state = states.normal
        var fmod = string_starts_with(song, "event:")
        if (fmod && string_pos(".", song) != 0)
        {
            var split = string_split(song, ".", 1, 1)
            song = split[0]
            state = real(split[1])
        }
        var event = (fmod ? song : cyop_resolvevalue(song, "sound"))
        if ((!is_string(event)) || fmod)
        {
            with (obj_music)
            {
                var found = -1
                i = 0
                while (i < array_length(custom_music))
                {
                    if (custom_music[i].event == event)
                    {
                        found = i
                        __yy_breakEx76 = 1
                        break
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
                if (current_custom != -4 && found != current_custom)
                {
                    if custom_music[current_custom].fmod
                    {
                        fmod_event_instance_set_paused(custom_music[current_custom].instance, 1)
                        custom_music[current_custom].paused = 1
                    }
                    else
                        audio_sound_gain(custom_music[current_custom].instance, 0, fade)
                }
                if (found > -1)
                {
                    current_custom = found
                    if custom_music[found].fmod
                    {
                        custom_music[found].paused = 0
                        fmod_event_instance_set_paused(custom_music[found].instance, 0)
                    }
                    else
                        audio_sound_gain(custom_music[found].instance, (global.option_music_volume * 0.5), fade)
                }
                else
                {
                    current_custom = array_length(custom_music)
                    array_push(custom_music, 
                    {
                        event: event,
                        instance: -4,
                        fmod: fmod,
                        state: state,
                        paused: 0
                    }
)
                }
            }
        }
        with (obj_player)
            event_perform(ev_other, ev_room_start)
        with (all)
            event_perform(ev_other, ev_room_start)
        scr_panicbg_init()
        break
    }
}
@@try_unhook@@()
