falling = 0
reset = 100
destroyed = 0
image_speed = 0.35
depth = 0
spr_idle = spr_cheeseblock
spr_dissolve = spr_cheeseblock_die
spr_dead = spr_cheeseblock_falling
spr_reform = spr_cheeseblock_reform
sugary = 0
if (room != sugarytut_2)
{
    sugary = global.SUGARY
    if sugary
    {
        spr_idle = spr_caramel_idle
        spr_dissolve = spr_caramel_dissolve
        spr_dead = spr_caramel_dead
        spr_reform = spr_caramel_alive
        sprite_index = spr_idle
    }
}
