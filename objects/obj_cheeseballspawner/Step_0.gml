refresh--
if (sprite_index != spr_giantslimethrow)
{
    if (refresh <= 0 && distance_to_pos(x, y, obj_player.x, obj_player.y, 400, 400))
    {
        sprite_index = spr_giantslimethrow
        image_index = 0
        shot = 0
    }
}
else if ((!shot) && floor(image_index) == 1)
{
    sound_play_3d("event:/sfx/enemies/burp", x, y)
    sound_play_3d("event:/sfx/enemies/projectile", x, y)
    with (gml_Script_instance_create((x + (10 * image_xscale)), (y - 6), obj_cheeseball))
    {
        image_xscale = other.image_xscale
        vsp = -5
    }
    shot = 1
}
else if (floor(image_index) == (image_number - 1))
{
    sprite_index = spr_giantslime
    refresh = 100
}
