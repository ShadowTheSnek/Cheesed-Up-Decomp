function scr_player_finishingblow() //gml_Script_scr_player_finishingblow
{
    if (character == "SP")
        suplexmove = 0
    hsp = movespeed
    move = (key_right + key_left)
    if (floor(image_index) < 4 && sprite_index != spr_swingdingend)
        movespeed = Approach(movespeed, 0, 1)
    else
        movespeed = Approach(movespeed, ((-xscale) * 4), 0.5)
    if (floor(image_index) == (image_number - 1))
    {
        movespeed = 0
        railmovespeed = 4
        raildir = (-xscale)
        state = states.normal
    }
    if (floor(image_index) == 0 && (!instance_exists(obj_swordhitbox)))
    {
        with (gml_Script_instance_create(x, y, obj_swordhitbox))
            playerid = other.object_index
    }
    image_speed = 0.4
    landAnim = 0
    if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 3)
    {
        with (gml_Script_instance_create(x, y, obj_dashcloud2))
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
    }
    if (punch_afterimage > 0)
        punch_afterimage--
    else
    {
        punch_afterimage = 5
        with (create_blue_afterimage(x, y, sprite_index, image_index, xscale))
        {
            playerid = other.id
            maxmovespeed = 6
        }
    }
}

