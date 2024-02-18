if (global.panic == 1)
{
    delay--
    if (delay <= 0)
    {
        gml_Script_instance_create(x, y, obj_icicle)
        delay = 300
    }
}
