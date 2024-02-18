if (sprite_index == spr_caramel_dissolve && image_index > 9)
{
    destroyed = 1
    falling = 1
    x = -100
    y = -100
}
if (floor(image_index) == (image_number - 1))
{
    if (sprite_index == spr_dissolve)
    {
        sprite_index = spr_dead
        destroyed = 1
        falling = 1
        x = -100
        y = -100
    }
    else if (sprite_index == spr_reform)
    {
        falling = 0
        sprite_index = spr_idle
        image_index = 0
    }
}
if (falling && sprite_index == spr_idle)
{
    image_index = 0
    sprite_index = spr_dissolve
}
if (destroyed && reset > 0)
    reset--
if (reset <= 0 && (!(place_meeting(xstart, ystart, obj_player))) && (!(place_meeting(xstart, ystart, obj_pizzaball))) && (!(place_meeting(xstart, ystart, obj_clownmato))) && (!(place_meeting(xstart, ystart, obj_monster))))
{
    reset = 100
    sprite_index = spr_reform
    image_index = 0
    falling = 0
    destroyed = 0
    x = xstart
    y = ystart
}
