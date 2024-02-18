if (room == rm_editor)
    return;
if global.key_inv
    return;
with (other)
{
    if other.sugary
    {
        instance_destroy(other)
        global.key_inv = 1
        sound_play("event:/sfx/misc/collecttoppin")
        global.combotime = 60
        global.heattime = 60
        gml_Script_instance_create(x, y, obj_spookeyfollow)
        with (gml_Script_instance_create(x, y, obj_taunteffect))
            player = -4
    }
    else if (state != states.bombpep && state != states.gotoplayer && state != states.ghost && state != states.knightpep && state != states.cheeseball && state != states.boxxedpep && state != states.cheesepep && state != states.knightpepattack && state != states.knightpepslopes && state != states.hurt && state != states.knightpepbump)
    {
        instance_destroy(other)
        goblinkey = 0
        global.key_inv = 1
        key_particles = 1
        alarm[7] = 30
        sound_play("event:/sfx/misc/collecttoppin")
        state = states.keyget
        image_index = 0
        keysound = 0
        global.combotime = 60
        global.heattime = 60
    }
}
