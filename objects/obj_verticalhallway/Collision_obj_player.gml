with (other)
{
    if (state == states.debugstate)
        return;
    if (state == states.backtohub)
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
        var _x = (x - other.x)
        var _percentage = (_x / other.sprite_width)
        vertical_x = _percentage
        verticalhall_vsp = vsp
        set_lastroom()
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        verticalhallway = 1
        vhallwaydirection = sign(other.image_yscale)
        hallway = 0
        other.visited = 1
        sound_play("event:/sfx/misc/door")
        with (gml_Script_instance_create(x, y, obj_fadeout))
        {
            offload_arr = hall.offload_arr
            group_arr = hall.group_arr
        }
    }
    if (state == states.climbwall)
    {
        verticalbuffer = 10
        verticalstate = states.climbwall
        var i = 0
        x = floor(x)
        while (!(scr_solid((x + xscale), y)))
        {
            x += xscale
            i++
            if (i > room_width)
                break
            else
                continue
        }
    }
}
