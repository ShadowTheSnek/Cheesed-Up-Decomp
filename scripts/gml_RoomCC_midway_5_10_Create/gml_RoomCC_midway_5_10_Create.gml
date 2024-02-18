if (!global.gameplay)
    instance_destroy()
flags.do_once = 0
flags.do_save = 0
function anon@97@gml_RoomCC_midway_5_10_Create() //gml_Script_anon@97@gml_RoomCC_midway_5_10_Create
{
    with (obj_player)
    {
        if (place_meeting(x, y, other) && (sprite_index == spr_mach2jump || sprite_index == spr_playerBN_grindJump) && state == states.mach2 && vsp < 0 && xscale == 1)
            return id;
    }
    return 0;
}

function anon@342@gml_RoomCC_midway_5_10_Create(argument0) //gml_Script_anon@342@gml_RoomCC_midway_5_10_Create
{
    argument0.state = states.mach3
    argument0.sprite_index = argument0.spr_mach4
    argument0.movespeed = max(argument0.movespeed, 10)
}

