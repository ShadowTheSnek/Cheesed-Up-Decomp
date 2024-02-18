if (!global.MOD.DeathMode)
    active = 0
if ((!active) || room == rank_room || room == timesuproom || (global.laps >= 2 && global.lapmode == (2 << 0)))
    return;
var stop = 0
with (obj_player)
{
    if (state == states.taxi || state == states.victory || state == states.keyget || state == states.gottreasure || state == states.door || state == (292 << 0))
        stop = 1
}
if (show_time > 0)
    show_time--
else if (time > 0)
{
    if (!stop)
        time--
    var exists = 0
    with (obj_pizzaface)
    {
        if (mode > -1)
            exists = 1
    }
    if (!exists)
        gml_Script_instance_create(obj_player1.x, obj_player1.y, obj_pizzaface)
}
if (time <= 0)
{
    time = 0
    global.prank_cankillenemy = 0
    global.prank_enemykilled = 0
}
if (time_fx_y > 0)
    time_fx_y--
ybump = lerp(ybump, 0, 0.5)
if (time_fx > 0)
{
    var spd = max(((time_fx / 10) * 0.25), 0.2)
    time += (60 * spd)
    time_fx -= spd
    time_fx_y = 15
    if (frac(time_fx) == 0)
        ybump = -4
    if (check_char("G") || check_char("V"))
        time += (15 * spd)
}
var tgt_y = 0
if (show_time > 0)
    tgt_y = 60
surfy = Approach(surfy, tgt_y, 3)
surfscale = ((surfy / 100) * 0.5)
