add_baddieroom()
with (gml_Script_instance_create(x, y, content))
{
    if (object_index == obj_pizzagoblinbomb)
        defused = 1
    image_speed = 0.35
    image_xscale = other.image_xscale
    gml_Script_instance_create(x, y, obj_pizzaportalfade)
}
instance_destroy()
