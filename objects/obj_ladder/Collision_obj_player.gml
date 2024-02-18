with (other)
{
    if (key_up && ladderbuffer == 0 && (state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.punch || state == states.shotgunjump || state == states.jump || state == states.highjump || state == (308 << 0)))
    {
        if global.gameplay
            smoothx = (x - (other.x + 16))
        input_buffer_jump = 0
        state = states.ladder
        x = (other.x + 16)
        y = floor(y)
        if ((y % 2) == 1)
            y -= 1
    }
    if (key_up && ladderbuffer == 0 && (state == states.ratmountjump || state == states.ratmountbounce || state == states.ratmount))
    {
        if global.gameplay
            smoothx = (x - (other.x + 16))
        input_buffer_jump = 0
        state = states.ratmountladder
        if (brick == 1)
        {
            with (gml_Script_instance_create(x, y, obj_brickcomeback))
            {
                wait = 1
                create_particle(x, y, (9 << 0))
            }
        }
        brick = 0
        x = (other.x + 16)
        y = floor(y)
        if ((y % 2) == 1)
            y -= 1
    }
}
