if (room == rm_editor)
    return;
switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        break
    case (206 << 0):
        if (!instance_exists(playerid))
        {
            state = states.walk
            break
        }
        else
        {
            if (x != playerid.x)
                image_xscale = (-(sign((x - playerid.x))))
            var _is_brick = playerid.object_index == obj_brickcomeback
            if (!_is_brick)
            {
                with (playerid)
                {
                    if (state == states.taxi)
                        other.state = states.walk
                    else if (!launched)
                    {
                        hamkuffID = other.id
                        var _xs = 0
                        if (x != other.x)
                            _xs = (-(sign((x - other.x))))
                        var dis = 180
                        var m = (abs((x - other.x)) > dis ? abs(hsp) : (abs(hsp) - max(0, (abs(hsp) - 2))))
                        if (hsp == 0)
                            m = _xs
                        if (!((state == states.machslide && sprite_index == spr_mach3boost)))
                            hsp_carry = (_xs * abs(m))
                        else
                            hsp_carry = (-hsp)
                        if (state != states.bump && state != states.mach3 && state != states.mach2 && state != states.machslide && abs((x - other.x)) > ((dis + abs(movespeed)) + 1))
                        {
                            state = states.bump
                            sound_play_3d("event:/sfx/pep/bumpwall", x, y)
                            sprite_index = spr_bump
                            if (x != other.x)
                            {
                                hsp = ((-(sign((x - other.x)))) * 3)
                                if ((!other.attract_player) && check_solid((x + sign(hsp)), y) && (!(check_slope((x + sign(hsp)), y))))
                                {
                                    other.attract_player = 1
                                    launched = 0
                                    flash = 1
                                    sound_play_3d("event:/sfx/pep/bumpwall", x, y)
                                }
                            }
                        }
                        if ((!other.attract_player) && y > (other.y + 100) && collision_line(other.x, other.y, x, y, obj_solid, false, true) != -4)
                        {
                            other.attract_player = 1
                            launched = 0
                            flash = 1
                            sound_play_3d("event:/sfx/pep/bumpwall", x, y)
                        }
                        if (state == states.mach3 || (state == states.machslide && sprite_index == spr_mach3boost))
                            launch = 1
                        if (state == states.machslide && sprite_index == spr_mach3boost && launch)
                            movespeed -= 0.6
                        if (state == states.mach3 && movespeed > 15)
                            movespeed = 15
                        freefallsmash = 0
                        if (state == states.grind || state == states.climbwall || state == states.Sjumpprep || state == states.Sjump || state == states.Sjumpland || y < (other.y - 400))
                        {
                            sound_play_3d("event:/sfx/pep/bumpwall", x, y)
                            vsp = -4
                            hsp = (-3 * xscale)
                            state = states.bump
                            sprite_index = spr_bump
                            image_index = 0
                        }
                        if (distance_to_object(other) > 350 && (!other.attract_player))
                        {
                            other.attract_player = 1
                            launched = 0
                            flash = 1
                            sound_play_3d("event:/sfx/pep/bumpwall", x, y)
                        }
                        if other.attract_player
                        {
                            launched = 0
                            state = states.actor
                            hsp = 0
                            vsp = 0
                            movespeed = 0
                            sprite_index = spr_machfreefall
                            var tx = other.x
                            var ty = other.y
                            var _dir = point_direction(x, y, tx, ty)
                            x += lengthdir_x(7, _dir)
                            y += lengthdir_y(7, _dir)
                            if (abs((x - tx)) < 20 && abs((y - ty)) < 32)
                            {
                                x = tx
                                y = ty
                                state = states.jump
                                other.attract_player = 0
                            }
                        }
                        if launched
                        {
                            other.state = states.walk
                            instance_destroy(other)
                            global.combotime = 60
                        }
                        if (other.grabsound == 0)
                        {
                            sound_play_3d("event:/sfx/enemies/hamkuffgrab", x, y)
                            other.grabsound = 1
                        }
                    }
                }
                if playerid.launch
                    sprite_index = spr_hamkuff_chain2
                else
                    sprite_index = spr_hamkuff_chain1
            }
            else
            {
                with (playerid)
                {
                    tx = (other.x + (other.image_xscale * 32))
                    ty = other.y
                    if (distance_between_points(x, y, tx, ty) > 10)
                    {
                        _dir = point_direction(x, y, tx, ty)
                        x += lengthdir_x(10, _dir)
                        y += lengthdir_y(10, _dir)
                    }
                }
            }
            break
        }
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
    case (154 << 0):
        scr_enemy_pummel()
        break
    case (155 << 0):
        scr_enemy_staggered()
        break
    case (125 << 0):
        scr_enemy_rage()
        break
    case (17 << 0):
        scr_enemy_ghostpossess()
        break
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (gml_Script_instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != states.walk && state != states.blockstance)
    attract_player = 0
var _dis = 300
if (state == states.walk && obj_player1.isgustavo && (!obj_player1.cutscene) && obj_player1.state != (292 << 0) && obj_player1.state != states.taxi && ((distance_to_object(obj_player) < _dis && obj_player1.brick) || distance_to_object(obj_ratmountgroundpound) < _dis || (distance_to_object(obj_brickcomeback) < _dis && instance_exists(obj_brickcomeback) && (!obj_brickcomeback.trapped)) || distance_to_object(obj_brickball) < _dis))
{
    state = states.blockstance
    sprite_index = spr_hamkuff_chain1
    var x1 = obj_player1.x
    var y1 = obj_player1.y
    if instance_exists(obj_ratmountgroundpound)
    {
        x1 = obj_ratmountgroundpound.x
        y1 = obj_ratmountgroundpound.y
    }
    else if instance_exists(obj_brickcomeback)
    {
        x1 = obj_brickcomeback.x
        y1 = obj_brickcomeback.y
    }
    else if instance_exists(obj_brickball)
    {
        x1 = obj_brickball.x
        y1 = obj_brickball.y
    }
    with (gml_Script_instance_create(x1, y1, obj_parryeffect))
        sprite_index = spr_morthookgrabeffect
    instance_destroy(obj_ratmountgroundpound, false)
    instance_destroy(obj_brickcomeback, false)
    instance_destroy(obj_brickball, false)
    with (gml_Script_instance_create(x1, y1, obj_brickcomeback))
    {
        trapped = 1
        baddieID = other.id
        other.playerid = id
    }
    with (obj_player1)
    {
        sound_play_3d("event:/sfx/enemies/hamkuffgrab", other.x, other.y)
        sound_play_3d("event:/sfx/rat/ratdead", x, y)
        sound_play_3d("event:/sfx/pep/bumpwall", x, y)
        brick = 0
        sprite_index = spr_lonegustavoidle
        state = states.ratmount
    }
}
if (state != states.stun)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
