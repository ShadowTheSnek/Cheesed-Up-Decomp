y -= vsp
x += (hsp * image_xscale)
hsp = Approach(hsp, 6, 0.1)
vsp = Approach(vsp, 12, 0.1)
if instance_exists(obj_mort)
{
    instance_destroy()
    create_particle(x, y, (9 << 0))
}
