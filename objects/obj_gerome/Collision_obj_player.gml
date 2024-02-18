add_saveroom()
global.gerome = 1
sound_play_3d((global.SUGARY ? "event:/modded/sfx/collecttoppinSP" : "event:/sfx/voice/geromegot"), x, y)
global.combotime = 60
gml_Script_instance_create(x, y, obj_geromefollow)
gml_Script_instance_create(x, y, obj_baddietaunteffect)
instance_destroy()
if (sprite_index == spr_gerome_idle_ss)
    tv_do_expression(spr_tv_exprrudejanitor)
