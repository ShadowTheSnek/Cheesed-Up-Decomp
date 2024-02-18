if (room == Titlescreen && obj_player.state == states.titlescreen)
{
    obj_player1.sprite_index = spr_player_machfreefall
    obj_player1.state = states.backbreaker
    obj_player1.movespeed = 6
    obj_player1.vsp = 5
    obj_player1.xscale = 1
    obj_player1.player_x = 50
    obj_player1.player_y = 50
}
if (obj_player.state == states.taxi)
{
    if (!global.pizzadelivery)
    {
        with (gml_Script_instance_create((obj_stopsign.x - (obj_screensizer.actual_width / 2)), obj_stopsign.y, obj_taxidud))
        {
            playerid = obj_player1
            if obj_player1.policetaxi
            {
                obj_player1.policetaxi = 0
                sprite_index = spr_taxicop
            }
        }
    }
    else
    {
        with (gml_Script_instance_create((obj_checkpoint.x - (obj_screensizer.actual_width / 2)), (obj_checkpoint.y - 50), obj_taxidud))
            playerid = obj_player1
        with (obj_player)
        {
            x = obj_checkpoint.x
            y = (obj_checkpoint.y - 50)
        }
    }
}
if (obj_player.state == states.taxi)
{
    with (obj_player)
    {
        visible = true
        state = states.normal
    }
}
if (obj_player.state == (292 << 0))
    gml_Script_instance_create(obj_spaceshuttlestop.x, (camera_get_view_y(view_camera[0]) - 50), obj_spaceshuttletrans)
