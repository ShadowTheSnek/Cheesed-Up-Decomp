function scr_player_handstandjump() //gml_Script_scr_player_handstandjump
{
    landAnim = 0
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    momemtum = 1
    dir = xscale
    if (shoot == 1)
        var attackdash = spr_player_pistolshot
    else
        attackdash = (shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash)
    var airattackdash = spr_suplexdashjump
    var airattackdashstart = spr_suplexdashjumpstart
    if (sprite_index == spr_attackdash || sprite_index == spr_airattack || sprite_index == spr_airattackstart)
    {
        attackdash = spr_attackdash
        airattackdash = spr_airattack
        airattackdashstart = spr_airattackstart
    }
    else if (sprite_index == spr_lunge)
        attackdash = spr_lunge
    else if (character == "SP" && image_index < 8 && (!((key_down && image_index > 5))) && (!((image_index > 5 && vsp > 1))))
    {
        movespeed = max(movespeed, 10)
        vsp = 0
    }
    if (movespeed < 10)
    {
        if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
            movespeed += 0.25
        else if (sprite_index == spr_lunge && movespeed < 12)
            movespeed += 0.8
        else if (movespeed < 10)
            movespeed += 0.5
    }
    if (global.pummeltest && sprite_index == spr_lunge && (!instance_exists(lungeattackID)))
    {
        with (gml_Script_instance_create(x, y, obj_lungehitbox))
        {
            playerid = other.id
            other.lungeattackID = id
        }
    }
    if (sprite_index == spr_player_lungestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_lunge
    if (attackdash == spr_lunge)
        vsp = 0
    if (input_buffer_slap > 0 || input_buffer_grab > 0)
    {
        input_buffer_grab = 0
        input_buffer_slap = 0
        scr_perform_move((1 << 0), (42 << 0))
    }
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (input_buffer_jump > 0 && (can_jump || sprite_index == spr_lunge) && (!key_down))
    {
        input_buffer_jump = 0
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        jumpstop = 0
        image_index = 0
        vsp = -11
        if (character != "N" || noisetype == 0)
        {
            fmod_event_instance_play(rollgetupsnd)
            state = states.mach2
            if (character == "P" || spr_longjump != spr_player_longjump)
                sprite_index = spr_longjump
            else
                sprite_index = spr_mach2jump
        }
    }
    if (sprite_index == attackdash && (!grounded) && character != "SP" && sprite_index != spr_lunge)
    {
        image_index = 0
        sprite_index = airattackdashstart
    }
    if (grounded && sprite_index == airattackdash && ((!key_attack) || (character == "N" && noisetype == 1)))
    {
        if (sprite_index != spr_lunge)
        {
            state = states.normal
            if (move != xscale)
                movespeed = 2
        }
        else
            image_index = (image_number - 6)
    }
    if (grounded && sprite_index == airattackdash && key_attack && (character != "N" || noisetype == 0))
        state = states.mach2
    if (floor(image_index) == (image_number - 1) && sprite_index == attackdash)
    {
        if (key_attack && (character != "N" || noisetype == 0))
        {
            image_speed = 0.35
            state = states.mach2
            grav = 0.5
        }
        else
            state = states.normal
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == airattackdashstart)
        sprite_index = airattackdash
    if (key_down && grounded)
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0))
        movespeed = 12
        crouchslipbuffer = 25
        grav = 0.5
        sprite_index = spr_crouchslip
        image_index = 0
        machhitAnim = 0
        state = states.tumble
        fmod_event_instance_play(snd_crouchslide)
    }
    mask_index = spr_player_mask
    if ((((!grounded) && (check_solid((x + hsp), y) || scr_solid_slope((x + hsp), y)) && (!(check_slope(x, (y - 1)))) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (grounded && (check_solid((x + sign(hsp)), (y - 16)) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && scr_slope())) && (character != "N" || noisetype == 0))
    {
        while (!(scr_solid((x + xscale), y)))
            x += xscale
        hsp = 0
        if (!(place_meeting((x + hsp), y, obj_unclimbablewall)))
            wallspeed = 6
        else
            wallspeed = (-vsp)
        if (character == "SP")
            wallspeed = max(movespeed, 6)
        grabclimbbuffer = 10
        state = states.climbwall
        if global.gameplay
            vsp = (-wallspeed)
    }
    if (grounded && scr_solid((x + xscale), y) && (!scr_slope()) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && ((!(check_slope((x + sign(hsp)), y))) || scr_solid_slope((x + sign(hsp)), y)))
    {
        var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
        if _bump
        {
            sound_play_3d("event:/sfx/pep/splat", x, y)
            jumpstop = 1
            state = states.jump
            vsp = -4
            sprite_index = spr_suplexbump
            gml_Script_instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
        }
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (gml_Script_instance_create(x, y, obj_slidecloud))
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
    }
    image_speed = 0.35
    if (state != states.bump && move != xscale && move != 0)
    {
        image_index = 0
        if (!grounded)
        {
            sound_play_3d("event:/sfx/pep/grabcancel", x, y)
            sprite_index = spr_suplexcancel
            jumpAnim = 1
            grav = 0.5
            state = states.jump
        }
        else
        {
            state = states.normal
            movespeed = 2
            grav = 0.5
        }
    }
}

