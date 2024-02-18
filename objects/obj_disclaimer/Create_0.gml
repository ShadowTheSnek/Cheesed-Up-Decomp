var e;
state = states.normal
are_you_sure = 0
fade_alpha = 1
crash_image = -4
crash_msg = -4
if (!variable_global_exists("input_list"))
    scr_initinput()
function anon@210@gml_Object_obj_disclaimer_Create_0() //gml_Script_anon@210@gml_Object_obj_disclaimer_Create_0
{
    var file = file_text_open_write("first_boot")
    file_text_write_string(file, "Delete this file to trigger the savefile porting menu\n")
    file_text_close(file)
}

if file_exists("firstboot")
{
    file_delete("firstboot")
    self.make_firstboot_file()
}
count = 0
pto_textbox_init()
image_speed = 0.35
menu = 0
sel = 0
options = -4
saves = array_create(3, -4)
selected = [0, 0, 0, 0]
pizzashift = [0, 0]
size = 0
surf = -4
t = 0
outback = animcurve_get_channel(curve_menu, "outback")
incubic = animcurve_get_channel(curve_menu, "incubic")
req = -1
net = os_is_network_connected(1)
str = "This is an anti-leaking measure.\n\nPlease connect to the internet to continue.\nYou may have the game blocked on your firewall."
if file_exists("crash_log.txt")
{
    file = buffer_load("crash_log.txt")
    @@try_hook@@(932, 1004)
    crash_msg = json_parse(buffer_read(file, buffer_text))
    draw_set_font(gml_Script_lang_get_font("creditsfont"))
    text = scr_compile_icon_text("{u}Press [c] to play/")
    crash_image = sprite_add("crash_img.png", 1, false, false, 0, 0)
    menu = 3
    @@try_unhook@@()
    buffer_delete(file)
}
else
{
    net = 1
    state = states.dynamite
    are_you_sure = 1
}
