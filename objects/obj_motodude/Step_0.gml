image_speed = 0.35
if (stationned == 0)
    hsp = (image_xscale * 6)
xscale = image_xscale
if (vsp > 0 && grounded)
{
    with (check_slope(x, (y + 16)))
    {
        if (other.y <= (y - 20) && other.image_xscale == sign(image_xscale) && (!(check_solid((x + sign(image_xscale)), y))))
        {
            other.vsp = -11
            other.sprite_index = spr_pizzacar_jump
            other.image_index = 0
        }
    }
}
if (stationned == 0)
{
    if (spewcrap > 0)
        spewcrap--
    if (spewcrap == 0)
    {
        gml_Script_instance_create(x, y, obj_smokingprojectile)
        spewcrap = 100
    }
}
if ((check_solid((x + sign(hsp)), y) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(check_slope((x + sign(hsp)), y))))
    image_xscale *= -1
instance_destroy(instance_place((x + hsp), y, obj_destructibles))
switch sprite_index
{
    case spr_pizzacar_jump:
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_pizzacar_fall
        break
    case spr_pizzacar_fall:
        if (grounded && vsp > 0)
        {
            sprite_index = spr_pizzacar_land
            image_index = 0
        }
        break
    case spr_pizzacar_land:
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_pizzacar_move
        break
    default:
        if ((!grounded) && vsp > 0)
            sprite_index = spr_pizzacar_fall
}

