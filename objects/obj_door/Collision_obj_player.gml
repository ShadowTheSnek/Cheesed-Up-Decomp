if locked
    return;
var _actor = 0
var door = id
with (other)
{
    if (state == states.actor)
        _actor = 1
}
if _actor
    return;
if global.horse
    return;
if (john && global.panic)
    return;
if (!(place_meeting(x, y, obj_doorblocked)))
{
    with (other)
    {
        if (key_up && (!instance_exists(obj_jumpscare)) && grounded && (((state == states.ratmount || state == states.ratmountbounce) && brick) || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && y == (other.y + 50) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != states.door && state != states.comingoutdoor)
        {
            if (room == tower_5 || other.object_index == obj_pumpkindoor)
            {
                if (other.object_index == obj_pumpkindoor)
                {
                    notification_push((59 << 0), [room])
                    global.levelreset = 1
                }
                backtohubroom = room
                backtohubstartx = x
                backtohubstarty = y
            }
            if (room == trickytreat_1)
                notification_push((61 << 0), [room])
            sound_play("event:/sfx/misc/door")
            obj_camera.chargecamera = 0
            add_saveroom()
            if isgustavo
                sprite_index = spr_ratmountenterdoor
            else
                sprite_index = obj_player1.spr_lookdoor
            if global.gameplay
            {
                smoothx = (x - (door.x + (door.sprite_width / 2)))
                x = (door.x + (door.sprite_width / 2))
            }
            set_lastroom()
            targetDoor = door.targetDoor
            targetRoom = door.targetRoom
            image_index = 0
            if (state != states.gotoplayer)
                state = states.door
            mach2 = 0
            if door.compatibility
            {
                oldHallway = 1
                player_x = door.target_x
                player_y = door.target_y
            }
            other.visited = 1
            if (other.sprite_index == spr_doorunvisited_ss)
                other.sprite_index = spr_doorvisited_ss
            if (!in_saveroom(other.id))
                add_saveroom(other.id)
            with (gml_Script_instance_create(x, y, obj_fadeout))
            {
                offload_arr = door.offload_arr
                group_arr = door.group_arr
            }
        }
    }
}
