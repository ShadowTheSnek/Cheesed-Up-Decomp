global.roommessage = gml_Script_lang_get_value_newline("room_towersage")
global.collect = 0
ds_list_clear(global.saveroom)
ds_list_clear(global.baddieroom)
global.prank_enemykilled = 0
global.prank_cankillenemy = 1
global.combodropped = 0
global.combo = 0
global.combotime = 0
global.comboscore = 0
global.previouscombo = 0
global.style = 0
global.stylethreshold = 0
global.heattime = 0
with (obj_player)
    supercharged = 0
