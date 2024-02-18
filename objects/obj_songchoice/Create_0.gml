event_inherited()
sel = 
{
    game: 0,
    var song: 0
}

charshift = [0, 0, 1]
discrot = 0
dumbass = 0
discanim = 0
sections = []
function anon@202@gml_Object_obj_songchoice_Create_0(argument0, argument1) //gml_Script_anon@202@gml_Object_obj_songchoice_Create_0
{
    var struct = 
    {
        name: argument0,
        songs: argument1
    }

    array_push(sections, struct)
    return struct;
}

var pizzatower = []
var sugaryspire = []
var cheesedup = []
var custom = []
var events = fmod_soundtest_get_events(obj_fmod.banks[2].handle)
trace("Events: ", events)
for (var i = 0; i < events; i++)
{
    var category = fmod_soundtest_get_song_category(i)
    var arr = [fmod_soundtest_get_song_event(i), fmod_soundtest_get_song_name(i)]
    var alt = fmod_soundtest_get_song_alt(i)
    var split = fmod_soundtest_get_song_index(i)
    var array = custom
    switch category
    {
        case 0:
            array = pizzatower
            break
        case 1:
            array = cheesedup
            break
        case 2:
            array = sugaryspire
            break
    }

    if (split >= 0)
    {
        if (alt >= 0)
        {
            if (split >= array_length(array) || (!is_array(array[split])))
                array[split] = [1]
            array[split][(alt + 1)] = arr
        }
        else
            array[split] = arr
    }
    else
        array_push(array, arr)
}
if (array_length(pizzatower) > 0)
    self.add_section("Pizza Tower", pizzatower)
if (array_length(cheesedup) > 0)
    self.add_section("Cheesed Up", cheesedup)
if (array_length(sugaryspire) > 0)
    self.add_section("Sugary Spire", sugaryspire)
if (array_length(custom) > 0)
    self.add_section("Custom", custom)
