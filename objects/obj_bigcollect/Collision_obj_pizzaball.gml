fail_modifier(global.MOD.NoToppings)
if (obj_player1.character == "V")
    global.playerhealth = clamp((global.playerhealth + 10), 0, 100)
global.heattime = 60
with (obj_camera)
    healthshaketime = 60
if (global.snd_collectpizza == global.snd_collect)
    scr_sound_multiple(global.snd_collectpizza, x, y)
else
    sound_play(global.snd_collectpizza)
if (object_index == obj_escapecollectbig)
    sound_play_3d("event:/sfx/misc/bellcollectbig", x, y)
instance_destroy()
global.combotime = 60
var val = heat_calculate(value)
global.collect += val
create_collect(x, y, sprite_index, val)
with (gml_Script_instance_create((x + 16), y, obj_smallnumber))
    number = string(val)
tv_do_expression(spr_tv_exprcollect)
