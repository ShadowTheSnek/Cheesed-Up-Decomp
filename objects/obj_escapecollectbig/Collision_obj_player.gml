if (room == rm_editor)
    return;
if (image_alpha == 1)
{
    if (other.state != states.gotoplayer)
    {
        fail_modifier(global.MOD.NoToppings)
        if (obj_player1.character == "V")
            global.playerhealth = clamp((global.playerhealth + 10), 0, 100)
        global.heattime = 60
        with (obj_camera)
            healthshaketime = 60
        global.combotime = 60
        if (sprite_index != spr_escapecollectbig_ss)
        {
            sound_play_3d(global.snd_collectpizza, x, y)
            sound_play_3d("event:/sfx/misc/bellcollectbig", x, y)
        }
        else
            sound_play_3d("event:/sfx/misc/bellcollectbig_ss", x, y)
        instance_destroy()
        if (!global.snickchallenge)
        {
            var val = heat_calculate(value)
            if (other.object_index == obj_player1)
                global.collect += val
            else
                global.collectN += val
            create_collect(x, y, sprite_index, val)
            with (gml_Script_instance_create((x + 16), y, obj_smallnumber))
                number = string(val)
        }
    }
}
event_user(0)
