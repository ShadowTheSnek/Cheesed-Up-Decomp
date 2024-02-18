if (!in_saveroom())
{
    if (!(place_meeting(x, y, obj_gnomecustomer)))
    {
        if sugary
        {
            repeat (6)
                create_debris(x, y, spr_confecticage_debris, 0)
        }
        else if (!bo)
        {
            with (create_debris(x, (y - 32), spr_cagedebris, 0))
                image_index = 0
            with (create_debris(x, (y + 32), spr_cagedebris, 0))
                image_index = 1
            with (create_debris((x - 10), y, spr_cagedebris, 0))
                image_index = 2
            with (create_debris(x, y, spr_cagedebris, 0))
                image_index = 3
            with (create_debris((x + 10), y, spr_cagedebris, 0))
                image_index = 4
        }
    }
    add_saveroom()
}
