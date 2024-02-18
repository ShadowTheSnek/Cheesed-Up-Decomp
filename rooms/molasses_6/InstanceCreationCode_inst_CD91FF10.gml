function anon@12@gml_RoomCC_molasses_6_5_Create() //gml_Script_anon@12@gml_RoomCC_molasses_6_5_Create
{
    return (place_meeting(x, y, obj_player1) && obj_player1.state == states.freefallland);
}

function anon@131@gml_RoomCC_molasses_6_5_Create() //gml_Script_anon@131@gml_RoomCC_molasses_6_5_Create
{
    secret_open_portalID()
    with (instance_place(x, (y + 1), obj_solid))
        y += 32
    if (!(in_saveroom(other.id, other.flags.saveroom)))
    {
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = (40 / room_speed)
        }
        sound_play_centered("event:/sfx/misc/breakblock")
        sound_play_centered("event:/sfx/misc/breakmetal")
        with (instance_place(x, y, obj_player1))
            y += 32
        if global.gameplay
        {
            fmod_event_instance_set_parameter(global.snd_secretwall, "state", (check_char("SP") || check_char("SN")), 0)
            fmod_event_instance_play(global.snd_secretwall)
        }
    }
    var lay_id = layer_get_id("Tiles_6")
    layer_y(lay_id, 32)
}

