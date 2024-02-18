with (other)
{
    if (state == states.debugstate)
        return;
    if (state == states.backtohub || instance_exists(obj_backtohub_fadeout))
        return;
    if instance_exists(obj_jumpscare)
        return;
    var hall = other
    if (!other.savedposition)
    {
        other.savedposition = 1
        other.savedx = x
        other.savedy = y
    }
    x = other.savedx
    y = other.savedy
    if (!instance_exists(obj_fadeout))
    {
        set_lastroom()
        targetDoor = hall.targetDoor
        targetRoom = hall.targetRoom
        hallway = 1
        hallwaydirection = hall.image_xscale
        if hall.compatibility
        {
            oldHallway = 1
            player_x = hall.target_x
            player_y = hall.target_y
        }
        hall.visited = 1
        sound_play("event:/sfx/misc/door")
        with (gml_Script_instance_create(x, y, obj_fadeout))
        {
            offload_arr = hall.offload_arr
            group_arr = hall.group_arr
        }
        if (room == targetRoom)
        {
            if hall.sameroom
                xscale *= -1
            obj_fadeout.roomreset = 1
        }
    }
}
