if (array_contains(base_game_levels(), global.leveltosave) && (!global.sandbox))
{
    ini_open_from_string(obj_savesystem.ini_str)
    if (ini_read_real("Highscore", global.leveltosave, 0) == 0 && (!(ini_read_real("Tutorial", "lapunlocked", 0))))
        sprite_index = spr_outline
    ini_close()
}
if (global.lapmode != (2 << 0) && global.MOD.DeathMode)
    instance_destroy()
if (global.lapmode == (2 << 0) && global.laps >= 3)
    instance_destroy()
if (global.lapmode == (0 << 0) && global.lap)
    instance_destroy()
if global.snickchallenge
    instance_destroy()
