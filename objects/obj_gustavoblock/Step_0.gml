if (obj_player1.character != "G")
{
    x = xstart
    y = ystart
    image_index = 0
    layer_set_visible("Tiles_G", 0)
    layer_set_visible("Tiles_P", 1)
}
else
{
    x = -100
    y = -100
    image_index = 1
    layer_set_visible("Tiles_G", 1)
    layer_set_visible("Tiles_P", 0)
}
