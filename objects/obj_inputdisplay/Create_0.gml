version = 2
function anon@30@gml_Object_obj_inputdisplay_Create_0() //gml_Script_anon@30@gml_Object_obj_inputdisplay_Create_0
{
    array_push(inputkeys, 
    {
        x: 0,
        y: 0,
        key: "Z",
        keyw: 1,
        keyh: 1
    }
)
    array_push(inputkeys, 
    {
        x: 1,
        y: 0,
        key: "UP",
        keyw: 1,
        keyh: 1
    }
)
    array_push(inputkeys, 
    {
        x: 2,
        y: 0,
        key: "X",
        keyw: 1,
        keyh: 1
    }
)
    array_push(inputkeys, 
    {
        x: 0,
        y: 1,
        key: "LEFT",
        keyw: 1,
        keyh: 1
    }
)
    array_push(inputkeys, 
    {
        x: 1,
        y: 1,
        key: "DOWN",
        keyw: 1,
        keyh: 1
    }
)
    array_push(inputkeys, 
    {
        x: 2,
        y: 1,
        key: "RIGHT",
        keyw: 1,
        keyh: 1
    }
)
    array_push(inputkeys, 
    {
        x: 0,
        y: 2,
        key: "SHIFT",
        keyw: 2,
        keyh: 1
    }
)
    array_push(inputkeys, 
    {
        x: 2,
        y: 2,
        key: "C",
        keyw: 1,
        keyh: 1
    }
)
    array_push(inputkeys, 
    {
        x: 3,
        y: 2,
        key: "A",
        keyw: 1.5,
        keyh: 1
    }
)
    array_push(inputkeys, 
    {
        x: 3,
        y: 1,
        key: "V",
        keyw: 1.5,
        keyh: 1
    }
)
    keysep = 4
    keysize = 42
    keyalpha = 0.6
    pos[0] = keysep
    pos[1] = ((obj_screensizer.actual_height - (keysize * 3)) - (keysep * 3))
    pressedcol = merge_colour(c_blue, c_aqua, 0.75)
    self.resizekeys()
}

function anon@996@gml_Object_obj_inputdisplay_Create_0() //gml_Script_anon@996@gml_Object_obj_inputdisplay_Create_0
{
    file = file_text_open_write("inputdisplay")
    file_text_write_real(file, version)
    file_text_writeln(file)
    file_text_write_real(file, pos[0])
    file_text_writeln(file)
    file_text_write_real(file, pos[1])
    file_text_writeln(file)
    file_text_write_real(file, keysep)
    file_text_writeln(file)
    file_text_write_real(file, keysize)
    file_text_writeln(file)
    file_text_write_real(file, keyalpha)
    file_text_writeln(file)
    file_text_write_real(file, pressedcol)
    file_text_writeln(file)
    file_text_write_string(file, json_stringify(inputkeys))
    file_text_close(file)
    with (obj_savesystem)
    {
        showicon = 1
        icon_alpha = 2
    }
}

function anon@1708@gml_Object_obj_inputdisplay_Create_0() //gml_Script_anon@1708@gml_Object_obj_inputdisplay_Create_0
{
    file = file_text_open_read("inputdisplay")
    var v = file_text_read_real(file)
    if (v == version)
    {
        file_text_readln(file)
        pos[0] = file_text_read_real(file)
        file_text_readln(file)
        pos[1] = file_text_read_real(file)
        file_text_readln(file)
        keysep = file_text_read_real(file)
        file_text_readln(file)
        keysize = file_text_read_real(file)
        file_text_readln(file)
        keyalpha = file_text_read_real(file)
        file_text_readln(file)
        pressedcol = file_text_read_real(file)
        file_text_readln(file)
        inputkeys = json_parse(file_text_read_string(file))
    }
    else
    {
        show_message("The input display settings have been reset.")
        trace("Inputdisplay version mismatch - v: ", v, " version: ", version)
        self.defaultkeys()
        self.savekeys()
    }
    self.resizekeys()
    file_text_close(file)
}

function anon@2572@gml_Object_obj_inputdisplay_Create_0() //gml_Script_anon@2572@gml_Object_obj_inputdisplay_Create_0
{
    if surface_exists(surf)
        surface_free(surf)
    maxx = 0
    maxy = 0
    var i = 0
    var n = array_length(inputkeys)
    while (i < n)
    {
        var k = inputkeys[i]
        var ughx = (((k.x + k.keyw) * keysize) + (((k.x + k.keyw) - 1) * keysep))
        var ughy = (((k.y + k.keyh) * keysize) + (((k.y + k.keyh) - 1) * keysep))
        maxx = max(maxx, ughx)
        maxy = max(maxy, ughy)
        i++
    }
    maxx++
    maxy++
}

