global.roommessage = string_upper(global.roommessage)
if (room != rank_room && room != timesuproom && room != Mainmenu && room != Realtitlescreen && room != Longintro && room != Creditsroom && room != Johnresurrectionroom && room != Endingroom && room != Finalintro && room != Scootertransition && (!is_bossroom()) && room != editor_entrance)
{
    showtext = 1
    alarm[0] = 200
}
else
{
    showtext = 0
    yi = -50
    return;
}
level = 0
var r = string_letters(room_get_name(room))
if (room != tower_soundtest && r != "towertutorial" && r != "towerup" && (string_copy(r, 1, 5) == "tower" || (string_starts_with(r, "streethouse") && global.gameplay)) && (!global.panic))
{
    if string_starts_with(r, "streethouse")
        level = 1
    visible = true
}
else if (global.roomnames && ds_list_find_index(seen_rooms, room) < 0)
{
    level = 1
    ds_list_add(seen_rooms, room)
    if (global.roommessage == msg)
        visible = false
    else
        visible = true
}
else
{
    visible = false
    yi = -50
    showtext = 0
}
msg = global.roommessage
