if (state == states.revolver)
    return;
bgscroll -= 0.35
self.draw_box(32, 64, 480, 444)
self.draw_box(540, 396, ((obj_screensizer.actual_width - 540) - 32), 112, -512, -332)
self.draw_box(540, 64, ((obj_screensizer.actual_width - 540) - 32), 320, -512)
var def = serverlist.username
serverlist.username = self.draw_textfield(604, 422, undefined, undefined, undefined, "Username", def)
if self.uname_check(serverlist.username)
    gml_Script_instance_create(0, 0, obj_softlockcrash)
draw_set_font(gml_Script_lang_get_font("creditsfont"))
draw_set_color(c_white)
draw_set_align(1)
draw_text(272, 18, "Server List")
draw_text(736, 18, "Direct Connect")
if (!surface_exists(surffinal))
    surffinal = surface_create_fix(480, 441)
else
    surface_resize(surffinal, 480, 441)
surface_set_target(surffinal)
draw_clear_alpha(c_black, 0)
var hoverable = point_in_rectangle(cursor.x, cursor.y, 32, 64, 512, 508)
var yy = 0
draw_set_align()
for (var i = 0; i < (array_length(officialservers) + array_length(serverlist.servers)); i++)
{
    var official = 0
    if (i < array_length(officialservers))
    {
        var s = officialservers[i]
        official = 1
    }
    else
        s = serverlist.servers[(i - array_length(officialservers))]
    var txt = s.name
    var w = (string_width(txt) + 64)
    yy = (16 + (80 * i))
    var button = self.drawbutton(16, (yy + listscroll), w, 72, hoverable, -32, -66)
    draw_text(50, ((20 + yy) + listscroll), txt)
    if button
    {
        if ((mouse_check_button_pressed(mb_right) || cursor.rightclick) && (!official))
            array_delete(serverlist.servers, (i - array_length(officialservers)), 1)
        if (mouse_check_button_pressed(mb_left) || cursor.leftclick)
        {
            sound_play_centered("event:/sfx/ui/step")
            if (serverlist.username == "")
                message_show("INPUT A USERNAME!")
            else
            {
                state = states.revolver
                event_user(0)
                show_message("Unfinished!")
            }
        }
    }
}
surface_reset_target()
draw_surface(surffinal, 32, 66)
if hoverable
{
    if cursor.scrolldown
        listscroll_true -= 42
    if cursor.scrollup
        listscroll_true += 42
}
listscroll_true = clamp(listscroll_true, ((-yy) + 348), 0)
listscroll = lerp(listscroll, listscroll_true, 0.5)
var server_name = self.draw_textfield(604, 116, undefined, undefined, 15, "Server Name")
var server_ip = self.draw_textfield(604, 148, undefined, undefined, 64, "IP")
var server_port = self.draw_textfield(604, 180, undefined, undefined, undefined, "Port", "6666")
if (self.drawbutton(568, 242, 200, 72, undefined, undefined, undefined, "Connect") == 2)
{
    sound_play_centered("event:/sfx/ui/step")
    if (server_port == "")
        server_port = "6666"
    if (server_ip == "" || (string_pos(".", server_ip) == 0 && server_ip != "localhost"))
        message_show("INVALID IP!")
    else if (serverlist.username == "")
        message_show("INPUT A USERNAME!")
    else
    {
        state = states.revolver
        event_user(0)
        show_message("Unfinished!")
    }
}
if (self.drawbutton(780, 242, 116, 72, undefined, undefined, undefined, "Add") == 2)
{
    sound_play_centered("event:/sfx/ui/step")
    if (server_name == "")
        server_name = server_ip
    if (server_port == "")
        server_port = "6666"
    if (server_ip == "" || (string_pos(".", server_ip) == 0 && server_ip != "localhost"))
        message_show("INVALID IP!")
    else
        self.add_server(server_ip, server_port, server_name, 0)
}
if loading
{
    image_angle += 5
    draw_sprite_ext(spr_loading, 0, 480, 270, 1, 1, image_angle, c_white, 1)
}
if cursor.active
    draw_sprite(spr_fakecursor, 0, cursor.x, cursor.y)
