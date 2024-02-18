gate_sprite = spr_gate_fakepep
bgsprite = spr_gate_fakepepBG
targetRoom = boss_fakepep
save = "w4stick"
group_arr = ["bossgroup"]
maxscore = @@Global@@().stickreq[3]
ini_open_from_string(obj_savesystem.ini_str)
if ini_read_string("Game", "fakepepportrait", 0)
    msg = gml_Script_lang_get_value_newline("boss_fakepep2")
else
    msg = gml_Script_lang_get_value_newline("boss_fakepep1")
ini_close()
