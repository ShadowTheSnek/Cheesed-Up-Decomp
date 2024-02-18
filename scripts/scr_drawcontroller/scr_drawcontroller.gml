function get_dark(argument0, argument1, argument2, argument3, argument4) //gml_Script_get_dark
{
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    if argument1
    {
        if (room == boss_vigilante)
            argument0 = make_color_rgb(247, 109, 22)
        if global.SUGARY
            return 7490854;
        var d = (room_width * room_height)
        var b = d
        var bb = b
        with (obj_lightsource)
        {
            if (object_index != obj_lightsource_attach || instance_exists(objectID))
            {
                if (!argument2)
                    var dis = distance_to_object(other)
                else
                    dis = distance_between_points(x, y, argument3, argument4)
                if (dis < d)
                {
                    bb = (dis / distance)
                    if (bb < b)
                    {
                        b = bb
                        d = dis
                    }
                }
            }
        }
        var t = clamp(((b + 0.4) * 255), 0, 255)
        var a = clamp((((1 - obj_drawcontroller.dark_alpha) * 255) - 102), 0, 255)
        var r = max(((color_get_red(argument0) - t) + a), 0)
        var g = max(((color_get_green(argument0) - t) + a), 0)
        b = max(((color_get_blue(argument0) - t) + a), 0)
        return make_color_rgb(r, g, b);
    }
    else
        return image_blend;
}

function enemy_is_superslam(argument0) //gml_Script_enemy_is_superslam
{
    with (argument0)
    {
        if (state == states.grabbed)
        {
            g = (grabbedby == 1 ? obj_player1.id : obj_player2.id)
            if (g.state == states.superslam || (g.state == states.chainsaw && g.tauntstoredstate == states.superslam))
                return 1;
        }
    }
    return 0;
}

function enemy_is_swingding(argument0) //gml_Script_enemy_is_swingding
{
    with (argument0)
    {
        if (state == states.grabbed)
        {
            g = (grabbedby == 1 ? obj_player1.id : obj_player2.id)
            if ((g.state == states.grab || (g.state == states.chainsaw && g.tauntstoredstate == states.grab)) && g.sprite_index == g.spr_swingding)
                return 1;
        }
    }
    return 0;
}

