var _actor = 0
with (obj_player)
{
    if (state == states.actor)
        _actor = 1
}
if _actor
    return;
with (other)
{
    if (key_up && grounded && (!instance_exists(obj_option)) && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep))
    {
        gml_Script_instance_create(x, y, obj_option)
        state = states.actor
    }
}
