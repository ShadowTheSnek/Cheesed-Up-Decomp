if ((other.state == states.handstandjump || other.state == states.punch) && other.grounded == 1)
{
    gml_Script_instance_create((x + (obj_player1.xscale * 40)), y, obj_punchdust)
    with (other)
    {
        image_index = 0
        sprite_index = spr_haulingstart
        grabbingenemy = 1
        baddiegrabbedID = other.id
        state = states.grab
    }
    playerid = other.object_index
    grabbed = 1
}
if (other.state == states.mach2 || other.state == states.mach3 || (other.state == states.machroll && grounded))
{
    create_particle(x, y, (9 << 0), 0)
    with (other)
    {
        vsp = 0
        mask_index = spr_crouchmask
        x = other.x
        y = other.y
        state = states.barrel
        sprite_index = spr_barrelroll
        movespeed = 12
    }
    instance_destroy()
}
