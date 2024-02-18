if (sprite_index == spr_arenadoor_open)
{
    if (floor(image_index) == 4 && (!shot))
    {
        gml_Script_instance_create(x, y, objectlist[wave][count])
        shot = 1
    }
    if (floor(image_index) == (image_number - 1))
    {
        count++
        alarm[0] = 10
        sprite_index = spr_arenadoor
    }
}
