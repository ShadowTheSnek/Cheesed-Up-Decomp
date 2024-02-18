function scr_pauseicon_draw(argument0, argument1, argument2) //gml_Script_scr_pauseicon_draw
{
    var icon = pause_icons[argument0]
    draw_sprite_ext(icon.sprite_index, icon.image_index, ((argument1 + icon.sprite_xoffset) + icon.shake_x), ((argument2 + icon.sprite_yoffset) + icon.shake_y), 1, 1, 0, c_white, icon.image_alpha)
}

function scr_create_pause_image() //gml_Script_scr_create_pause_image
{
    draw_set_alpha(1)
    screenscale = min((obj_screensizer.actual_width / surface_get_width(application_surface)), (obj_screensizer.actual_height / surface_get_height(application_surface)))
    if (!surface_exists(obj_screensizer.gui_surf))
        return;
    var wd = max(surface_get_width(application_surface), surface_get_width(obj_screensizer.gui_surf))
    var ht = max(surface_get_height(application_surface), surface_get_height(obj_screensizer.gui_surf))
    var surface = surface_create_fix(wd, ht)
    if (!surface_exists(surface))
        return;
    surface_set_target(surface)
    draw_clear(c_black)
    gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)
    scr_draw_screen(0, 0, 1, 1, 1, 1)
    if ((!check_sugary()) || object_index != obj_pause)
        draw_surface(obj_screensizer.gui_surf, 0, 0)
    gpu_set_blendmode(bm_normal)
    surface_reset_target()
    if surface_exists(surface)
    {
        screensprite = sprite_create_from_surface(surface, 0, 0, wd, ht, false, false, 0, 0)
        screensprite2 = -4
        if global.gameplay
        {
            var surface2 = surface_create_fix(wd, ht)
            surface_set_target(surface2)
            shader_set_fix(shd_blur)
            shader_set_uniform_f(shader_get_uniform(shd_blur, "size"), 320, 180, 2)
            draw_surface(surface, 0, 0)
            surface_reset_target()
            screensprite2 = sprite_create_from_surface(surface2, 0, 0, wd, ht, false, false, 0, 0)
            surface_free(surface2)
        }
        surface_free(surface)
    }
}

function scr_draw_pause_image() //gml_Script_scr_draw_pause_image
{
    if (global.gameplay && sprite_exists(screensprite2))
    {
        if (fade < 1 && sprite_exists(screensprite))
            draw_sprite_ext(screensprite, 0, 0, 0, screenscale, screenscale, 0, c_white, 1)
        if (fade != 0)
            draw_sprite_ext(screensprite2, 0, 0, 0, screenscale, screenscale, 0, c_white, fade)
    }
    else if sprite_exists(screensprite)
        draw_sprite_ext(screensprite, 0, 0, 0, screenscale, screenscale, 0, c_white, 1)
}

function scr_pause_stop_sounds() //gml_Script_scr_pause_stop_sounds
{
    fmod_event_instance_stop(global.snd_alarm, 1)
    fmod_event_instance_stop(global.snd_bossbeaten, 1)
    fmod_event_instance_stop(global.snd_spaceship, 1)
    fmod_event_instance_stop(global.snd_escaperumble, 1)
    fmod_event_instance_stop(global.snd_johndead, 1)
}

function scr_delete_pause_image() //gml_Script_scr_delete_pause_image
{
    if sprite_exists(screensprite)
        sprite_delete(screensprite)
    if sprite_exists(screensprite2)
        sprite_delete(screensprite2)
}

function scr_pauseicon_add(argument0, argument1, argument2, argument3) //gml_Script_scr_pauseicon_add
{
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = 0
    array_push(pause_icons, 
    {
        sprite_index: argument0,
        image_index: argument1,
        image_alpha: 0,
        sprite_xoffset: argument2,
        sprite_yoffset: argument3,
        shake_x: 0,
        shake_y: 0
    }
)
}

function scr_pauseicons_update(argument0) //gml_Script_scr_pauseicons_update
{
    for (var i = 0; i < array_length(pause_icons); i++)
    {
        with (pause_icons[i])
        {
            if (i == argument0)
            {
                shake_x = random_range(-1, 1)
                shake_y = random_range(-1, 1)
                image_alpha = Approach(image_alpha, 1, 0.2)
            }
            else
            {
                shake_x = 0
                shake_y = 0
                image_alpha = Approach(image_alpha, 0, 0.2)
            }
        }
    }
}

