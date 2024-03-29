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
            if (other.sprite_index == spr_elevatoropen && other.unlocked)
            {
                set_lastroom()
                sound_play("event:/sfx/misc/door")
                obj_camera.chargecamera = 0
                add_saveroom()
                if (object_index == obj_player1)
                    obj_player1.sprite_index = obj_player1.spr_lookdoor
                if (object_index == obj_player2)
                    obj_player2.sprite_index = obj_player2.spr_lookdoor
                obj_player1.targetDoor = other.targetDoor
                obj_player1.targetRoom = other.targetRoom2
                obj_player2.targetDoor = other.targetDoor
                obj_player2.targetRoom = other.targetRoom2
                obj_player.image_index = 0
                obj_player.state = states.door
                obj_player.mach2 = 0
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
            else if (global.gameplay && key_up2 && (!door.key))
            {
                sound_play_3d("event:/sfx/misc/keyunlock", x, y)
                instance_destroy(obj_keydoor_shake)
                with (gml_Script_instance_create((door.x + 50), (door.y + 50), obj_keydoor_shake))
                    sprite_index = spr_elevatorlocked_shake
            }
        }
    }
}
