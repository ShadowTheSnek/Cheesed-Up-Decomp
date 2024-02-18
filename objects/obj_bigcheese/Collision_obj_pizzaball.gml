if (state != states.throwing && (other.hsp != 0 || other.thrown || other.state == states.tumble))
{
    pizzaball = 1
    golfid = other.id
    shot = 0
    state = states.throwing
    other.bigcheeseID = id
    other.sprite_index = spr_pizzaball_roll
    sprite_index = spr_bigcheese_throw
    image_index = 0
    depth = -10
}