function scr_pause_activate_objects(argument0) //gml_Script_scr_pause_activate_objects
{
    if (argument0 == undefined)
        argument0 = 1
    for (i = 0; i < ds_list_size(instance_list); i++)
        instance_activate_object(ds_list_find_value(instance_list, i))
    if argument0
    {
        for (i = 0; i < ds_list_size(sound_list); i++)
            fmod_event_instance_set_paused(ds_list_find_value(sound_list, i), 0)
        sound_pause_all(0, (global.jukebox == noone ? -1 : global.jukebox.instance))
        fmod_set_parameter("musicmuffle", savedmusicmuffle, 1)
    }
    ds_list_clear(instance_list)
    ds_list_clear(sound_list)
    fadein = 0
    pause = 0
    alarm[2] = 1
}

function scr_pause_deactivate_objects(argument0) //gml_Script_scr_pause_deactivate_objects
{
    if (argument0 == undefined)
        argument0 = 1
    if argument0
    {
        savedmusicmuffle = fmod_get_parameter("musicmuffle")
        sound_pause_all(1, (global.jukebox == noone ? -1 : global.jukebox.instance))
        if (global.jukebox != -4)
            fmod_set_parameter("musicmuffle", 1, 1)
    }
    ds_list_clear(instance_list)
    for (i = 0; i < instance_count; i++)
    {
        var obj = instance_find(all, i)
        if (instance_exists(obj) && obj.object_index != obj_pause && obj.object_index != obj_inputAssigner && obj.object_index != obj_screensizer)
            ds_list_add(instance_list, obj)
    }
    instance_deactivate_all_hook(1)
    instance_activate_object(obj_fmod)
    instance_activate_object(obj_inputAssigner)
    instance_activate_object(obj_savesystem)
    instance_activate_object(obj_pause)
    instance_activate_object(obj_screensizer)
    instance_activate_object(obj_music)
    instance_activate_object(obj_persistent)
    instance_activate_object(obj_shell)
    instance_activate_object(obj_richpresence)
    instance_activate_object(obj_inputdisplay)
    instance_activate_object(obj_gmlive)
    instance_activate_object(obj_globaltimer)
    instance_activate_object(obj_onlineclient)
}

function pause_spawn_priests() //gml_Script_pause_spawn_priests
{
    var p = 
    {
        x: 0,
        y: (obj_screensizer.actual_height + 200),
        speed: random_range(0.8, 1.4),
        image_index: 0,
        image_speed: 0.35,
        image_xscale: choose(-1, 1),
        image_alpha: 0,
        sprite_index: choose(spr_angelpriest, spr_angelpriest2, spr_angelpriest3)
    }

    if is_holiday((1 << 0))
        p.sprite_index = choose(spr_pepbat_move, spr_ghostshroom, spr_ghoul_idle)
    var q = irandom(100)
    if (q >= 50)
        p.x = irandom_range((obj_screensizer.actual_width * 0.78), (obj_screensizer.actual_width * 0.65))
    else
        p.x = irandom_range((obj_screensizer.actual_width * 0.2), 0.42)
    ds_list_add(priest_list, p)
}

function pause_unpause_music() //gml_Script_pause_unpause_music
{
    with (obj_music)
    {
        if (music != noone)
        {
            fmod_event_instance_set_paused(music.event, other.savedmusicpause)
            fmod_event_instance_set_paused(music.event_secret, other.savedsecretpause)
        }
        fmod_event_instance_set_paused(pillarmusicID, other.savedpillarpause)
        fmod_event_instance_set_paused(panicmusicID, other.savedpanicpause)
        fmod_event_instance_set_paused(kidspartychaseID, other.savedkidspartypause)
        for (i = 0; i < array_length(custom_music); i++)
        {
            if custom_music[i].fmod
                fmod_event_instance_set_paused(custom_music[i].instance, custom_music[i].paused)
        }
    }
    fmod_event_instance_stop(obj_pause.pausemusicID, 1)
}

function pause_update_priests() //gml_Script_pause_update_priests
{
    for (i = 0; i < ds_list_size(priest_list); i++)
    {
        var b = ds_list_find_value(priest_list, i)
        var destroy = 0
        with (b)
        {
            y -= speed
            image_index += image_speed
            if (!other.pause)
                x += (x > (obj_screensizer.actual_width / 2) ? 10 : -10)
            if (y < -200)
                destroy = 1
            var a = 0.02
            if (y > 250)
            {
                if (y < (obj_screensizer.actual_height - 100))
                    image_alpha += a
            }
            else
                image_alpha -= a
        }
        if destroy
        {
            b = undefined
            ds_list_delete(priest_list, i--)
        }
    }
}

function pause_draw_priests() //gml_Script_pause_draw_priests
{
    for (i = 0; i < ds_list_size(priest_list); i++)
    {
        b = ds_list_find_value(priest_list, i)
        with (b)
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_white, image_alpha)
    }
}

