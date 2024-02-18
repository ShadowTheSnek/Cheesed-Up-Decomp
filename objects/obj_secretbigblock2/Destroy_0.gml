if (!in_saveroom())
{
    if (content == obj_null)
    {
        global.heattime = clamp((global.heattime + 50), 0, 60)
        global.combotime = clamp((global.combotime + 50), 0, 60)
        if (!global.snickchallenge)
        {
            var val = heat_calculate((global.SUGARY ? 50 : 100))
            global.collect += val
            scr_sound_multiple(global.snd_collect, x, y)
            with (gml_Script_instance_create((x + 16), y, obj_smallnumber))
                number = string(val)
        }
    }
    else
        gml_Script_instance_create((x + 32), y, content)
    repeat (3)
        create_baddiegibsticks((x + 32), (y + 32))
}
event_inherited()
