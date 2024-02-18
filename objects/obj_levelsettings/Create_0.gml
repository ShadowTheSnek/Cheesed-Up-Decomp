sound_play("event:/modded/sfx/diagopen")
menu = 1
state = states.normal
fadealpha = 0
anim_t = 0
outback = animcurve_get_channel(curve_menu, "outback")
surface = -1
clip_surface = -1
event_inherited()
sel = 0
var boss = 0
with (obj_bossdoor)
{
    if place_meeting(x, y, obj_player)
        boss = 1
}
function add_modifier@gml_Object_obj_levelsettings_Create_0(argument0, argument1, argument2) //gml_Script_add_modifier@gml_Object_obj_levelsettings_Create_0
{
    if (argument1 == undefined)
        argument1 = string_lower(argument0)
    if (argument2 == undefined)
        argument2 = -4
    var struct = 
    {
        type: (3 << 0),
        value: 0,
        vari: argument0,
        name: gml_Script_lang_get_value_newline(("mod_title_" + argument1)),
        desc: gml_Script_lang_get_value_newline(("mod_desc_" + argument1)),
        opts: [["off", 0], ["on", 1]],
        drawfunc: argument2,
        condition: -4
    }

    array_push(options_array, struct)
    return struct;
}

options_array = []
self.add_button("ok", function() //gml_Script_anon@774@gml_Object_obj_levelsettings_Create_0
{
    reset_modifier()
    for (var i = 0; i < array_length(options_array); i++)
    {
        var opt = options_array[i]
        if (opt.type == (3 << 0))
            variable_struct_set(global.MOD, opt.vari, opt.opts[opt.value][1])
    }
    state = states.door
    with (obj_startgate)
    {
        if place_meeting(x, y, obj_player1)
        {
            obj_player1.image_index = (obj_player1.image_number - 1)
            obj_player1.state = states.victory
        }
    }
}
)
self.add_section("modifiers")
var deathmode_allow = ["entryway", "entrance", "medieval", "etb", "midway"]
if array_contains(deathmode_allow, level, 0, infinity)
    add_modifier("DeathMode", undefined, [seq_deathmode_off, seq_deathmode_on])
if ((level == "medieval" || level == "ruin" || level == "dungeon") ? 0 : 0)
    add_modifier("OldLevels", undefined, [seq_oldlevels_off, seq_oldlevels_on])
if ((!boss) && level != "tutorial" && global.experimental)
    add_modifier("NoToppings", undefined, [seq_notoppings_off, seq_notoppings_on])
if ((!boss) && level != "tutorial")
    add_modifier("Pacifist", undefined, [seq_pacifist_off, seq_pacifist_on])
add_modifier("HardMode", undefined, [seq_hardmode_off, seq_hardmode_on])
add_modifier("Mirror", undefined, [seq_mirrored_off, seq_mirrored_on])
add_modifier("JohnGhost")
circle_size = 250
add_modifier("Spotlight", undefined, function(argument0) //gml_Script_anon@2814@gml_Object_obj_levelsettings_Create_0
{
    gml_Script_toggle_alphafix(0)
    draw_clear(c_black)
    circle_size = lerp(circle_size, (argument0 ? 70 : 250), 0.25)
    gpu_set_blendmode(bm_subtract)
    draw_circle((192 + random_range(-1, 1)), (108 + random_range(-1, 1)), circle_size, 0)
    draw_set_alpha(0.35)
    draw_circle((192 + random_range(-1, 1)), (108 + random_range(-1, 1)), (circle_size + 30), 0)
    draw_set_alpha(1)
    gml_Script_toggle_alphafix(1)
    var p = simuplayer
    draw_sprite(spr_playerN_move, p.image, 192, 108)
}
)
var l = level_info(level)
if (is_instanceof(l, gml_Script___levelinfo) && global.experimental)
    add_modifier("FromTheTop")
add_modifier("GravityJump")
opt = add_modifier("DoubleTrouble")
array_push(opt.opts, ["hydra", 2])
if (level == "grinch")
{
    self.add_section("level")
    add_modifier("EasyMode", "grincheasy")
}
if (level == "golf")
{
    self.add_section("level")
    add_modifier("EasyMode", "golfeasy")
}
if (level == "snickchallenge")
{
    self.add_section("level")
    add_modifier("OldLevels", undefined, [seq_oldlevels_off, seq_oldlevels_on])
    add_modifier("EasyMode", "snickeasy")
}
if (level == "exit")
{
    self.add_section("level")
    add_modifier("CTOPLaps", undefined, [seq_lappable_off, seq_lappable_on])
}
if (level == "secretworld")
{
    self.add_section("level")
    add_modifier("Ordered")
    add_modifier("SecretInclude")
}
if (level == "dragonlair")
{
    self.add_section("level")
    add_modifier("CTOPLaps", undefined, [seq_lappable_off, seq_lappable_on])
}
self.refresh_options()
