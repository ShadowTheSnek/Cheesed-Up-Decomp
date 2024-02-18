brown = 1
if sugary
{
    brownfade = 1
    with (gml_Script_instance_create(0, 0, obj_flash))
        depth = (other.depth - 1)
}
