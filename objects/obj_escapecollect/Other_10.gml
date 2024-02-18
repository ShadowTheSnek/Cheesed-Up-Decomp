if (instance_exists(obj_pizzaface) || global.laps < 2 || global.lapmode == (2 << 0))
    return;
if (!instance_exists(obj_wartimer))
{
    switch obj_player1.character
    {
        case "SP":
            global.fill += 6
            break
        case "G":
            global.fill += 9
            break
        default:
            global.fill += 7
            break
    }

}
else
{
    with (obj_wartimer)
    {
        for (seconds += 0.5; seconds >= 60; seconds -= 60)
            minutes++
    }
}
