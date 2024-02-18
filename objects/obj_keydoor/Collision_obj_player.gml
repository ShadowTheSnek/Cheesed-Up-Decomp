var door = id
var _actor = 0
with (obj_player)
{
    if (state == states.actor)
        _actor = 1
}
if _actor
    return;
if global.horse
    return;
if (!(place_meeting(x, y, obj_doorblocked)))
{
    with (other)
    {
        if (key_up && (!instance_exists(obj_jumpscare)) && grounded && (state == states.normal || state == states.ratmount || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && ((character != "M" && y == (other.y + 50)) || (character == "M" && y == (other.y + 55))) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != states.door && state != states.comingoutdoor)
        {
            if (other.sprite_index == other.spr_open)
            {
                with (obj_player)
                {
                    set_lastroom()
                    targetDoor = door.targetDoor
                    targetRoom = door.targetRoom
                }
                sound_play("event:/sfx/misc/door")
                obj_camera.chargecamera = 0
                add_saveroom()
                sprite_index = spr_lookdoor
                image_index = 0
                state = states.door
                mach2 = 0
                if (instance_exists(obj_player2) && global.coop == 1)
                {
                    if (object_index == obj_player2)
                    {
                        obj_player1.x = obj_player2.x
                        obj_player1.y = obj_player2.y
                    }
                    if (object_index == obj_player1)
                    {
                        obj_player2.x = obj_player1.x
                        obj_player2.y = obj_player1.y
                    }
                }
                other.visited = 1
                gml_Script_instance_create(x, y, obj_fadeout)
                if global.gameplay
                {
                    smoothx = (x - (door.x + 50))
                    x = (door.x + 50)
                }
            }
            else if (global.gameplay && key_up2 && (!global.key_inv))
            {
                sound_play_3d("event:/sfx/misc/keyunlock", x, y)
                instance_destroy(obj_keydoor_shake)
                var xo = sprite_get_xoffset(door.spr_shake)
                var yo = sprite_get_yoffset(door.spr_shake)
                with (gml_Script_instance_create(((door.x + xo) - door.sprite_xoffset), ((door.y + yo) - door.sprite_yoffset), obj_keydoor_shake))
                    sprite_index = door.spr_shake
            }
        }
    }
}