function draw_enemy(argument0, argument1, argument2) //gml_Script_draw_enemy
{
    if (argument2 == undefined)
        argument2 = 16777215
    var _stun = 0
    if ((state == states.stun && thrown == 0 && object_index != obj_peppinoclone) || state == states.pizzaheadjump || (state == states.supergrab && sprite_index == stunfallspr))
        _stun = 25
    if ((state == states.pizzaheadjump && object_index == obj_gustavograbbable) || object_index == obj_junkNEW)
        _stun = 0
    if (visible && object_index != obj_pizzaball && object_index != obj_fakesanta && bbox_in_camera(view_camera[0], 32))
    {
        var c = image_blend
        if elite
            c = 65535
        if elitegrab
            c = 32768
        if (argument2 != 16777215)
            c = argument2
        var _ys = 1
        if (state == states.grabbed)
        {
            if enemy_is_superslam(id)
            {
                _stun += 18
                _ys = -1
            }
        }
        b = get_dark(c, obj_drawcontroller.use_dark)
        var xx = x
        var yy = y
        if safe_get(id, "sugary")
        {
            var player = instance_nearest(x, y, obj_player)
            if (player.state == states.backbreaker && point_in_rectangle(x, y, (player.x - 480), (player.y - 270), (player.x + 480), (player.y + 270)))
            {
                xx += irandom_range(-1, 1)
                yy += irandom_range(-1, 1)
                draw_sprite_ext(spr_angrycloud, (++aggrimg * 0.35), xx, (yy + _stun), 1, 1, 0, b, image_alpha)
            }
        }
        if (obj_drawcontroller.use_dark && global.SUGARY)
        {
            draw_set_flash(b)
            draw_sprite_ext(sprite_index, image_index, xx, (yy + _stun), (xscale * image_xscale), (yscale * _ys), angle, b, image_alpha)
            draw_reset_flash()
        }
        else
        {
            pattern_reset()
            if (object_index == obj_peppinoclone)
                pal_swap_set(spr_peppalette, 1, 0)
            else if (usepalette && argument1)
            {
                if (object_index == obj_fakepepboss || object_index == obj_gustavograbbable)
                    pal_swap_player_palette(sprite_index, image_index, (image_xscale * xscale), (image_yscale * yscale))
                pal_swap_set(spr_palette, paletteselect, 0)
            }
            draw_sprite_ext(sprite_index, image_index, xx, (yy + _stun), (xscale * image_xscale), (yscale * _ys), angle, b, image_alpha)
            cuspal_reset()
        }
        if argument0
        {
            if (hp > maxhp)
                maxhp = hp
            draw_healthbar((x - 16), (y - 50), (x + 16), (y - 45), ((hp / maxhp) * 100), c_black, c_red, c_red, 0, 1, 1)
        }
        if (object_index == obj_fakepepboss)
        {
            if miniflash
            {
                pal_swap_set(spr_peppalette, 14, 0)
                draw_sprite_ext(sprite_index, image_index, x, (y + _stun), (xscale * image_xscale), (yscale * _ys), angle, b, image_alpha)
            }
        }
        if (object_index == obj_peppinoclone)
        {
            pattern_reset()
            if (elite || global.stylethreshold >= 3)
            {
                pal_swap_set(spr_peppalette, 2, 0)
                draw_sprite_ext(sprite_index, image_index, xx, (yy + _stun), (xscale * image_xscale), (yscale * _ys), angle, b, image_alpha)
            }
            pal_swap_reset()
        }
        else if (usepalette && argument1)
        {
            pattern_reset()
            pal_swap_reset()
        }
        if (object_index == obj_hamkuff)
        {
            if (state == states.blockstance && instance_exists(playerid))
            {
                var x1 = (x + (6 * image_xscale))
                var y1 = (y + 29)
                if (sprite_index == spr_hamkuff_chain2)
                {
                    x1 = (x + (15 * image_xscale))
                    y1 = (y + 33)
                }
                dis = point_distance(x1, y1, playerid.x, playerid.y)
                var w = 24
                var len = (dis div w)
                var dir = point_direction(x1, y1, playerid.x, (playerid.y + 16))
                xx = lengthdir_x(w, dir)
                yy = lengthdir_y(w, dir)
                for (var i = 0; i < len; i++)
                    draw_sprite_ext(spr_hamkuff_sausage, -1, (x1 + (xx * i)), (y1 + (yy * i)), 1, 1, dir, b, 1)
            }
        }
    }
}

function draw_superslam_enemy() //gml_Script_draw_superslam_enemy
{
    if (state == states.superslam && floor(image_index) >= 5 && floor(image_index) <= 7 && instance_exists(baddiegrabbedID))
    {
        with (baddiegrabbedID)
            draw_enemy(global.kungfu, true)
    }
}

function draw_player() //gml_Script_draw_player
{
    xx = (x + smoothx)
    yy = y
    if ((state == states.frothstuck || state == states.frozen) && shaketime > 0)
        xx += random_range((shaketime / 6), ((-shaketime) / 6))
    b = get_dark(image_blend, obj_drawcontroller.use_dark)
    if (obj_drawcontroller.use_dark && global.SUGARY)
        draw_set_flash(b)
    else
    {
        pattern_set(global.Base_Pattern_Color, sprite_index, image_index, (xscale * scale_xs), (yscale * scale_ys), global.palettetexture)
        var ps = paletteselect
        var spr = spr_palette
        if (isgustavo && spr != spr_peppalette)
        {
            spr = spr_peppalette
            ps = gustavo_palette(ps)
        }
        else if custom_palette
            cuspal_set(custom_palette_array)
        pal_swap_set(spr, (ps % sprite_get_width(spr)), 0)
    }
    spr = player_sprite()
    draw_sprite_ext(spr, image_index, xx, yy, (xscale * scale_xs), (yscale * scale_ys), angle, b, image_alpha)
    cuspal_reset()
    if global.noisejetpack
    {
        pal_swap_set(spr_peppalette, 2, 0)
        draw_sprite_ext(spr, image_index, xx, yy, (xscale * scale_xs), (yscale * scale_ys), angle, b, image_alpha)
    }
    draw_superslam_enemy()
    if global.pistol
    {
        pal_swap_set(spr_peppalette, 0, 0)
        if (pistolcharge >= 4)
            draw_sprite(spr_revolvercharge, pistolcharge, xx, (yy - 70))
    }
    pattern_reset()
    draw_reset_flash()
    if global.showcollisions
    {
        draw_set_alpha(1)
        draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_white, c_white, c_white, c_white, 1)
    }
}

