if (sprite_index != spr_rattumbleblock && other.rat && other.sprite_index != spr_dynamiteexplosion)
{
    if other.baddie
        notification_push((34 << 0), [room])
    instance_destroy()
}
