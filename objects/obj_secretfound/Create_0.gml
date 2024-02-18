if global.MOD.OldLevels
    instance_create_unique(0, 0, obj_ghostcollectibles)
if (in_saveroom() || instance_exists(obj_randomsecret) || global.snickchallenge)
    return;
global.secretfound++
var count = 3
if global.MOD.OldLevels
    count = 6
if (global.leveltosave == "etb")
    count = 2
var val = min(global.secretfound, count)
var txt = gml_Script_lang_get_value((val == 1 ? "secret_text1_mod" : "secret_text2_mod"))
txt = embed_value_string(txt, [val, count])
create_transformation_tip(txt)
fmod_event_one_shot("event:/sfx/misc/secretfound")
add_saveroom()