if (array_length(sections) == 0)
{
    self.add_section("Failsafe", [["event:/music/pizzatime", "It's Pizza Time - MrSauceman"]])
    sel.game = 0
    sel.song = 0
}
if (global.jukebox != noone)
{
    sel.game = global.jukebox.sel.game
    sel.song = global.jukebox.sel.song
    alt = global.jukebox.sel.alt
    if (alt >= 0)
        sections[sel.game].songs[sel.song][0] = alt
}
scroll = -50
textx = 0
function anon@1933@gml_Object_obj_songchoice_Create_0(argument0) //gml_Script_anon@1933@gml_Object_obj_songchoice_Create_0
{
    if 1
    {
    }
    else
    {
        dragging = 0
        mouse_x_prev = 0
        buffer = 0
        pos = 0
    }
    gpu_set_blendmode(bm_normal)
    if (shader_current() == shd_masterclip)
    {
        var alphafix_pos = shader_get_uniform(shd_masterclip, "u_circle_alphafix")
        shader_set_uniform_f(alphafix_pos, 0)
    }
    else
        shader_reset()
    var talpha = 1
    draw_set_colour(c_black)
    draw_set_alpha(0.75)
    draw_rectangle(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, false)
    draw_set_alpha(1)
    draw_set_colour(c_white)
    var xscale = 2
    if (discanim >= 0.5)
    {
        discrot = 0
        xscale = lerp(0, 2, ((discanim * 2) - 1))
    }
    else
        xscale = lerp(2, 0, (discanim * 2))
    draw_sprite_ext(bg_jukeboxdisc, sel.game, 640, 280, xscale, 2, discrot, c_white, (talpha * 0.8))
    song = sections[sel.game].songs[sel.song]
    if (!is_string(song[0]))
        song = song[song[0]]
    var ballsack = string_split(song[1], " - ", 0, 1)
    var _palname = string_upper(ballsack[0])
    var _paldesc = ballsack[1]
    draw_set_alpha(charshift[2])
    draw_set_align(1, 2)
    draw_set_font(gml_Script_lang_get_font("bigfont"))
    draw_text_ext(((obj_screensizer.actual_width / 1.5) + random_range(-1, 1)), ((obj_screensizer.actual_height - 250) + charshift[1]), _palname, 32, 540)
    draw_set_valign(fa_top)
    draw_set_font(gml_Script_lang_get_font("font_small"))
    draw_text_ext((obj_screensizer.actual_width / 1.5), ((obj_screensizer.actual_height - 240) + charshift[1]), _paldesc, 16, 928)
    draw_set_alpha(1)
    var sep = (640 / array_length(sections))
    var lerpish = 0.5
    for (i = 0; i < array_length(sections); i++)
    {
        if (array_length(sections) > 1)
            lerpish = (i / (array_length(sections) - 1))
        draw_set_colour((sel.game == i ? c_white : c_gray))
        draw_text(lerp(sep, (obj_screensizer.actual_width - sep), (i / (array_length(sections) - 1))), 32, sections[i].name)
    }
    draw_set_halign(fa_left)
    draw_set_bounds((64 + charshift[0]), 0, (364 + charshift[0]), obj_screensizer.actual_height)
    var scroller = max(((sel.song - 8) * 16), 0)
    i = 0
    while (i < array_length(sections[sel.game].songs))
    {
        var yy = (128 + (i * 16))
        yy -= scroller
        if (yy < 0)
        {
            i++
            continue
        }
        else if (yy > 540)
            break
        else
        {
            if (yy <= 128)
                draw_set_alpha(((yy / 128) * talpha))
            if (yy > 412)
                draw_set_alpha((((540 - yy) / 128) * talpha))
            draw_set_colour((sel.song == i ? c_white : 0x888888))
            var temp_song = sections[sel.game].songs[i]
            if is_array(temp_song)
            {
                if (!is_string(temp_song[0]))
                    temp_song = temp_song[temp_song[0]]
                ballsack = string_split(temp_song[1], " - ", 0, 1)
                var str = string_replace_all(ballsack[0], "\n", " ")
                var textwidth = round((string_width(str) - 300))
                if (sel.song == i)
                {
                    scroll++
                    if (scroll >= (textwidth + 50))
                        scroll = -50
                }
                draw_text(((64 + charshift[0]) - (clamp(scroll, 0, max(textwidth, 0)) * sel.song == i)), (yy + textx), str)
            }
            i++
            continue
        }
    }
    draw_remove_bounds()
    draw_set_alpha(talpha)
    draw_sprite(spr_cursor, -1, ((28 + xo) + charshift[0]), (((138 - scroller) + (sel.song * 16)) + textx))
    var pussyboy = 0
    var john = spr_jukebox_john_idle
    var len = 0
    var bar_wd = sprite_get_width(spr_timer_bar)
    var bar_ht = sprite_get_height(spr_timer_bar)
    var bar_x = floor((640 - (bar_wd / 2)))
    var bar_y = (350 + charshift[1])
    if (global.jukebox != noone && song[0] == global.jukebox.name)
    {
        len = fmod_event_get_length(global.jukebox.name)
        if (--buffer <= 0)
        {
            pos = (fmod_event_instance_get_timeline_pos(global.jukebox.instance) / len)
            john = spr_jukebox_john_active
        }
        pussyboy = 1
    }
    else
        pos = 0
    if pussyboy
    {
        if (point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), gml_Script_device_mouse_y_to_gui_hook(0), bar_x, bar_y, (bar_x + bar_wd), (bar_y + bar_ht)) && mouse_check_button_pressed(mb_left))
            dragging = 1
        if (!mouse_check_button(mb_left))
            dragging = 0
        if dragging
        {
            buffer = 15
            var pos_raw = ((gml_Script_device_mouse_x_to_gui_hook(0) - bar_x) / bar_wd)
            pos = clamp(((gml_Script_device_mouse_x_to_gui_hook(0) - bar_x) / bar_wd), 0, 1)
            if (mouse_x_prev != gml_Script_device_mouse_x_to_gui_hook(0))
            {
                fmod_event_instance_play(global.jukebox.instance)
                fmod_event_instance_set_timeline_pos(global.jukebox.instance, (pos * len))
                if (pos_raw >= 0 && pos_raw <= 1)
                    discrot -= ((gml_Script_device_mouse_x_to_gui_hook(0) - mouse_x_prev) * 2)
            }
            mouse_x_prev = gml_Script_device_mouse_x_to_gui_hook(0)
        }
        else
            discrot -= 1
    }
    draw_set_alpha(charshift[2])
    draw_set_bounds((bar_x + 6), (bar_y + 6), lerp((bar_x + 6), ((bar_x + bar_wd) - 6), pos), ((bar_y + bar_ht) - 6), 1)
    draw_sprite_tiled(spr_jukebox_barfill, 0, ((-current_time) / 100), bar_y)
    draw_remove_bounds()
    draw_sprite(spr_timer_bar, 0, bar_x, bar_y)
    draw_sprite(john, -1, lerp((bar_x + 6), ((bar_x + bar_wd) - 6), pos), (bar_y + 13))
    draw_set_alpha(1)
}

xo = 0
