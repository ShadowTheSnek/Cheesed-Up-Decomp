if (room == rm_editor)
    return;
switch state
{
    case states.idle:
        grav = 0.5
        scr_enemy_idle()
        break
    case (128 << 0):
        grav = 0.5
        scr_enemy_charge()
        break
    case (130 << 0):
        grav = 0.5
        scr_enemy_turn()
        break
    case (134 << 0):
        grav = 0.5
        scr_enemy_walk()
        break
    case (136 << 0):
        grav = 0.5
        scr_enemy_land()
        break
    case (137 << 0):
        grav = 0.5
        scr_enemy_hit()
        break
    case (138 << 0):
        grav = 0.5
        scr_enemy_stun()
        break
    case (129 << 0):
        grav = 0.5
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        grav = 0.5
        scr_enemy_grabbed()
        break
}

if ((!hitboxcreate) && state == states.walk)
{
    hitboxcreate = 1
    with (gml_Script_instance_create(x, y, obj_forkhitbox))
    {
        ID = other.id
        sprite_index = spr_coolpineahitbox
    }
}
if (inv_timer <= 0)
    scr_scareenemy()
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (gml_Script_instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != states.stun)
    birdcreated = 0
if (sprite_index == scaredspr)
    inv_timer = 0
if (state == states.walk)
{
    grav = 0.5
    if point_in_camera(x, y, view_camera[0])
    {
        var player = instance_nearest(x, y, obj_player)
        var _taunt = 0
        with (player)
        {
            if (state == states.backbreaker)
                _taunt = 1
        }
        if (global.stylethreshold >= 3)
        {
            if (((image_xscale > 0 ? (player.x > x && player.x < (x + 200)) : (player.x < x && player.x > (x - 200))) || (_taunt && distance_to_object(player) < 200)) && y <= (player.y + 60) && y >= (player.y - 60))
            {
                if (x != player.x)
                    image_xscale = (-(sign((x - player.x))))
                breakdance = 35
                state = states.punch
                sprite_index = spr_coolpinea_ragestart
                image_index = 0
                image_speed = 0.35
                breakdanceinst = gml_Script_instance_create(x, y, obj_pineabreakdancehitbox)
                breakdanceinst.ID = id
                flash = 1
                create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
            }
        }
        else if _taunt
        {
            taunteffect_inst = gml_Script_instance_create(x, y, obj_baddietaunteffect)
            sprite_index = spr_coolpinea_taunt
            image_speed = 0
            index = choose(0, 1, 2)
            taunt_count = taunt_max
            taunt_storedstate = state
            taunt_storedmovespeed = movespeed
            taunt_storedhsp = hsp
            state = states.backbreaker
            hsp = 0
            vsp = 0
            grav = 0
        }
    }
}
if (state != states.backbreaker && instance_exists(taunteffect_inst))
    instance_destroy(taunteffect_inst)
switch state
{
    case states.backbreaker:
        image_speed = 0
        image_index = index
        hsp = 0
        vsp = 0
        if (taunt_count > 0)
            taunt_count--
        else
        {
            sprite_index = walkspr
            grav = taunt_storedgrav
            state = states.walk
            hsp = taunt_storedhsp
            movespeed = taunt_storedmovespeed
        }
        break
    case (147 << 0):
        image_speed = 0.35
        if (trail_count > 0)
            trail_count--
        else
        {
            with (create_afterimage(x, y, sprite_index, (image_index - 1)))
                image_xscale = other.image_xscale
            trail_count = trail_max
        }
        if (instance_exists(taunteffect_inst) && taunteffect_inst.object_index == obj_baddietaunteffect)
        {
            instance_destroy(taunteffect_inst)
            taunteffect_inst = -4
        }
        if (movespeed > 0)
            movespeed -= 0.5
        else
            movespeed = 0
        hsp = (movespeed * (-image_xscale))
        if (image_index > (image_number - 1))
        {
            sprite_index = walkspr
            grav = taunt_storedgrav
            state = taunt_storedstate
            hsp = taunt_storedhsp
            cooldown_count = cooldown_max
            movespeed = taunt_storedmovespeed
        }
        break
    case (80 << 0):
        if (sprite_index == spr_coolpinea_ragestart)
        {
            hsp = 0
            inv_timer = 0
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_coolpinea_rage
                breakdance_movespeed = 10
                hsp = (breakdance_movespeed * image_xscale)
            }
        }
        else
        {
            breakdance_movespeed = Approach(breakdance_movespeed, 0, 0.25)
            hsp = (image_xscale * breakdance_movespeed)
            if check_solid((x + sign(hsp)), y)
            {
                image_xscale *= -1
                if (breakdance_movespeed < 3)
                    breakdance_movespeed = 5
                hsp = (breakdance_movespeed * image_xscale)
            }
            if (trail_count > 0)
                trail_count--
            else
            {
                with (create_red_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
                    playerid = other.id
                trail_count = trail_max
            }
            if (breakdance > 0)
                breakdance--
            else
            {
                sprite_index = walkspr
                state = states.walk
                breakdanceinst = -4
            }
        }
        break
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
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
