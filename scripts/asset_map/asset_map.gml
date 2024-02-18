global.SPRITES = ds_map_create()
var i = 0
while sprite_exists(i)
{
    ds_map_set(global.SPRITES, sprite_get_name(i), i)
    i++
}
global.OBJECTS = ds_map_create()
i = 0
while object_exists(i)
{
    ds_map_set(global.OBJECTS, object_get_name(i), i)
    i++
}
