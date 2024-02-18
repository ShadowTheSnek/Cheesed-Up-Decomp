if ((!(is_holiday((1 << 0)))) || global.panic || pumpkinroom == -4)
{
    instance_destroy()
    return;
}
if (!(quick_ini_read_real("", "halloween", pumpkinroom, 0)))
    instance_destroy()