function anon@3009@gml_Object_obj_inputdisplay_Create_0(argument0, argument1, argument2, argument3, argument4) //gml_Script_anon@3009@gml_Object_obj_inputdisplay_Create_0
{
    if (argument4 == undefined)
        argument4 = argument3
    var drawer = argument2
    var pressed = 0
    var xo = 0
    var yo = 0
    switch argument2
    {
        case "SHIFT":
            drawer = 6
            pressed = key_attack
            xo = -1
            yo = -5
            break
        case "Z":
            drawer = 4
            pressed = key_jump2
            yo = -6
            xo = -1
            break
        case "X":
            drawer = 5
            pressed = key_slap
            xo = -6
            yo = -6
            break
        case "C":
            drawer = 7
            pressed = key_taunt
            xo = -2
            break
        case "A":
            drawer = 8
            pressed = key_shoot
            yo = -6
            break
        case "V":
            drawer = 9
            pressed = key_chainsaw
            yo = -5
            break
        case "UP":
            drawer = 0
            pressed = key_up
            xo = -2
            yo = 2
            break
        case "DOWN":
            drawer = 1
            pressed = key_down
            xo = -2
            yo = -2
            break
        case "LEFT":
            drawer = 3
            pressed = (-key_left)
            xo = 2
            yo = -2
            break
        case "RIGHT":
            drawer = 2
            pressed = key_right
            xo = -2
            yo = -2
            break
        default:
            pressed = keyboard_check(scr_keyfromname(argument2))
            break
    }

    draw_set_colour((pressed ? pressedcol : c_silver))
    draw_roundrect(argument0, argument1, ((argument0 + argument3) - 1), ((argument1 + argument4) - 1), 0)
    draw_set_colour(c_black)
    draw_roundrect(argument0, argument1, ((argument0 + argument3) - 1), ((argument1 + argument4) - 1), 1)
    if is_string(drawer)
    {
        draw_set_colour(c_white)
        draw_set_font(gml_Script_lang_get_font("bigfont"))
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        var siz = 1
        var _stringwidth = string_width(drawer)
        siz = ((argument3 - 16) / _stringwidth)
        if (siz > 1)
            siz = max(floor((siz / 2)), 1)
        if (siz != 1)
            draw_text_transformed(floor((argument0 + (argument3 / 2))), floor((argument1 + (argument4 / 2))), drawer, siz, siz, 0)
        else
            draw_text(floor((argument0 + (argument3 / 2))), floor((argument1 + (argument4 / 2))), drawer)
        draw_set_valign(fa_top)
    }
    else
    {
        siz = ((argument3 - 16) / 32)
        if (siz > 1)
            siz = max(floor((siz / 2)), 1)
        draw_sprite_ext(spr_controlicons, drawer, (xo + floor((argument0 + (argument3 / 2)))), (yo + floor((argument1 + (argument4 / 2)))), siz, siz, 0, c_white, 1)
        gpu_set_blendmode(bm_normal)
    }
}

function anon@5192@gml_Object_obj_inputdisplay_Create_0(argument0, argument1) //gml_Script_anon@5192@gml_Object_obj_inputdisplay_Create_0
{
    i = 0
    n = array_length(inputkeys)
    while (i < n)
    {
        k = inputkeys[i]
        var xx = ((k.x * keysize) + (k.x * keysep))
        var yy = ((k.y * keysize) + (k.y * keysep))
        self.draw_inputdisplay_key((argument0 + xx), (argument1 + yy), k.key, ((k.keyw * keysize) + ((k.keyw - 1) * keysep)), ((k.keyh * keysize) + ((k.keyh - 1) * keysep)))
        i++
    }
}

clicktimer = 0
drag = 0
dragoffset = [0, 0]
depth = -10000
surf = -1
inputkeys = []
pos = [0, 0]
if (!file_exists("inputdisplay"))
{
    self.defaultkeys()
    self.savekeys()
}
else
{
    self.loadkeys()
    if (pos[0] < 0 || pos[1] < 0 || (!is_array(inputkeys)) || array_length(inputkeys) == 0)
    {
        trace("Inputdisplay failed loading")
        self.defaultkeys()
        self.savekeys()
    }
}
scr_initinput()
