achievements = array_create(0)
achievement = 0
yoffset = 0
scr_init_input()
var lvl = global.leveltosave
switch lvl
{
    case "b_pepperman":
        lvl = "pepperman"
        var ix = 0
        break
    case "b_vigilante":
        lvl = "vigilante"
        ix = 1
        break
    case "b_noise":
        lvl = "noise"
        ix = 2
        break
    case "b_fakepep":
        lvl = "fakepep"
        ix = 3
        break
    case "b_pizzaface":
        lvl = "pizzaface"
        ix = 4
        break
}

if (global.leveltorestart == boss_pizzaface)
{
    lvl = "pizzaface"
    ix = 4
}
ini_open_from_string(obj_savesystem.ini_str)
if (lvl != "pepperman" && lvl != "vigilante" && lvl != "pizzaface" && lvl != "fakepep" && lvl != "noise")
{
    if (lvl == "plage")
        sprite = spr_achievement_beach
    else if (lvl == "minigolf")
        sprite = spr_achievement_golf
    else
        sprite = ds_map_find_value(global.SPRITES, string("spr_achievement_{0}", lvl))
    for (var i = 0; i < (sprite_get_number(sprite) / 2); i++)
    {
        var n = concat("achievement_", lvl, (i + 1))
        var _got = ini_read_real("achievements", concat(lvl, (i + 1)), 0)
        array_push(achievements, 
        {
            name: gml_Script_lang_get_value(concat(n, "title")),
            description: gml_Script_lang_get_value_newline(n),
            got: _got
        }
)
    }
}
else
{
    sprite = spr_achievement_bosses
    n = concat("achievement_", lvl)
    _got = ini_read_real("achievements", lvl, 0)
    array_push(achievements, 
    {
        name: gml_Script_lang_get_value(concat(n, "title")),
        description: gml_Script_lang_get_value_newline(n),
        image_index: ix,
        got: _got
    }
)
}
ini_close()
