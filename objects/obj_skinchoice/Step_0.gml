if (!init)
    return;
event_inherited()
if (submenu == 0)
{
    if (anim_con != 2)
    {
        switch sel.side
        {
            case 0:
                handx = lerp(handx, ((obj_screensizer.actual_width / 2) - 50), 0.25)
                handy = lerp(handy, -200, 0.1)
                if (move_hor != 0)
                {
                    if (move_hor == -1 && (!global.experimental))
                    {
                        sideoffset = 10
                        fmod_event_instance_set_parameter(global.snd_golfjingle, "state", 0, 1)
                        fmod_event_instance_play(global.snd_golfjingle)
                        return;
                    }
                    sel.side = (move_hor == 1 ? 1 : 2)
                    if (sel.side == 2)
                        sel.pal = 0
                    trace(sel)
                    sound_play("event:/sfx/ui/angelmove")
                    flashpal[0] = sel.pal
                    flashpal[1] = 4
                }
                if (move_ver != 0)
                {
                    var prevpal = sel.char
                    sel.char = clamp((sel.char + move_ver), 0, (array_length(characters) - 1))
                    if (sel.char != prevpal)
                    {
                        skin_tip = 0
                        charshift[1] = move_ver
                        charshift[2] = 0
                        mixing = 0
                        sel.mix = 0
                        sound_play("event:/sfx/ui/angelmove")
                        event_user(0)
                    }
                }
                break
            case 1:
                if (move_hor == -1 && (sel.pal % 13) == 0 && (!mixing))
                {
                    sel.side = 0
                    event_user(0)
                    sound_play("event:/sfx/ui/angelmove")
                }
                else if (!mixing)
                {
                    prevpal = sel.pal
                    if (((sel.pal % 13) != 12 || move_hor == -1) && (sel.pal + move_hor) < array_length(palettes))
                        sel.pal += move_hor
                    if ((sel.pal + (move_ver * 13)) >= 0 && (sel.pal + (move_ver * 13)) < array_length(palettes))
                        sel.pal += (move_ver * 13)
                    if (sel.pal != prevpal)
                    {
                        charshift[0] = -0.75
                        charshift[2] = 0
                        sound_play("event:/sfx/ui/angelmove")
                        flashpal[0] = sel.pal
                        flashpal[1] = 4
                    }
                    if (palettes[sel.pal].texture == -4 || palettes[sel.pal].palette != 12)
                    {
                        sel.mix = 0
                        mixing = 0
                    }
                }
                else
                {
                    prevpal = sel.mix
                    if (((sel.mix % 13) != 12 || move_hor == -1) && (sel.mix + move_hor) < array_length(mixables) && (sel.mix + move_hor) >= 0)
                        sel.mix += move_hor
                    if ((sel.mix + (move_ver * 13)) >= 0 && (sel.mix + (move_ver * 13)) < array_length(mixables))
                        sel.mix += (move_ver * 13)
                    if (sel.mix != prevpal)
                    {
                        charshift[0] = -0.75
                        charshift[2] = 0
                        sound_play("event:/sfx/ui/angelmove")
                        flashpal[0] = sel.mix
                        flashpal[1] = 4
                    }
                }
                break
            case 2:
                if (move_hor == 1 && ((sel.pal % 13) == 12 || (sel.pal + 1) > array_length(custom_palettes)))
                {
                    sel.side = 0
                    event_user(0)
                    sound_play("event:/sfx/ui/angelmove")
                }
                else
                {
                    prevpal = sel.pal
                    if (((sel.pal % 13) != 0 || move_hor == 1) && (sel.pal + move_hor) < (array_length(custom_palettes) + 1))
                        sel.pal += move_hor
                    if ((sel.pal + (move_ver * 13)) >= 0 && (sel.pal + (move_ver * 13)) < (array_length(custom_palettes) + 1))
                        sel.pal += (move_ver * 13)
                    if (sel.pal != prevpal)
                    {
                        charshift[0] = 0.75
                        charshift[2] = 0
                        sound_play("event:/sfx/ui/angelmove")
                        flashpal[0] = sel.pal
                        flashpal[1] = 4
                    }
                    if key_jump
                    {
                        submenu = 1
                        sel.pal = 0
                        var color_count = 0
                        if (array_length(characters[sel.char]) >= 5)
                            color_count = characters[sel.char][4]
                        if (color_count == 0)
                            color_count = sprite_get_height(characters[sel.char][2])
                        for (var i = 0; i < color_count; i++)
                        {
                            var col = pal_swap_get_pal_color(characters[sel.char][2], 0, i)
                            var r = colour_get_red(col)
                            var g = colour_get_green(col)
                            var b = colour_get_blue(col)
                            custom_palette[(i * 4)] = (r / 255)
                            custom_palette[((i * 4) + 1)] = (g / 255)
                            custom_palette[((i * 4) + 2)] = (b / 255)
                            custom_palette[((i * 4) + 3)] = 1
                        }
                    }
                }
                break
        }

    }
    if (flashpal[1] > 0)
        flashpal[1]--
    else
        flashpal[0] = -1
    mixing = 0
    if (array_length(mixables) > 1 && sel.side == 1 && palettes[sel.pal].texture != -4)
    {
        create_transformation_tip(gml_Script_lang_get_value_newline("mixingtip"), "palettemixing")
        mixing = key_attack
    }
    mixingfade = Approach(mixingfade, mixing, 0.3)
    charshift[0] = lerp(charshift[0], 0, 0.25)
    charshift[1] = lerp(charshift[1], 0, 0.25)
    charshift[2] = lerp(charshift[2], 1, 0.25)
    if (characters[sel.char][0] == "N")
    {
        if check_char("N")
            create_transformation_tip(gml_Script_lang_get_value_newline("noisetypetip"), "noisetype")
        if key_taunt2
        {
            sound_play("event:/sfx/ui/step")
            noisetype = (!noisetype)
        }
    }
}
else if (submenu == 1 && anim_con != 2)
{
    mixingfade = 0
    if (move_ver != 0)
    {
        color_count = 0
        if (array_length(characters[sel.char]) >= 5)
            color_count = characters[sel.char][4]
        if (color_count == 0)
            color_count = sprite_get_height(characters[sel.char][2])
        var prev = sel.pal
        sel.pal = clamp((sel.pal + move_ver), 0, (color_count - 1))
        if (sel.pal != prev)
        {
        }
    }
    if (key_back && anim_con == 0)
    {
        close_menu()
        sound_play("event:/sfx/ui/back")
        anim_con = 1
    }
}
