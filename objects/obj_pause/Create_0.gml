pause = 0
i = 0
color = make_color_rgb(121, 103, 151)
scr_init_input()
player1 = -4
player2 = -4
selected = 0
stickpressed = 0
image_speed = 0
depth = -500
backbuffer = 2
savedmusicmuffle = 0
pause_menu = ["pause_resume", "pause_options", "pause_restart", "pause_exit"]
pause_menu_map = ds_map_create()
ds_map_set(pause_menu_map, "pause_resume", [0, function() //gml_Script_anon@392@gml_Object_obj_pause_Create_0
{
    scr_pause_activate_objects()
    pause_unpause_music()
    instance_destroy(obj_option)
    instance_destroy(obj_keyconfig)
}
])
ds_map_set(pause_menu_map, "pause_achievements", [5, function() //gml_Script_anon@590@gml_Object_obj_pause_Create_0
{
    fmod_event_one_shot("event:/sfx/ui/select")
    with (gml_Script_instance_create(x, y, obj_achievement_pause))
        depth = (other.depth - 1)
}
])
ds_map_set(pause_menu_map, "pause_options", [1, function() //gml_Script_anon@788@gml_Object_obj_pause_Create_0
{
    fmod_event_one_shot("event:/sfx/ui/select")
    with (gml_Script_instance_create(x, y, obj_option))
        depth = (other.depth - 1)
}
])
ds_map_set(pause_menu_map, "pause_restart", [2, function() //gml_Script_anon@975@gml_Object_obj_pause_Create_0
{
    if (room == Endingroom || room == tower_soundtest || room == tower_soundtestlevel || room == Creditsroom || room == Johnresurrectionroom)
        return;
    var rm = global.leveltorestart
    if (rm != -4 && rm != -1)
    {
        alarm[5] = 1
        roomtorestart = rm
        pause_unpause_music()
        stop_music()
        scr_pause_activate_objects()
        scr_pause_stop_sounds()
        instance_destroy(obj_option)
        instance_destroy(obj_keyconfig)
        pause = 0
    }
    else
        fmod_event_one_shot("event:/sfx/ui/select")
}
])
function anon@1521@gml_Object_obj_pause_Create_0() //gml_Script_anon@1521@gml_Object_obj_pause_Create_0
{
    if (room == Endingroom || room == Creditsroom || room == Johnresurrectionroom)
        return;
    reset_modifier()
    instance_activate_object(obj_cyop_loader)
    pause_unpause_music()
    stop_music()
    scr_pause_stop_sounds()
    instance_destroy(obj_option)
    instance_destroy(obj_keyconfig)
    fmod_event_instance_stop(global.snd_bossbeaten, 1)
    fmod_event_instance_stop(pausemusicID, 1)
    obj_music.music = -4
    var sl = ds_list_create()
    var il = ds_list_create()
    var arr = -4
    ds_list_copy(sl, sound_list)
    ds_list_copy(il, instance_list)
    if (global.leveltorestart != -4 || room == editor_entrance)
    {
        hub = 1
        arr = ["hubgroup"]
        global.stargate = 0
        global.leveltorestart = -4
    }
    else
    {
        hub = 0
        arr = ["menugroup"]
    }
    alarm[3] = 1
    ds_list_add(il, id)
    with (textures_offload(arr))
    {
        ds_list_clear(sound_list)
        ds_list_clear(instance_list)
        ds_list_copy(sound_list, sl)
        ds_list_copy(instance_list, il)
    }
    instance_deactivate_object_hook(id)
    ds_list_destroy(sl)
    ds_list_destroy(il)
}

ds_map_set(pause_menu_map, "pause_exit", [3, exit_function])
ds_map_set(pause_menu_map, "pause_exit_title", [3, exit_function])
ds_map_set(pause_menu_map, "pause_jukebox", [4, function() //gml_Script_anon@2800@gml_Object_obj_pause_Create_0
{
    array_delete(pause_menu, selected, 1)
    selected = 0
    fmod_event_instance_stop(global.jukebox.instance, 1)
    fmod_event_instance_release(global.jukebox.instance)
    global.jukebox = -4
    fmod_event_instance_play(pausemusicID)
    fmod_event_instance_set_paused(pausemusicID, 0)
}
])
cursor_index = 0
cursor_sprite_number = sprite_get_number(spr_angelpriest)
cursor_sprite_height = sprite_get_height(spr_angelpriest)
cursor_x = -1000
cursor_y = -1000
cursor_actualx = 0
cursor_actualy = 0
update_cursor = 0
hub = 1
treasurefound = 0
treasurealpha = 0
secretcount = 0
secretalpha = 0
transfotext = -4
transfotext_size = 0
roomtorestart = -4
pausemusicID = fmod_event_create_instance("event:/music/pause")
savedsecretpause = 0
savedmusicpause = 0
savedpillarpause = 0
savedpanicpause = 0
savedkidspartypause = 0
fade = 0
fadein = 0
screensprite = -4
screensprite2 = -4
screensize = 0
guisprite = -4
instance_list = ds_list_create()
sound_list = ds_list_create()
priest_list = ds_list_create()
start = 0
pause_icons = array_create(0)
scr_pauseicon_add(spr_pauseicons, 0, -20, -12)
scr_pauseicon_add(spr_pauseicons, 1, 5, -15)
scr_pauseicon_add(spr_pauseicons, 2, -10)
scr_pauseicon_add(spr_pauseicons, 3, -10)
scr_pauseicon_add(spr_pauseicons, 4, -10)
scr_pauseicon_add(spr_pauseicons, 8, 0, -12)
alarm[1] = 1
spr_palette = spr_peppalette
paletteselect = 1
character = "P"
