var r = string_letters(room_get_name(room))
trickytreat = (r == "trickytreat" || r == "trickytreatb")
if (!(is_holiday((1 << 0))))
    instance_destroy(id, false)
if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy(id, false)
if quick_ini_read_real("", "halloween", room_get_name(room), 0)
{
    image_alpha = 0.5
    active = 0
    if (!trickytreat)
        instance_destroy(id, false)
}
