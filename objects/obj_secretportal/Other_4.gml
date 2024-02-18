if global.snickchallenge
{
    instance_destroy()
    return;
}
var _start = 0
with (obj_player)
{
    if (object_index != obj_player2 || global.coop)
    {
        if (targetDoor == "S" && (secretportalID == -4 || secretportalID == other.ID))
        {
            secretportalID = -4
            if (!instance_exists(obj_secretportalstart))
            {
                x = other.x
                y = other.y
                roomstartx = x
                roomstarty = y
                with (obj_followcharacter)
                {
                    x = other.x
                    y = other.y
                }
                with (obj_pizzaface)
                {
                    x = other.x
                    y = other.y
                }
                _start = 1
                other.sprite_index = other.spr_close
                other.image_index = 0
                instance_destroy(other)
                with (gml_Script_instance_create(x, y, obj_secretportalstart))
                {
                    active = 1
                    visible = true
                }
            }
        }
    }
}
if in_saveroom()
{
    active = 0
    sprite_index = spr_close
    visible = false
    if (!_start)
        instance_destroy(instance_place(x, y, obj_frontcanongoblin_trigger))
    trace("portal active: false")
}
