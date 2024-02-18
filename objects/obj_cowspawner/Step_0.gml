if spawn
{
    if (spawnbuffer > 0)
        spawnbuffer--
    else
    {
        spawnbuffer = spawnmax
        with (gml_Script_instance_create(x, y, obj_cowstampede))
            image_xscale = other.image_xscale
    }
    if (alarm[0] <= 20)
    {
        with (obj_ladderhorizontal)
            blink = 1
    }
}
