if (instance_exists(obj_pizzaface) || global.laps < 2 || global.lapmode == (2 << 0))
    return;
if (!instance_exists(obj_wartimer))
{
    switch obj_player1.character
    {
        case "SP":
            global.fill += 30
            break
        case "G":
            global.fill += 36
            break
        default:
            global.fill += 32
            break
    }

}
else
{
    sound_play("event:/sfx/ui/wartimerup")
    with (obj_wartimer)
    {
        addseconds += 5
        alarm[0] = -1
        alarm[2] = 1
    }
}
