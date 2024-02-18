depth = -100
function anon@48@gml_Object_obj_worldportal_Step_0(argument0) //gml_Script_anon@48@gml_Object_obj_worldportal_Step_0
{
    obj_player1.x += argument0
    with (obj_camera)
    {
        camx += (argument0 - ((camx_real - camx) / 2))
        event_perform(ev_step, ev_step_normal)
        lock = 1
    }
    with (obj_king)
    {
        xstart += argument0
        x += argument0
    }
    with (obj_parallax)
    {
        var roombgs = room_get_bg_layers()
        for (var i = 0; i < array_length(roombgs); i++)
        {
            var l = roombgs[i]
            l.x += (argument0 % sprite_get_width(l.bg_sprite))
        }
        portal_offset.x -= argument0
        event_perform(ev_step, ev_step_end)
    }
    with (obj_petfollow)
    {
        var array = []
        repeat ds_queue_size(followqueue)
            array_push(array, ds_queue_dequeue(followqueue))
        for (i = 0; i < array_length(array); i++)
        {
            trace(array[i])
            if ((i % 4) == 0)
                ds_queue_enqueue(followqueue, (array[i] + argument0))
            else
                ds_queue_enqueue(followqueue, array[i])
        }
        x += argument0
    }
    with (obj_beatbox)
        x += argument0
    with (obj_notes)
        x += argument0
}

var point = 6784
var cam_x = (obj_player1.x - 480)
if (cam_x > (point + 32))
    self.offset_by((-point))
if (cam_x <= 32)
    self.offset_by(point)
with (obj_camera)
    chargecamera = 0
