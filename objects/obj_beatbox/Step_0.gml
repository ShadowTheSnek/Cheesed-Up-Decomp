scr_collide()
sound_instance_move(snd, x, y)
if (obj_player1.sprite_index != obj_player1.spr_breakdance)
{
    create_particle(x, y, (9 << 0))
    instance_destroy()
}
