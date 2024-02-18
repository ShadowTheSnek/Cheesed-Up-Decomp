var _temp_local_var_3;
if global.performance
    return;
draw = (global.panic && global.laps >= 2)
debris = []
if (global.panic && draw && global.laps > 2)
{
    var count = (min(floor((global.laps / 4)), 4) * (room_width / 960))
    trace(count)
    var _temp_local_var_3 = (count * 8)
    if ((count * 8) <= 0)
    {
    }
    else
    {
        while (true)
        {
            array_push(debris, 
            {
                x: irandom(room_width),
                y: irandom(room_height),
                ang: irandom(360),
                img: irandom(10),
                vsp: 12,
                hsp: random_range(-4, 4)
            }
)
            var _temp_local_var_3 = ((count * 8) - 1)
            if ((count * 8) - 1)
            {
                continue
                break
            }
        }
    }
}
