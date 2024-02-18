with (obj_player1)
{
    other.spr_palette = spr_palette
    other.paletteselect = paletteselect
    other.character = character
}
if ((!pause) && instance_exists(obj_player1) && (obj_player1.key_start || ((!window_has_focus()) && global.unfocus_pause)) && room != Mainmenu && room != Finalintro && room != hub_loadingscreen && room != Endingroom && room != Creditsroom && room != Johnresurrectionroom && room != Longintro && room != Realtitlescreen && room != rank_room)
{
    var _cutscenehandler = 0
    with (obj_cutscene_handler)
    {
        if (!loop)
            _cutscenehandler = 1
    }
    with (obj_player1)
    {
        if ((instance_exists(obj_bosskey) && state == states.victory) || (state == states.victory && place_meeting(x, y, obj_startgate)) || (state == states.door && place_meeting(x, y, obj_exitgate)))
            _cutscenehandler = 1
    }
    with (obj_charswitch_intro)
        _cutscenehandler = 1
    with (obj_bossplayerdeath)
        _cutscenehandler = 1
    with (obj_titlecard)
        _cutscenehandler = 1
    with (obj_taxi)
    {
        if move
            _cutscenehandler = 1
    }
    with (obj_taxidud)
    {
        if (!start)
            _cutscenehandler = 1
    }
    with (obj_pizzafaceboss_p3intro)
        _cutscenehandler = 1
    with (obj_pizzahead_finalecutscene)
        _cutscenehandler = 1
    if global.in_menu
        _cutscenehandler = 1
    with (obj_modconfig)
        _cutscenehandler = 1
    with (obj_jumpscare)
        _cutscenehandler = 1
    with (obj_technicaldifficulty)
        _cutscenehandler = 1
    if (obj_savesystem.state == states.normal && (!_cutscenehandler) && room != rank_room && room != Realtitlescreen && room != timesuproom && room != rm_baby && room != room_cancelled)
    {
        destroy_sounds([pausemusicID])
        if check_sugary()
            pausemusicID = fmod_event_create_instance("event:/modded/sugary/pause")
        else if is_holiday((1 << 0))
            pausemusicID = fmod_event_create_instance("event:/music/halloweenpause")
        else
            pausemusicID = fmod_event_create_instance("event:/music/pause")
        selected = 0
        fadein = 1
        pause = 1
        fade = 0
        pause_menu = ["pause_resume", "pause_options"]
        if (global.leveltorestart != -4)
        {
            array_push(pause_menu, "pause_restart")
            var ach_allowed = ["entrance", "medieval", "ruin", "dungeon", "badland", "farm", "saloon", "graveyard", "plage", "forest", "minigolf", "space", "street", "sewer", "industrial", "freezer", "kidsparty", "chateau", "war"]
            if array_contains(ach_allowed, global.leveltosave)
                array_push(pause_menu, "pause_achievements")
            array_push(pause_menu, "pause_exit")
        }
        else
            array_push(pause_menu, (room == editor_entrance ? "pause_exit" : "pause_exit_title"))
        if (global.jukebox != -4)
            array_push(pause_menu, "pause_jukebox")
        with (obj_music)
        {
            if (global.jukebox != -4)
                waiting = 1
            if (music != noone)
            {
                other.savedmusicpause = fmod_event_instance_get_paused(music.event)
                other.savedsecretpause = fmod_event_instance_get_paused(music.event_secret)
                fmod_event_instance_set_paused(music.event, 1)
                fmod_event_instance_set_paused(music.event_secret, 1)
            }
            other.savedpillarpause = fmod_event_instance_get_paused(pillarmusicID)
            other.savedkidspartypause = fmod_event_instance_get_paused(kidspartychaseID)
            other.savedpanicpause = fmod_event_instance_get_paused(panicmusicID)
            fmod_event_instance_set_paused(pillarmusicID, 1)
            fmod_event_instance_set_paused(panicmusicID, 1)
            fmod_event_instance_set_paused(kidspartychaseID, 1)
        }
        if (global.leveltosave != -4)
        {
            ini_open_from_string(obj_savesystem.ini_str)
            treasurefound = ini_read_real("Treasure", global.leveltosave, 0)
            secretcount = ini_read_real("Secret", global.leveltosave, 0)
            ini_close()
            if (!treasurefound)
            {
                treasurefound = global.treasure
                treasurealpha = 0
            }
            else if (!global.treasure)
                treasurealpha = 0.5
            else
                treasurealpha = 0
            if (global.secretfound > secretcount)
            {
                secretcount = global.secretfound
                secretalpha = 0
            }
            else if (global.secretfound < secretcount)
                secretalpha = 0.5
            else
                secretalpha = 0
            if (secretcount > 3)
                secretcount = 3
        }
        else
        {
            treasurefound = 0
            secretcount = 0
        }
        scr_delete_pause_image()
        scr_create_pause_image()
        cursor_x = -60
        cursor_y = -300
        cursor_index = 0
        backbuffer = 2
        var _state = -4
        var _txt = -4
        with (obj_player1)
        {
            _state = state
            if (state == states.chainsaw)
                _state = tauntstoredstate
            switch _state
            {
                case (47 << 0):
                case (38 << 0):
                case (49 << 0):
                    _txt = gml_Script_lang_get_value("knighttip")
                    break
                case (10 << 0):
                    _txt = gml_Script_lang_get_value("firemouthtip")
                    break
                case (33 << 0):
                case (35 << 0):
                case (34 << 0):
                    _txt = gml_Script_lang_get_value("boxxedtip")
                    break
                case (11 << 0):
                case (13 << 0):
                case (14 << 0):
                case (12 << 0):
                    _txt = gml_Script_lang_get_value("morttip")
                    break
                case (16 << 0):
                    _txt = gml_Script_lang_get_value("ghosttip")
                    break
                case (184 << 0):
                case (185 << 0):
                    _txt = gml_Script_lang_get_value("rockettip")
                    break
                case (113 << 0):
                case (115 << 0):
                case (114 << 0):
                case (116 << 0):
                    _txt = gml_Script_lang_get_value("barreltip")
                    break
                case (211 << 0):
                    if (sprite_index == spr_player_corpsesurf || sprite_index == spr_player_corpsestart)
                        _txt = gml_Script_lang_get_value("gravesurftip")
                    else
                        _txt = gml_Script_lang_get_value("trashrolltip")
                    break
                case (265 << 0):
                    _txt = gml_Script_lang_get_value("antigravtip")
                    break
                case (24 << 0):
                case (29 << 0):
                case (25 << 0):
                case (26 << 0):
                case (30 << 0):
                    _txt = gml_Script_lang_get_value("cheesedtip")
                    break
                case (148 << 0):
                    _txt = gml_Script_lang_get_value("golftip")
                    break
                case (31 << 0):
                    _txt = gml_Script_lang_get_value("weenietip")
                    break
            }

            if (_txt == -4)
            {
                if shotgunAnim
                {
                    _txt = gml_Script_lang_get_value("shotguntip")
                    if (global.shootbutton != 0)
                        _txt = string_replace(_txt, "[G]", "[S]")
                }
                else if global.noisejetpack
                    _txt = gml_Script_lang_get_value("jetpack2tip")
            }
        }
        if (_txt != -4)
        {
            draw_set_font(gml_Script_lang_get_font("creditsfont"))
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            transfotext = scr_compile_icon_text(_txt)
            transfotext_size = scr_text_arr_size(transfotext)
        }
        else
            transfotext = -4
        scr_pause_deactivate_objects()
        if (global.jukebox == -4)
        {
            fmod_event_instance_play(pausemusicID)
            fmod_event_instance_set_paused(pausemusicID, 0)
        }
    }
}
with (obj_player1)
{
    other.paletteselect = paletteselect
    other.spr_palette = spr_palette
}
border1_xstart = 0
border1_ystart = obj_screensizer.actual_height
border1_xend = -96
border1_yend = (obj_screensizer.actual_height + 100)
border2_xstart = obj_screensizer.actual_width
border2_ystart = obj_screensizer.actual_height
border2_xend = (obj_screensizer.actual_width + 96)
border2_yend = (obj_screensizer.actual_height + 100)
if is_holiday((1 << 0))
{
    border1_xend = -128
    border1_yend = (obj_screensizer.actual_height + 150)
    border2_xend = (obj_screensizer.actual_width + 128)
    border2_yend = (obj_screensizer.actual_height + 150)
}
vine_ystart = 0
vine_yend = -117
if (!start)
{
    start = 1
    border2_x = border2_xend
    border2_y = border2_yend
    border1_x = border1_xend
    border1_y = border1_yend
    vine_y = vine_yend
}
var a = 0.1
if (!instance_exists(obj_loadingscreen))
{
    if fadein
    {
        fade = Approach(fade, 1, a)
        border1_x = lerp(border1_x, border1_xstart, a)
        border1_y = lerp(border1_y, border1_ystart, a)
        border2_x = lerp(border2_x, border2_xstart, a)
        border2_y = lerp(border2_y, border2_ystart, a)
        vine_y = lerp(vine_y, vine_ystart, a)
        cursor_x = lerp(cursor_x, 0, (a / 2))
        cursor_y = lerp(cursor_y, 0, a)
    }
    else
    {
        fade = Approach(fade, 0, a)
        border1_x = lerp(border1_x, border1_xend, a)
        border1_y = lerp(border1_y, border1_yend, a)
        border2_x = lerp(border2_x, border2_xend, a)
        border2_y = lerp(border2_y, border2_yend, a)
        vine_y = lerp(vine_y, vine_yend, a)
        cursor_x = lerp(cursor_x, 20, (a / 2))
        cursor_y = lerp(cursor_y, -100, a)
    }
}
cursor_index += 0.35
pause_update_priests()
if (pause && (!instance_exists(obj_option)) && (!instance_exists(obj_achievement_pause)) && alarm[3] == -1)
{
    scr_menu_getinput()
    var _dvc = obj_inputAssigner.player_input_device[0]
    key_back = (key_back || key_start)
    if (backbuffer > 0)
    {
        backbuffer--
        key_back = 0
    }
    moveselect = ((-key_up2) + key_down2)
    var prevselect = selected
    selected += moveselect
    if (selected >= array_length(pause_menu))
        selected = 0
    else if (selected < 0)
        selected = (array_length(pause_menu) - 1)
    if (prevselect != selected)
    {
        sound_play((check_sugary() ? "event:/sfx/ui/step" : "event:/sfx/ui/angelmove"))
        update_cursor = 1
    }
    if key_back
    {
        selected = 0
        key_jump = 1
    }
    if key_jump
        self.array_get(ds_map_find_value(pause_menu_map, array_get(pause_menu, selected)), 1)()
}
if (keyboard_check_pressed(vk_f12) && sprite_exists(screensprite))
{
    sprite_save(screensprite, 0, string("screenshots/{0}.png", string("{0}-{1}-{2}__{3}-{4}-{5}", current_year, current_month, current_day, current_hour, current_minute, current_second)))
    if ((!window_get_fullscreen()) && os_type == os_windows)
        launch_external(string("\"{0}screenshots\\\"", game_save_id))
    with (create_transformation_tip(gml_Script_lang_get_value_newline("screenshottaken")))
        depth = (other.depth - 1)
}
if pause
    scr_pauseicons_update(array_get(ds_map_find_value(pause_menu_map, array_get(pause_menu, selected)), 0))
else
    scr_pauseicons_update(-1)
