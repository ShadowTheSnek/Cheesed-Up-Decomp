destroyable = 1
switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case (128 << 0):
        scr_enemy_charge()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        scr_enemy_walk()
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
    case (103 << 0):
        if (image_index > (image_number - 1))
        {
            hsp = (image_xscale * startmachspeed)
            if place_meeting(x, (y + 1), obj_railparent)
            {
                var _railinst = instance_place(x, (y + 1), obj_railparent)
                hsp += (_railinst.movespeed * _railinst.dir)
            }
            sprite_index = spr_robot_mach
            image_index = 0
            state = states.mach2
        }
        break
    case (104 << 0):
        hsp = (Approach(hsp, (image_xscale * machspeed), 0.5) + railmovespeed)
        if place_meeting(x, (y + 1), obj_railparent)
        {
            _railinst = instance_place(x, (y + 1), obj_railparent)
            railmovespeed = (_railinst.movespeed * _railinst.dir)
        }
        else
            railmovespeed = 0
        with (instance_place((x + hsp), y, obj_destructibles))
            instance_destroy()
        if (check_solid((x + sign(hsp)), y) && ((!(check_slope((x + sign(hsp)), y))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting(x, y, obj_destructibles))))
        {
            sound_play_3d("event:/sfx/pep/bumpwall", x, y)
            state = states.stun
            stunned = 100
            vsp = -4
            hsp = ((-image_xscale) * 2)
            sprite_index = stunfallspr
        }
        break
    case (91 << 0):
        if (image_index > 8)
        {
            hsp = (image_xscale * tacklespeed)
            if place_meeting(x, (y + 1), obj_railparent)
            {
                _railinst = instance_place(x, (y + 1), obj_railparent)
                hsp += (_railinst.movespeed * _railinst.dir)
            }
            with (instance_place((x + hsp), y, obj_destructibles))
                instance_destroy()
        }
        if (image_index > (image_number - 1))
        {
            state = states.walk
            hsp = 0
            railspeed = 0
            sprite_index = walkspr
        }
        if (check_solid((x + sign(hsp)), y) && ((!(check_slope((x + sign(hsp)), y))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting(x, y, obj_destructibles))))
        {
            sound_play_3d("event:/sfx/pep/bumpwall", x, y)
            state = states.stun
            stunned = 100
            vsp = -8
            hsp = ((-image_xscale) * 5)
            sprite_index = stunfallspr
        }
        break
    case (23 << 0):
        hsp = 0
        if (image_index > (image_number - 1))
        {
            state = states.walk
            sprite_index = walkspr
        }
        break
}

if (elitehit <= 0 && state != states.stun)
    instance_destroy()
if (state == states.stun && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1
    with (gml_Script_instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != states.stun)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
if (bombreset > 0)
    bombreset--
targetplayer = instance_nearest(x, y, obj_player)
if (x != targetplayer.x && state != states.throw && bombreset == 0)
{
    if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20))
    {
        if (state == states.walk || (state == states.idle && sprite_index != scaredspr))
        {
            sound_play_3d("event:/sfx/enemies/projectile", x, y)
            image_index = 0
            image_xscale = (-(sign((x - targetplayer.x))))
            state = chosenstate
            bombreset = 100
            switch state
            {
                case states.mach1:
                    sprite_index = spr_robot_machstart
                    image_index = 0
                    image_speed = 0.6
                    hsp = 0
                    break
                case (129 << 0):
                    bombreset = 0
                    sprite_index = spr_robot_attack
                    image_index = 0
                    image_speed = 0.35
                    hsp = 0
                    break
                case (91 << 0):
                    sprite_index = spr_robot_tackle
                    image_index = 0
                    image_speed = 0.6
                    hsp = 0
                    break
                case (23 << 0):
                    sprite_index = spr_robot_slap
                    image_index = 0
                    image_speed = 0.6
                    hsp = 0
                    break
            }

        }
    }
}
sound_instance_move(mach2snd, (x + hsp), (y + vsp))
sound_instance_move(tacklesnd, (x + hsp), (y + vsp))
if (boundbox == 0)
{
    with (gml_Script_instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
if (state == states.slap && image_index > 11)
{
    if (snd == 0)
    {
        sound_play_3d("event:/sfx/enemies/robotslapsteam", x, y)
        fmod_event_instance_play("event:/sfx/enemies/minijohnpunch", x, y)
    }
    snd = 1
}
if (state == states.mach2)
{
    if (snd == 0)
        fmod_event_instance_play(mach2snd)
    snd = 1
}
if (state == states.tackle && image_index > 8)
{
    if (snd == 0)
        fmod_event_instance_play(tacklesnd)
    snd = 1
}
if (state != states.slap && state != states.mach2 && state != states.tackle)
    snd = 0
if (state == states.mach2 || (state == states.slap && image_index > 11) || (state == states.tackle && image_index > 8))
{
    if (!hitboxcreate)
    {
        hitboxcreate = 1
        with (gml_Script_instance_create(x, y, obj_forkhitbox))
        {
            if (other.state == states.slap)
                sprite_index = spr_swordhitbox
            else if (other.state == states.mach2 || other.state == states.tackle)
                sprite_index = spr_bighitbox
            ID = other.id
        }
    }
}
else
    hitboxcreate = 0
