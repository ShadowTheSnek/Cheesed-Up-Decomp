if (playerid != noone)
{
    with (playerid)
    {
        if (floor(image_index) >= 9)
        {
            if (global.noisejetpack == 1)
            {
                sound_play_3d("event:/sfx/misc/cow", x, y)
                global.noisejetpack = 0
            }
        }
        if (floor(image_index) == (image_number - 1))
        {
            state = states.normal
            landAnim = 0
            with (other)
            {
                playerid = -4
                if (!in_saveroom())
                {
                    add_saveroom()
                    global.collect += 1000
                    global.combotime = 60
                    with (gml_Script_instance_create(x, y, obj_smallnumber))
                        number = string(1000)
                }
            }
        }
    }
}
if (sprite_index == spr_freemilksuprised && floor(image_index) == (image_number - 1))
    sprite_index = spr_freemilk
