if (!in_baddieroom())
{
    repeat (6)
    {
        with (gml_Script_instance_create(x, y, obj_sausageman_dead))
        {
            image_speed = 0
            sprite_index = spr_newpizzice_gibs
            image_index = random_range(0, (image_number - 1))
        }
    }
}
event_inherited()
