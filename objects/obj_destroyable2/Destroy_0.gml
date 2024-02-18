if (room == rm_editor)
    return;
if (!in_saveroom())
{
    fail_modifier(global.MOD.NoToppings)
    if sprite_exists(particlespr)
    {
        repeat (6)
            create_debris((x + 16), (y + 16), particlespr)
    }
    with (gml_Script_instance_create((x + 16), (y + 16), obj_parryeffect))
        sprite_index = other.spr_dead
    scr_sleep(5)
    create_baddiegibsticks((x + 16), (y + 16))
    scr_sound_multiple(global.snd_collect, x, y)
    global.heattime = clamp((global.heattime + 10), 0, 60)
    global.combotime = clamp((global.combotime + 10), 0, 60)
    if (!global.snickchallenge)
    {
        var val = heat_calculate(10)
        global.collect += val
        with (gml_Script_instance_create((x + 16), y, obj_smallnumber))
            number = string(val)
    }
    notification_push((45 << 0), [room])
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    add_saveroom()
}
