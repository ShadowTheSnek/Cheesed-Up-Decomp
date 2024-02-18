function tv_set_idle() //gml_Script_tv_set_idle
{
    with (obj_tv)
    {
        state = states.normal
        sprite_index = spr_tv_idle
        if (global.hud == 1)
        {
            sprite_index = -1
            tvsprite = spr_tvdefault
        }
    }
}

function tv_reset() //gml_Script_tv_reset
{
    with (obj_tv)
    {
        state = states.normal
        sprite_index = spr_tv_idle
        ds_list_clear(tvprompts_list)
        if (global.hud == 1)
        {
            sprite_index = -1
            tvsprite = spr_tvdefault
        }
    }
}

function tv_create_prompt(argument0, argument1, argument2, argument3) //gml_Script_tv_create_prompt
{
    return [argument0, argument1, argument2, argument3];
}

function tv_push_prompt(argument0, argument1, argument2, argument3) //gml_Script_tv_push_prompt
{
    with (obj_tv)
    {
        var b = [argument0, argument1, argument2, argument3]
        var play = 0
        switch argument1
        {
            case (0 << 0):
                play = 1
                ds_list_insert(tvprompts_list, 0, b)
                break
            case (1 << 0):
                var placed = 0
                var i = 0
                while (i < ds_list_size(tvprompts_list))
                {
                    var b2 = ds_list_find_value(tvprompts_list, i)
                    if (b2[1] == (2 << 0))
                    {
                        if (i == 0)
                            play = 1
                        ds_list_insert(tvprompts_list, i, b)
                        placed = 1
                        break
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
                if (!placed)
                    ds_list_add(tvprompts_list, b)
                break
            case (2 << 0):
                ds_list_add(tvprompts_list, b)
                break
        }

        if play
            state = states.normal
    }
}

function tv_push_prompt_array(argument0) //gml_Script_tv_push_prompt_array
{
    for (i = 0; i < array_length(argument0); i++)
    {
        with (obj_tv)
        {
            b = argument0[i]
            tv_push_prompt(b[0], b[1], b[2], b[3])
        }
    }
}

function tv_push_prompt_once(argument0, argument1) //gml_Script_tv_push_prompt_once
{
    with (obj_tv)
    {
        if (special_prompts == -4)
            return 0;
        b = ds_map_find_value(special_prompts, argument1)
        if is_undefined(b)
            return 0;
        if (b != 1)
        {
            tv_push_prompt(argument0[0], argument0[1], argument0[2], argument0[3])
            ds_map_set(special_prompts, argument1, 1)
            ini_open_from_string(obj_savesystem.ini_str)
            ini_write_real("Prompts", argument1, 1)
            obj_savesystem.ini_str = ini_close()
            return 1;
        }
        return 0;
    }
}

function tv_default_condition() //gml_Script_tv_default_condition
{
    return place_meeting(x, y, obj_player);
}

function tv_do_expression(argument0) //gml_Script_tv_do_expression
{
    with (obj_tv)
    {
        if (expressionsprite != argument0 && bubblespr == -4)
        {
            state = (250 << 0)
            expressionsprite = argument0
            switch expressionsprite
            {
                case spr_tv_exprhurt:
                case spr_tv_hurtG:
                    expressionbuffer = 60
                    break
                case spr_tv_exprhurt1:
                case spr_tv_exprhurt2:
                case spr_tv_exprhurt3:
                case spr_tv_exprhurt4:
                case spr_tv_exprhurt5:
                case spr_tv_exprhurt6:
                case spr_tv_exprhurt7:
                case spr_tv_exprhurt8:
                case spr_tv_exprhurt9:
                case spr_tv_exprhurt10:
                    expressionbuffer = 100
                    break
                case spr_tv_exprcollect:
                    expressionbuffer = 150
                    if obj_player.isgustavo
                    {
                        expressionsprite = spr_tv_happyG
                        if (irandom(100) <= 50)
                            sound_play_3d("event:/sfx/voice/brickok", obj_player1.x, obj_player1.y)
                    }
                    if (irandom(100) <= 50)
                        scr_fmod_soundeffect(obj_player1.snd_voiceok, obj_player1.x, obj_player1.y)
                    break
                case spr_tv_exprconfecti1:
                case spr_tv_exprconfecti2:
                case spr_tv_exprconfecti3:
                case spr_tv_exprconfecti4:
                case spr_tv_exprconfecti5:
                case spr_tv_exprrudejanitor:
                    expressionbuffer = 150
                    break
            }

        }
    }
}

function scr_tv_get_transfo_sprite() //gml_Script_scr_tv_get_transfo_sprite
{
    var _state = obj_player1.state
    if (_state == (84 << 0) || _state == (61 << 0))
        _state = obj_player1.tauntstoredstate
    var _spr = -4
    switch _state
    {
        case (47 << 0):
        case (48 << 0):
        case (49 << 0):
        case (38 << 0):
            _spr = spr_tv_knight
            break
        case (51 << 0):
        case (52 << 0):
            _spr = spr_tv_bombpep
            break
        case (9 << 0):
            _spr = spr_tv_fireass
            if (obj_player1.sprite_index == obj_player1.spr_scaredjump1 || obj_player1.sprite_index == obj_player1.spr_scaredjump2)
                _spr = spr_tv_scaredjump
            break
        case (5 << 0):
            if (obj_player1.sprite_index == obj_player1.spr_tumble || obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend)
                _spr = spr_tv_tumble
            else if obj_player1.shotgunAnim
                _spr = spr_tv_shotgun
            break
        case (10 << 0):
            _spr = spr_tv_firemouth
            break
        case (16 << 0):
        case (17 << 0):
            _spr = spr_tv_ghost
            break
        case (59 << 0):
            if (obj_player1.sprite_index == obj_player1.spr_squished)
                _spr = spr_tv_squished
            break
        case (0 << 0):
        case (92 << 0):
        case (42 << 0):
        case (100 << 0):
        case (93 << 0):
        case (121 << 0):
        case (105 << 0):
        case (106 << 0):
            with (obj_player1)
            {
                if shotgunAnim
                    _spr = spr_tv_shotgun
                else if global.mort
                    _spr = spr_tv_mort
                else if (sprite_index == spr_player_candyup || sprite_index == spr_player_candytransitionup)
                    _spr = spr_tv_croaked
            }
            break
        case (122 << 0):
        case (108 << 0):
        case (111 << 0):
            if obj_player1.shotgunAnim
                _spr = spr_tv_shotgun
            break
        case (72 << 0):
            if global.mort
                _spr = spr_tv_mort
            break
        case (66 << 0):
        case (69 << 0):
        case (71 << 0):
        case (57 << 0):
        case (70 << 0):
        case (67 << 0):
        case (68 << 0):
            _spr = spr_tv_shotgun
            break
        case (113 << 0):
        case (114 << 0):
        case (116 << 0):
        case (115 << 0):
            _spr = spr_tv_barrel
            break
        case (148 << 0):
            _spr = spr_tv_golf
            break
        case (184 << 0):
        case (185 << 0):
            _spr = spr_tv_rocket
            break
        case (21 << 0):
            _spr = spr_tv_cheeseball
            break
        case (24 << 0):
        case (26 << 0):
        case (25 << 0):
        case (29 << 0):
        case (30 << 0):
            _spr = spr_tv_cheesepep
            break
        case (33 << 0):
        case (35 << 0):
        case (34 << 0):
            _spr = spr_tv_boxxedpep
            break
        case (31 << 0):
            _spr = spr_tv_weenie
            break
        case (11 << 0):
        case (13 << 0):
        case (14 << 0):
        case (12 << 0):
            _spr = spr_tv_mort
            break
        case (104 << 0):
        case (37 << 0):
        case (65 << 0):
        case (78 << 0):
            if obj_player1.skateboarding
                _spr = spr_tv_clown
            else if obj_player1.shotgunAnim
                _spr = spr_tv_shotgun
            break
        case (304 << 0):
        case (305 << 0):
        case (306 << 0):
            _spr = spr_tv_cotton
            break
        case (310 << 0):
        case (312 << 0):
        case (313 << 0):
        case (311 << 0):
            _spr = spr_tv_skate
            break
        case (307 << 0):
            _spr = spr_tv_croaked
            break
    }

    with (obj_player1)
    {
        if (state == states.actor && sprite_index == spr_tumble)
            _spr = spr_tv_tumble
    }
    return _spr;
}

