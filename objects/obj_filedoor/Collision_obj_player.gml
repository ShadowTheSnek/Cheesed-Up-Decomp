var _actor = 0
with (obj_player)
{
    if (state == states.actor)
        _actor = 1
}
if _actor
    return;
with (other)
{
    if (key_up && grounded && ((character != "M" && y == (other.y + 50)) || (character == "M" && y == (other.y + 55))) && (!instance_exists(obj_fadeout)) && state != states.door && state != states.comingoutdoor && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
    {
        if (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep)
        {
            global.currentsavefile = other.file
            set_lastroom()
            obj_camera.chargecamera = 0
            add_saveroom()
            if (object_index == obj_player1)
                obj_player1.sprite_index = obj_player1.spr_lookdoor
            if (object_index == obj_player2)
                obj_player2.sprite_index = obj_player2.spr_lookdoor
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
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
        }
        else if (state == states.bombdelete)
        {
            gml_Script_instance_create(x, y, obj_bombexplosion)
            var str = concat("saveData", other.file, ".ini")
            if file_exists(str)
                file_delete(str)
        }
    }
}
