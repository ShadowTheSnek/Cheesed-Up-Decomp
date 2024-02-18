global.roommessage = "STOP, DROP, AND ROLL"
with (obj_rockblock)
{
    if (x < 2500 && (!(in_saveroom(id, global.escaperoom))))
        add_saveroom(id, global.escaperoom)
}
with (obj_destructiblerockblock)
{
    if (x < 2500 && (!(in_saveroom(id, global.escaperoom))))
        add_saveroom(id, global.escaperoom)
}
