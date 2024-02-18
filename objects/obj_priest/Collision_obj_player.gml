var _transfo = 0
var _state = other.state
with (other)
{
    if ((!scr_transformationcheck()) && state != states.comingoutdoor && state != states.door)
    {
        if (state == states.ghost)
            notification_push((41 << 0), [ghosttimer, room])
        if (state == states.mort || state == states.mortjump || state == states.morthook || state == states.mortattack || state == states.mortjump || state == states.boxxedpep || state == states.boxxedpepjump || state == states.boxxedpepspin || state == states.ghost || state == states.barrelslide || state == states.barrel || state == states.barreljump)
        {
            if (hsp != 0)
                xscale = sign(hsp)
            movespeed = abs(hsp)
        }
        transformationsnd = 0
        state = states.normal
        sprite_index = spr_idle
        input_buffer_grab = 0
        if isgustavo
        {
            state = states.ratmount
            sprite_index = spr_ratmount_idle
        }
        dir = xscale
        ghostdash = 0
        ghostpepper = 0
        _transfo = 1
        create_particle(x, y, (9 << 0))
    }
}
if _transfo
{
    sound_play("event:/sfx/pep/pray")
    var p = other.id
    with (gml_Script_instance_create((other.x - 540), (camera_get_view_y(view_camera[0]) - 100), obj_priestangel))
    {
        priestID = other.id
        playerid = p
        if other.sugary
            sprite_index = spr_devilboy
    }
    with (other)
    {
        if (_state == (11 << 0) || _state == (14 << 0) || _state == (12 << 0) || _state == (13 << 0))
            create_debris(x, (y - 40), spr_mortdead)
    }
    if (sprite_index != spr_angelpriest)
        sprite_index = spr_pray
    if (collect && (!in_saveroom()))
    {
        notification_push((25 << 0), [room, id, _state])
        add_saveroom()
        if (!global.snickchallenge)
        {
            var val = 500
            global.collect += val
            global.combotime = 60
            global.heattime = 60
            with (gml_Script_instance_create((x + 16), y, obj_smallnumber))
                number = string(val)
            scr_sound_multiple(global.snd_collect, x, y)
            if escape
                add_saveroom(id, global.escaperoom)
            var d = round((val / 16))
            for (var i = 0; i < val; i += d)
            {
                spr_palette = -4
                paletteselect = 0
                var spr = scr_collectspr(obj_collect, undefined, 0)
                create_collect((other.x + irandom_range(-60, 60)), (other.y + irandom_range(-60, 60)), spr, d, spr_palette, paletteselect)
            }
        }
    }
}
