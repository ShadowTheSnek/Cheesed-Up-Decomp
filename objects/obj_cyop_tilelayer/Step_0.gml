if (tilelayer == noone)
    return;
if (!secrettile)
    return;
if (buffer > 0)
    buffer--
player = noone
var f = method(self, function(argument0, argument1) //gml_Script_anon@124@gml_Object_obj_cyop_tilelayer_Step_0
{
    with (obj_player)
    {
        if rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, argument0.x, argument0.y, (argument0.x + 31), (argument0.y + 31))
            other.player = id
    }
}
)
array_foreach(tilelayer.tiles, f, 0, infinity)
if ((player && player.state != states.chainsaw && player.state != states.backtohub) || active)
{
    if (buffer > 0)
        image_alpha = 0
    if (!revealed)
    {
        revealed = 1
        add_saveroom()
    }
    image_alpha = Approach(image_alpha, 0, 0.1)
}
else if (!((player && player.state == states.chainsaw)))
    image_alpha = Approach(image_alpha, 1, 0.1)
active = 0
