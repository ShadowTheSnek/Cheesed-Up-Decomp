if in_saveroom()
    instance_destroy()
if check_char("V")
{
    if (check_solid((x - 1), y) && check_solid((x + 1), y))
        instance_destroy(id, false)
}
