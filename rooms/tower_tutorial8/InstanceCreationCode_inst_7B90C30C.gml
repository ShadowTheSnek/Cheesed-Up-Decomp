targetRoom = tower_tutorial9
if (check_char("S") || check_char("V") || check_char("SN"))
{
    instance_destroy(obj_doorB)
    targetDoor = "C"
    targetRoom = tower_tutorial10
}
