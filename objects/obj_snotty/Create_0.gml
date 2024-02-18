depth = 0
if is_holiday((1 << 0))
{
    instance_destroy()
    with (gml_Script_instance_create(x, y, obj_halloweennpc))
    {
        sprite_index = spr_snottyghost
        image_alpha = 0.6
    }
}
