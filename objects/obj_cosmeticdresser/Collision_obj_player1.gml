var player = other
if (player.key_up2 && (player.state == states.normal || player.state == states.ratmount))
{
    player.key_up2 = 0
    instance_create_unique(0, 0, obj_cosmeticchoice)
}
