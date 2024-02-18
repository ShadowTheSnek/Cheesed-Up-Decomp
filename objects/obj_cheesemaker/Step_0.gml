if (floor(image_index) == 3 && madecheese == 0)
{
    gml_Script_instance_create((x + 32), (y + 64), obj_cheeseblob)
    madecheese = 1
}
if (floor(image_index) == (image_number - 1))
    madecheese = 0
