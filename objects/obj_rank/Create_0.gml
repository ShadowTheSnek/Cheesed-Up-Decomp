image_speed = 0.5
toppinvisible = 1
toppin[0] = 0
toppin[1] = 0
toppin[2] = 0
toppin[3] = 0
toppin[4] = 0
createmoney[0] = 0
createmoney[1] = 0
createmoney[2] = 0
createmoney[3] = 0
createmoney[4] = 0
var yy = (obj_screensizer.actual_height + 121)
x = (camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2))
y = ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - sprite_yoffset)
toppin_y[0] = (yy + 150)
toppin_y[1] = yy
toppin_y[2] = yy
toppin_y[3] = yy
toppin_y[4] = yy
toppin_yscale[0] = 1
toppin_yscale[1] = 1
toppin_yscale[2] = 1
toppin_yscale[3] = 1
toppin_yscale[4] = 1
var mins = global.level_minutes
if (mins < 10)
    mins = concat("0", mins)
else
    mins = concat(mins)
var secs = global.level_seconds
if (secs < 10)
{
    secs = string_format(secs, 1, 3)
    secs = ("0" + secs)
}
else
    secs = string_format(secs, 2, 3)
text = [[0, concat(gml_Script_lang_get_value("rank_highscore"), global.collect)], [0, concat(gml_Script_lang_get_value("rank_time"), mins, ":", secs)], [0, concat(gml_Script_lang_get_value("rank_damage"), global.player_damage)], [0, concat(gml_Script_lang_get_value("rank_combo"), global.highest_combo)]]
if (global.laps > 1)
    array_push(text, [0, ("LAPS: " + string((global.laps + 1)))])
text_pos = 0
toppin_index = 0
toppin_state = states.jump
toppin_buffer = 0
brown = 0
brownfade = 0
alarm[2] = 400
if check_sugarychar()
{
    alarm[2] = (room_speed * 2)
    if (global.rank == "p" || obj_endlevelfade.sugary)
        alarm[2] = (room_speed * 2.5)
    if (global.rank == "d")
        alarm[2] = (room_speed * 4.2)
}
if (obj_player.character == "BN" && (global.rank == "d" || global.rank == "c" || global.rank == "b"))
    alarm[2] = (room_speed * 2)
depth = -8
var fuck = asset_get_index((("spr_rank" + obj_player1.character) + string_upper(global.rank)))
if sprite_exists(fuck)
    sprite_index = fuck
else
{
    fuck = asset_get_index(("spr_rank" + string_upper(global.rank)))
    if sprite_exists(fuck)
        sprite_index = fuck
}
sugary = obj_endlevelfade.sugary
if (sugary && obj_player1.character != "SP")
    alarm[2] += (room_speed * 2.5)
sugaryrank = -1
if sugary
    sugaryrank = fmod_event_create_instance("event:/modded/sugary/rankloop")
cardimg = 0
event = 0
accel = 0
clipy = 809
colors = array_create_ext(string_length(string(global.collect)), function() //gml_Script_anon@2480@gml_Object_obj_rank_Create_0
{
    return choose(0, 1, 2, 3, 4, 5, 6);
}
)
function anon@2552@gml_Object_obj_rank_Create_0() //gml_Script_anon@2552@gml_Object_obj_rank_Create_0
{
    realcol = 
    {
        r: argument0,
        g: argument1,
        b: argument2,
        r2: argument3,
        g2: argument4,
        b2: argument5
    }

}

self.setcolors(0, 0, 0, 0, 0, 0)
function anon@2747@gml_Object_obj_rank_Create_0() //gml_Script_anon@2747@gml_Object_obj_rank_Create_0
{
    shader_set_fix(shd_mach3effect)
    var colorblend1 = shader_get_uniform(shd_mach3effect, "color1")
    shader_set_uniform_f(colorblend1, (realcol.r / 255), (realcol.g / 255), (realcol.b / 255))
    var colorblend2 = shader_get_uniform(shd_mach3effect, "color2")
    shader_set_uniform_f(colorblend2, (realcol.r2 / 255), (realcol.g2 / 255), (realcol.b2 / 255))
}

