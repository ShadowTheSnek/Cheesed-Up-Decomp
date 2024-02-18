function scr_cameradraw_old() //gml_Script_scr_cameradraw_old
{
    var player = obj_player1
    if instance_exists(player)
    {
        var _state = player.state
        if (_state == (84 << 0))
        {
            with (obj_teleporter)
            {
                if (alarm[0] > -1 || alarm[1] > -1)
                    _state = storedstate
            }
            with (obj_warplaser)
            {
                if (alarm[0] > -1 || alarm[1] > -1)
                    _state = storedstate
            }
        }
        if (_state == (61 << 0) || _state == (296 << 0))
            _state = player.tauntstoredstate
        var hudface = -1
        switch player.character
        {
            case "P":
                if (player.sprite_index == spr_knightpep_thunder)
                    hudface = spr_pepinoHUDthunder
                else if (player.sprite_index != spr_knightpep_start && (_state == (47 << 0) || _state == (38 << 0)))
                    hudface = spr_pepinoHUDknight
                else if (player.sprite_index == spr_bombpep_end)
                    hudface = spr_pepinoHUDbombend
                else if (instance_exists(obj_itspizzatime) || player.sprite_index == spr_bombpep_intro || player.sprite_index == spr_bombpep_runabouttoexplode || player.sprite_index == spr_bombpep_run || player.sprite_index == spr_player_fireass || player.state == states.bombgrab)
                    hudface = spr_pepinoHUDscream
                else if (_state == (123 << 0) || (_state == (111 << 0) && shake_mag > 0))
                    hudface = spr_pepinoHUDstun
                else if (player.sprite_index == spr_player_victory || _state == (90 << 0) || _state == (96 << 0) || _state == (46 << 0) || (_state == (88 << 0) && player.sprite_index == spr_player_levelcomplete))
                    hudface = spr_pepinoHUDhappy
                else if (player.sprite_index == spr_player_machroll || player.sprite_index == spr_player_tumble)
                    hudface = spr_pepinoHUDrolling
                else if ((player.supercharged && (!global.heatmeter)) || global.stylethreshold == 2)
                    hudface = spr_pepinoHUDmenacing
                else if (_state == (103 << 0) || _state == (61 << 0) || _state == (122 << 0) || _state == (108 << 0) || _state == (91 << 0) || _state == (97 << 0) || _state == (75 << 0) || _state == (99 << 0) || _state == (79 << 0) || _state == (80 << 0) || _state == (84 << 0) || _state == (81 << 0) || _state == (82 << 0) || _state == (83 << 0) || player.sprite_index == spr_player_mach1)
                    hudface = spr_pepinoHUDmach1
                else if (_state == (104 << 0) || player.sprite_index == spr_player_dive || player.sprite_index == spr_player_machslideboost || _state == (37 << 0) || _state == (42 << 0) || _state == (76 << 0))
                    hudface = spr_pepinoHUDmach2
                else if (_state == (121 << 0) && player.sprite_index == spr_player_crazyrun)
                    hudface = spr_pepinoHUDmach4
                else if (_state == (121 << 0) || player.sprite_index == spr_player_machslideboost3)
                    hudface = spr_pepinoHUDmach3
                else if (_state == (107 << 0) || player.sprite_index == spr_bombpep_end || player.sprite_index == spr_player_fireassend || _state == (64 << 0) || _state == (51 << 0) || (_state == (88 << 0) && player.sprite_index == spr_player_bossintro) || (_state == (88 << 0) && player.sprite_index == spr_player_idle))
                    hudface = spr_pepinoHUDhurt
                else if (player.angry || global.stylethreshold == 1)
                    hudface = spr_pepinoHUD3hp
                else if (player.sprite_index == spr_player_hurtidle || player.sprite_index == spr_player_hurtwalk)
                    hudface = spr_pepinoHUD1hp
                else if (global.panic || global.snickchallenge || global.miniboss || global.stylethreshold >= 3)
                    hudface = spr_pepinoHUDpanic
                else if (player.sprite_index == spr_shotgun_pullout)
                    hudface = spr_pepinoHUDmenacing
                else
                    hudface = spr_pepinoHUD
                break
            case "N":
                if (player.sprite_index == player.spr_knightpepthunder)
                    hudface = spr_noiseHUD_thunder
                else if (player.sprite_index != player.spr_knightpepstart && (_state == (47 << 0) || _state == (38 << 0)))
                    hudface = spr_noiseHUD_knight
                else if (player.sprite_index == player.spr_bombpepend)
                    hudface = spr_noiseHUD_bomb
                else if (instance_exists(obj_itspizzatime) || player.sprite_index == player.spr_bombpepintro || player.sprite_index == player.spr_bombpeprunabouttoexplode || player.sprite_index == player.spr_bombpeprun || player.sprite_index == player.spr_fireass)
                    hudface = spr_noiseHUD_panic
                else if (_state == (123 << 0) || (_state == (111 << 0) && shake_mag > 0))
                    hudface = spr_noiseHUD_groundpound
                else if (player.sprite_index == player.spr_victory || _state == (90 << 0) || _state == (96 << 0) || _state == (46 << 0) || (_state == (88 << 0) && player.sprite_index == player.spr_player_levelcomplete))
                    hudface = spr_noiseHUD_happy
                else if player.supercharged
                    hudface = spr_noiseHUD_menacing
                else if (_state == (103 << 0) || _state == (61 << 0) || _state == (122 << 0) || _state == (108 << 0) || _state == (91 << 0) || _state == (97 << 0) || _state == (75 << 0) || _state == (99 << 0) || _state == (79 << 0) || _state == (80 << 0) || _state == (84 << 0) || _state == (81 << 0) || _state == (82 << 0) || _state == (83 << 0))
                    hudface = spr_noiseHUD_mach1
                else if (_state == (58 << 0) || _state == (104 << 0) || player.sprite_index == player.spr_dive || player.sprite_index == player.spr_machslideboost || _state == (37 << 0) || _state == (42 << 0) || _state == (76 << 0))
                    hudface = spr_noiseHUD_mach2
                else if (_state == (121 << 0) && player.sprite_index == player.spr_crazyrun)
                    hudface = spr_noiseHUD_crazyrun
                else if (_state == (121 << 0) || player.sprite_index == player.spr_mach3boost)
                    hudface = spr_noiseHUD_mach3
                else if (_state == (107 << 0) || player.sprite_index == player.spr_bombpepend || player.sprite_index == player.spr_fireassend || _state == (64 << 0) || _state == (51 << 0) || (_state == (88 << 0) && player.sprite_index == player.spr_player_bossintro) || (_state == (88 << 0) && player.sprite_index == player.spr_idle))
                    hudface = spr_noiseHUD_hurt
                else if player.angry
                    hudface = spr_noiseHUD_angry
                else if (player.sprite_index == player.spr_hurtidle || player.sprite_index == player.spr_hurtwalk)
                    hudface = spr_noiseHUD_lowhealth
                else if (global.panic || global.snickchallenge || global.miniboss)
                    hudface = spr_noiseHUD_panic
                else if (player.sprite_index == player.spr_shotgunpullout)
                    hudface = spr_noiseHUD_menacing
                else
                    hudface = spr_noiseHUD_idle
                break
            case "V":
                if ((healthshaketime > 0 && playerhealthup) || player.sprite_index == spr_playerV_keydoor || _state == (90 << 0) || _state == (46 << 0))
                    hudface = spr_playerV_happyHUD
                else if (_state == (103 << 0) || _state == (104 << 0) || _state == (121 << 0) || _state == (105 << 0) || _state == (65 << 0))
                    hudface = spr_playerV_machHUD
                else if ((healthshaketime > 0 && (!playerhealthup)) || _state == (107 << 0))
                    hudface = spr_playerV_hurtHUD
                else if (global.panic == 1)
                    hudface = spr_playerV_panicHUD
                else if player.angry
                    hudface = spr_playerV_angryHUD
                else
                    hudface = spr_playerV_normalHUD
                break
            case "S":
                hudface = spr_snickHUD
                break
            case "SP":
                if (player.sprite_index == player.spr_knightpepthunder)
                    hudface = spr_pizzyHUDthunder
                else if (player.sprite_index != player.spr_knightpepstart && (_state == (47 << 0) || _state == (38 << 0) || _state == (48 << 0)))
                    hudface = spr_pizzyHUDknight
                else if (player.sprite_index == player.spr_bombpepend)
                    hudface = spr_pizzyHUDbombend
                else if (instance_exists(obj_itspizzatime) || player.sprite_index == player.spr_bombpepintro || player.sprite_index == player.spr_bombpeprunabouttoexplode || player.sprite_index == player.spr_bombpeprun || player.sprite_index == player.spr_fireass)
                    hudface = spr_pizzyHUD_panic
                else if (_state == (123 << 0) || (_state == (111 << 0) && shake_mag > 0))
                    hudface = spr_pizzyHUDstun
                else if (player.sprite_index == player.spr_victory || _state == (90 << 0) || _state == (96 << 0) || _state == (46 << 0) || (_state == (88 << 0) && player.sprite_index == spr_player_levelcomplete))
                    hudface = spr_pizzyHUDhappy
                else if (_state == (103 << 0) || _state == (91 << 0) || _state == (75 << 0) || _state == (79 << 0) || _state == (80 << 0) || _state == (81 << 0) || _state == (82 << 0) || _state == (83 << 0))
                    hudface = spr_pizzyHUDmach1
                else if (_state == (104 << 0) || _state == (65 << 0) || player.sprite_index == player.spr_machslideboost || _state == (37 << 0) || _state == (42 << 0) || _state == (76 << 0) || _state == (122 << 0))
                    hudface = spr_pizzyHUDmach2
                else if (_state == (121 << 0) && player.sprite_index == player.spr_crazyrun)
                    hudface = spr_pizzyHUDmach4
                else if (_state == (121 << 0) || player.sprite_index == player.spr_mach3boost)
                    hudface = spr_pizzyHUDmach3
                else if (_state == (107 << 0) || player.sprite_index == player.spr_fireassend || _state == (64 << 0) || _state == (51 << 0) || (_state == (88 << 0) && player.sprite_index == player.spr_bossintro) || (_state == (88 << 0) && player.sprite_index == player.spr_idle))
                    hudface = spr_pizzyHUDhurt
                else if (player.sprite_index == player.spr_bombpepend)
                    hudface = spr_pizzyHUDbombend
                else if (_state == (99 << 0))
                    hudface = spr_pizzyHUDsuperjumpprep
                else if (_state == (97 << 0))
                    hudface = spr_pizzyHUDsuperjump
                else if (_state == (108 << 0))
                    hudface = spr_pizzyHUDbodyslam
                else if (player.sprite_index == player.spr_bombpepend)
                    hudface = spr_pizzyHUDbombend
                else if (_state == (106 << 0))
                    hudface = spr_pizzyHUDbump
                else if player.angry
                    hudface = spr_pizzyHUD3hp
                else if (player.sprite_index == player.spr_hurtidle)
                    hudface = spr_pizzyHUDhurt
                else if (global.panic || global.snickchallenge || global.miniboss)
                    hudface = spr_pizzyHUD
                else if (player.sprite_index == player.spr_shotgunpullout)
                    hudface = spr_pizzyHUDmenacing
                else if (_state == (304 << 0))
                    hudface = spr_pizzyHUDcotton
                else
                    hudface = spr_pizzyHUD
                break
        }

        if (_state == (304 << 0) || _state == (306 << 0) || _state == (305 << 0))
            hudface = spr_pizzyHUDcotton
        var xx = 125
        if (player.character == "SP")
            xx -= 20
        if sprite_exists(hudface)
        {
            shader_set_fix(shd_pal_swapper)
            pal_swap_player_palette(hudface, -1, 1, 1, player, 0)
            draw_sprite_ext(hudface, -1, xx, (global.heatmeter ? 125 : 100), 1, 1, 0, c_white, alpha)
            pal_swap_reset()
            var sprspd = sprite_get_speed(hudface)
            if (sprspd != 1)
                image_speed = sprspd
            else
                image_speed = 0.35
        }
        scr_rankbubbledraw(40, 40)
        if global.heatmeter
        {
            with (obj_stylebar)
            {
                depth = (other.depth - 1)
                draw_sprite(sprite, index, 230, 75)
            }
        }
        if (!((player.character == "N" && player.noisetype == 1)))
        {
            var yy = 140
            if (player.character == "SP" || player.character == "S")
                yy = 164
            if global.heatmeter
                yy += 25
            var speedbaractive = (_state == (103 << 0) || _state == (104 << 0) || _state == (121 << 0) || _state == (37 << 0) || _state == (105 << 0) || _state == (65 << 0) || _state == (42 << 0) || (player.character == "S" && state == states.normal))
            var frame = 0
            var movespeed = abs(player.movespeed)
            if (movespeed < 2.4 || (!speedbaractive))
                frame = 0
            else if speedbaractive
            {
                if (movespeed >= 2.4 && movespeed < 4.8)
                    frame = 1
                else if (movespeed >= 4.8 && movespeed < 7.2)
                    frame = 2
                else if (movespeed >= 7.2 && movespeed < 9.6)
                    frame = 3
                else if (movespeed >= 9.6 && movespeed < 12)
                    frame = 4
                else if (movespeed >= 12)
                {
                    frame = -1
                    draw_sprite_ext(spr_speedbarmax, -1, xx, yy, 1, 1, 0, c_white, alpha)
                }
            }
            if (frame >= 0)
                draw_sprite_ext(spr_speedbar, frame, xx, yy, 1, 1, 0, c_white, alpha)
        }
        if (player.character == "N" && player.noisetype == 1)
        {
            with (other)
            {
                if (player.pogospeed < 10)
                    draw_sprite_ext(spr_speedbar, 0, xx, 140, 1, 1, 0, c_white, alpha)
                else if (player.pogospeed >= 10 && player.pogospeed < 14)
                    draw_sprite_ext(spr_speedbar, 3, xx, 140, 1, 1, 0, c_white, alpha)
                else if (player.pogospeed >= 14)
                    draw_sprite_ext(spr_speedbarmax, -1, xx, 140, 1, 1, 0, c_white, alpha)
            }
        }
        if ((player.y < (camera_get_view_y(view_camera[0]) + 200) && player.x < (camera_get_view_x(view_camera[0]) + 200)) || obj_tv.manualhide)
            alpha = 0.5
        else
            alpha = 1
        draw_set_font(gml_Script_lang_get_font("bigfont"))
        draw_set_halign(fa_center)
        draw_set_color(c_white)
        if (obj_player1.character == "V")
            draw_text((200 + healthshake), (125 + healthshake), global.playerhealth)
    }
}

