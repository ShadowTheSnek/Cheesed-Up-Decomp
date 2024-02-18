function draw_self_safe() //gml_Script_draw_self_safe
{
    if sprite_exists(sprite_index)
        draw_self()
}

function draw_sprite_safe(argument0, argument1, argument2, argument3) //gml_Script_draw_sprite_safe
{
    if sprite_exists(argument0)
        draw_sprite(argument0, argument1, argument2, argument3)
}

