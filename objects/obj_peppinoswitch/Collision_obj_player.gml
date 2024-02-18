if (global.switchbuffer == 0 && global.panic == escape)
{
    with (other)
    {
        hsp = 0
        vsp = 0
        visible = false
        state = states.actor
    }
    sound_play("event:/sfx/misc/pepgusswitch")
    create_particle(x, y, (9 << 0))
    sprite_index = spr_peppinoswitch1
    playerid = other.id
    global.switchbuffer = 200
    with (obj_gustavoswitch)
    {
        sprite_index = spr_gustavoswitch2
        image_index = 0
    }
    with (gml_Script_instance_create(0, 0, obj_charswitch_intro))
        spr = other.switchspr
}
