if (instance_exists(obj_pizzafaceboss_p3intro) || instance_exists(obj_blackoutline))
    return;
if (image_alpha <= 0)
    return;
gml_Script_toggle_alphafix(1)
switch state
{
    case states.arenaintro:
        if (arenastate < states.boots)
        {
            draw_set_alpha(1)
            draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_white, c_white, c_white, c_white, 0)
            draw_sprite_ext(playerspr, -1, playerx, obj_screensizer.actual_height, 1, 1, 0, c_black, 1)
            draw_sprite_ext(bossspr, -1, bossx, obj_screensizer.actual_height, 1, 1, 0, c_black, 1)
            draw_set_alpha(whitefade)
            draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_white, c_white, c_white, c_white, 0)
            draw_set_alpha(1)
        }
        else
        {
            draw_sprite_tiled(spr_versusflame, -1, 0, flamey)
            var c_player = c_white
            var sx = irandom_range((-introshake), introshake)
            var sy = irandom_range((-introshake), introshake)
            var _index = 0
            var _xs = 1
            var _ys = 1
            if (bossspr == spr_vspizzaface)
            {
                if (glitchbuffer > 0)
                {
                    glitchalpha = 1
                    glitchbuffer--
                }
                else if (glitchalpha > 0)
                {
                    glitchalpha -= 0.1
                    _index = 1
                }
                else
                    glitchbuffer = 120
            }
            var px = min((playerx + sx), 0)
            var py = max((obj_screensizer.actual_height + sy), obj_screensizer.actual_height)
            var bx = max((bossx + sy), obj_screensizer.actual_width)
            var by = max((obj_screensizer.actual_height + sy), obj_screensizer.actual_height)
            pal_swap_player_palette(playerspr, 0, 1, 1)
            draw_sprite_ext(playerspr, -1, px, py, 1, 1, 0, c_player, 1)
            cuspal_reset()
            if (bossspr == spr_vsfakepep || bossspr == spr_vsfakepep2)
            {
                pattern_set(global.Base_Pattern_Color, bossspr, 0, _xs, _ys, global.palettetexture)
                pal_swap_set(spr_peppalette, gustavo_palette(obj_player1.paletteselect), 0)
            }
            else
            {
                pattern_reset()
                pal_swap_set(spr_peppalette, 0, 0)
            }
            draw_sprite_ext(bossspr, 0, bx, by, _xs, _ys, 0, c_player, 1)
            pal_swap_reset()
            if (_index == 1)
                draw_sprite_ext(bossspr, _index, bx, by, _xs, _ys, 0, c_player, glitchalpha)
            var xx = (irandom_range(-1, 1) + sx)
            var yy = (irandom_range(-1, 1) + sy)
            draw_sprite(vstitle, -1, xx, yy)
            draw_sprite(vstitleplayer, -1, xx, yy)
        }
        break
    case (0 << 0):
    case (98 << 0):
        if (!global.option_hud)
            break
        else
        {
            shader_set_fix(shd_pal_swapper)
            scr_bosscontroller_draw_health(spr_playerhp, player_rowmax, player_columnmax, player_hp, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad, player_index, image_alpha, obj_player1.spr_palette, obj_player1.paletteselect, global.palettetexture)
            var bpal = boss_palette
            var bpalsel = -4
            var btex = -4
            if (boss_hpsprite == spr_bossfight_fakepephp)
            {
                bpal = spr_peppalette
                bpalsel = obj_player1.paletteselect
                btex = global.palettetexture
            }
            if (boss_hpsprite == spr_bossfight_noiseHP)
            {
                bpal = spr_noisepalette
                bpalsel = 0
                if (obj_player1.paletteselect != 20 && obj_player1.character == "N")
                    bpalsel = 20
            }
            if (boss_hpsprite == spr_bossfight_vigiHP)
            {
                bpal = spr_vigipalette
                bpalsel = 0
                if (obj_player1.paletteselect != 17 && obj_player1.character == "V")
                    bpalsel = 17
            }
            scr_bosscontroller_draw_health(boss_hpsprite, boss_rowmax, boss_columnmax, boss_prevhp, boss_maxhp, boss_hp_x, boss_hp_y, boss_xpad, boss_ypad, boss_index, image_alpha, bpal, bpalsel, btex)
            for (var i = 0; i < ds_list_size(particlelist); i++)
            {
                var b = ds_list_find_value(particlelist, i)
                with (b)
                {
                    if (type == 0)
                    {
                        x += hsp
                        y += vsp
                        if (vsp < 20)
                            vsp += 0.5
                        if (y > (obj_screensizer.actual_height + sprite_get_height(sprite_index)))
                            ds_list_delete(other.particlelist, i--)
                        else
                        {
                            if (palettetexture != -4)
                                pattern_set(global.Base_Pattern_Color, sprite_index, image_index, 1, 1, palettetexture)
                            pal_swap_set(spr_palette, paletteselect, 0)
                            draw_sprite(sprite_index, image_index, x, y)
                        }
                    }
                    else if (type == 1)
                    {
                        if (image_index > (sprite_get_number(sprite_index) - 1))
                            ds_list_delete(other.particlelist, i--)
                        else
                        {
                            image_index += image_speed
                            pal_swap_set(spr_palette, paletteselect, 0)
                            draw_sprite(sprite_index, image_index, x, y)
                        }
                    }
                }
            }
            pattern_reset()
            break
        }
}

gml_Script_toggle_alphafix(0)
