with (other)
{
    if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == states.fireass || state == states.punch || state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.shotgunjump || state == states.jump || state == states.highjump || state == (308 << 0)))
    {
        fmod_event_instance_play(other.snd)
        other.hooked = 1
        hooked = 1
        mach2 = 0
        state = states.ladder
        x = (other.x + 16)
        y = (other.y + 40)
    }
    if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == states.ratmountjump || state == states.ratmountbounce || state == states.ratmount))
    {
        fmod_event_instance_play(other.snd)
        other.hooked = 1
        hooked = 1
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
        y = (other.y + 40)
    }
}
