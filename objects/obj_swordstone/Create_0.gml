image_index = 0.35
if (room == rm_editor)
{
    if check_solid(x, (y + 32))
    {
        while (!(check_solid(x, (y + 1))))
            y += 1
    }
}
if (room == rm_editor)
    return;
skip = 0
with (obj_player1)
{
    if (character == "V" || isgustavo || character == "S")
        other.skip = 1
}
if (!skip)
{
    with (gml_Script_instance_create(x, (y - 20), obj_grabmarker))
    {
        ID = other.id
        other.ID = id
    }
}
depth = 10
