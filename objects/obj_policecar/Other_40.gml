if (state != states.taxi)
    return;
if (!instance_exists(obj_fadeout))
{
    sound_play("event:/sfx/misc/door")
    with (gml_Script_instance_create(x, y, obj_fadeout))
        roomreset = 1
}
