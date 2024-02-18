if (state == states.grabbed && object_index != obj_pepperman && object_index != obj_pizzafaceboss && object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_noiseboss && object_index != obj_pf_fakepep)
    scr_enemy_grabbed()
else if (state == states.lungeattack)
    scr_enemy_lungeattack()
else if (state == (266 << 0))
    scr_enemy_secret()
if (room == boss_pizzaface && state != states.pizzaheadjump)
    use_collision = 1
scr_squash()
if (flash && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != states.stun && state != states.hit)
{
    birdcreated = 0
    thrown = 0
    linethrown = 0
}
if (state == states.stun && (!thrown))
    linethrown = 0
if (object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_gustavograbbable && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pepperman && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_pizzaball && (place_meeting((x + 1), y, obj_spike) || place_meeting((x - 1), y, obj_spike) || place_meeting(x, (y + 1), obj_spike) || place_meeting(x, (y - 1), obj_spike)))
{
    if elite
        elitehit = 0
    instance_destroy()
}
if (state != states.grabbed && state != states.pummel && object_index != obj_pepbat && object_index != obj_fakesanta && use_collision)
    scr_collide()
if (invtime > 0)
    invtime--
if (stompbuffer > 0)
    stompbuffer--
if ((!thrown) && killbyenemybuffer > 0)
    killbyenemybuffer--
if (sprite_index == walkspr && state != (141 << 0) && floor(image_index) != (image_number - 1))
    steppy = 0
if (sprite_index == walkspr && hsp != 0 && sign(hsp) == sign(image_xscale) && grounded && vsp > 0 && floor(image_index) == (image_number - 1) && (!steppy) && object_index != obj_ghoul && state != (141 << 0))
{
    steppy = 1
    var _yy = (y + 43)
    if (object_index == obj_pizzafaceboss_p2 || object_index == obj_pizzafaceboss_p3)
        _yy = (y + 78)
    create_particle((x - (image_xscale * 20)), _yy, (1 << 0), 0)
}
if ((object_index != obj_pizzice || state != states.throw) && object_index != obj_pizzafaceboss_p3 && object_index != obj_fakepepboss && state != states.phase1hurt)
{
    if (state == states.walk)
        image_speed = 0.35
    else if (state != (128 << 0))
        image_speed = 0.35
}
if (dodgebuffer > 0)
    dodgebuffer--
if (object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_gustavograbbable && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pepperman && object_index != obj_pf_fakepep && object_index != obj_fakepepboss)
{
    if (object_index != obj_bazookabaddie || (!instance_exists(bazookaID)))
    {
        with (instance_nearest(x, y, obj_player))
        {
            if (state == states.backbreaker)
            {
                other.stunned = 0
                if (other.state != states.throw && (!other.provoked) && other.bombreset > 0)
                {
                    other.bombreset = 0
                    other.provoked = 1
                }
                other.scaredbuffer = 0
            }
            else if (other.state != states.throw)
                other.provoked = 0
        }
    }
}
if (state != states.pizzaheadjump && object_index != obj_pepperman && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p2 && object_index != obj_pizzafaceboss_p3 && object_index != obj_noisey && object_index != obj_gustavograbbable)
{
    if (y > (room_height + 100))
        instance_destroy()
    if (thrown && (x > (room_width + 100) || x < -100 || y < -100))
        instance_destroy()
    if ((!thrown) && (x > (room_width + 400) || x < -400 || y > (room_height + 400) || y < -400))
        instance_destroy(id, false)
}
if (state != states.hit)
    player_instakillmove = 0
if (fmod_event_instance_is_playing(chargesnd) && state != (128 << 0))
    fmod_event_instance_stop(chargesnd)
if check_heat()
{
    var newpalette = basepal
    if ((safe_get(id, "elite") && use_elite) || global.stylethreshold >= 3)
        newpalette = elitepal
    if (paletteselect != newpalette)
    {
        if (state != (189 << 0) && visible && (!global.MOD.DeathMode))
            create_particle(x, y, (9 << 0))
        paletteselect = newpalette
    }
}
