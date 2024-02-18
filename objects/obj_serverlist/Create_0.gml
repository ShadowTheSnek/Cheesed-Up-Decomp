var e;
if (room != characterselect)
{
    instance_destroy()
    return;
}
ver = "1.0"
function anon@127@gml_Object_obj_serverlist_Create_0(argument0, argument1, argument2, argument3) //gml_Script_anon@127@gml_Object_obj_serverlist_Create_0
{
    array_push((argument3 ? officialservers : serverlist.servers), 
    {
        ip: argument0,
        port: argument1,
        name: argument2
    }
)
}

function anon@281@gml_Object_obj_serverlist_Create_0() //gml_Script_anon@281@gml_Object_obj_serverlist_Create_0
{
    var file = file_text_open_write("servers.json")
    file_text_write_string(file, json_stringify(serverlist))
    file_text_close(file)
}

function anon@449@gml_Object_obj_serverlist_Create_0(argument0) //gml_Script_anon@449@gml_Object_obj_serverlist_Create_0
{
    return 0;
}

var reset = 1
if file_exists("servers.json")
{
    @@try_hook@@(964, 1012)
    file = file_text_open_read("servers.json")
    if (file != -1)
    {
        var json = file_text_readln(file)
        file_text_close(file)
        serverlist = json_parse(json)
        if (variable_struct_exists(serverlist, "servers") && variable_struct_exists(serverlist, "username") && variable_struct_exists(serverlist, "version") && serverlist.version == ver)
        {
            reset = 0
            if self.uname_check(serverlist.username)
                serverlist.username = ""
        }
        else
            message_show("OUTDATED SERVER LIST!")
    }
    @@try_unhook@@()
}
if reset
{
    serverlist = 
    {
        username: "",
        servers: [],
        version: ver
    }

}
officialservers = []
communityservers = []
req = -1
loading = 1
state = states.normal
scr_init_input()
surfclip = -4
surffinal = -4
bgscroll = 0
listscroll = 0
listscroll_true = 0
pto_textbox_init()
cursor = 
{
    active: 0,
    x: 480,
    y: 270,
    leftclick: 0,
    rightclick: 0,
    scrolldown: 0,
    scrollup: 0
}

mx_previous = gml_Script_mouse_x_hook()
my_previous = gml_Script_mouse_y_hook()
stick = 0
scr_init_input()
if gamepad_is_connected(obj_inputAssigner.player_input_device[0])
    cursor.active = 1
function anon@1999@gml_Object_obj_serverlist_Create_0(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_anon@1999@gml_Object_obj_serverlist_Create_0
{
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    if surface_exists(surfclip)
        surface_resize(surfclip, argument2, argument3)
    if surface_exists(surffinal)
        surface_resize(surffinal, argument2, argument3)
    var xx = argument0
    var yy = argument1
    draw_sprite_ext(spr_tutorialbubble_rope, 0, (xx + 16), (argument1 + 16), 1, ((argument1 / 61) + 1), 0, c_white, 1)
    draw_sprite_ext(spr_tutorialbubble_rope, 0, ((xx + argument2) - 16), (argument1 + 16), 1, ((argument1 / 61) + 1), 0, c_white, 1)
    scr_draw_granny_texture(xx, yy, (argument2 / 96), (argument3 / 96), bgscroll, bgscroll, bg_serverlist, spr_tutorialbubble, argument4, argument5)
    draw_sprite_ext(spr_tutorialbubble, 1, xx, yy, (argument2 / 96), (argument3 / 96), 0, c_white, 1)
}

function anon@2620@gml_Object_obj_serverlist_Create_0(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_anon@2620@gml_Object_obj_serverlist_Create_0
{
    if (argument2 == undefined)
        argument2 = 254
    if (argument3 == undefined)
        argument3 = 30
    if (argument4 == undefined)
        argument4 = 32
    if (argument5 == undefined)
        argument5 = ""
    if (argument6 == undefined)
        argument6 = ""
    var x2 = (argument0 + argument2)
    var y2 = (argument1 + argument3)
    var varprefix = string("textfield{0}", (argument0 * argument1))
    var struct = ds_map_find_value(textboxes, varprefix)
    if (struct == undefined)
    {
        struct = 
        {
            str: argument6,
            sel: 0,
            textline: 0,
            scroll: 0
        }

    }
    var subwaysurfers = surface_create_fix(argument2, argument3)
    surface_set_target(subwaysurfers)
    draw_set_font(gml_Script_lang_get_font("font_small"))
    draw_set_halign(fa_left)
    draw_clear(c_dkgray)
    draw_set_colour(c_black)
    draw_rectangle(1, 1, (argument2 - 2), (argument3 - 2), true)
    draw_set_colour(c_white)
    xx = 0
    yy = 0
    var scrollw = (argument3 < 60 ? struct.scroll : 0)
    var scrollh = (argument3 >= 60 ? struct.scroll : 0)
    for (var i = 1; i <= string_length(struct.str); i++)
    {
        var char = string_char_at(struct.str, i)
        if ((xx + scrollw) >= 0 && (xx + scrollw) <= argument2 && (yy + scrollh) >= 0 && (yy + scrollh) <= argument3)
            draw_text(((xx + 6) + scrollw), ((yy + 6) + scrollh), char)
        xx += string_width(char)
        if (xx >= (argument2 - 16) && argument3 >= 60)
        {
            xx = 0
            yy += 16
        }
    }
    if (struct.str == "" && (!struct.sel))
        draw_text_color((xx + 6), (yy + 6), argument5, c_gray, c_gray, c_gray, c_gray, 0)
    if floor((struct.textline / 20))
    {
        draw_set_font(font0)
        draw_text(((xx + scrollw) + 6), ((yy + 4) + scrollh), "|")
    }
    var hover = (cursor.x >= argument0 && cursor.y >= argument1 && cursor.x < x2 && cursor.y < y2)
    if hover
    {
        if cursor.scrolldown
            struct.scroll -= 16
        if cursor.scrollup
            struct.scroll += 16
    }
    if (!struct.sel)
    {
        if ((mouse_check_button_pressed(mb_left) || cursor.leftclick) && hover)
        {
            cooldown = 2
            struct.textline = 20
            struct.sel = 1
            keyboard_string = struct.str
        }
    }
    if struct.sel
    {
        if (cooldown <= 0)
        {
            if (struct.str != keyboard_string)
            {
                keyboard_string = string_copy(keyboard_string, 1, argument4)
                xx -= (string_width(struct.str) - string_width(keyboard_string))
                struct.scroll = (-xx)
                struct.str = keyboard_string
            }
        }
        else
            cooldown--
        struct.textline = ((struct.textline + 1) % 40)
        if ((mouse_check_button_pressed(mb_left) || cursor.leftclick) && (!hover))
        {
            struct.textline = 0
            struct.sel = 0
        }
    }
    surface_reset_target()
    draw_surface(subwaysurfers, argument0, argument1)
    surface_free(subwaysurfers)
    struct.scroll = clamp(struct.scroll, (-(max((argument3 >= 60 ? ((yy - argument3) + 32) : ((xx - argument2) + 16)), 0))), 0)
    ds_map_set(textboxes, varprefix, struct)
    return struct.str;
}

