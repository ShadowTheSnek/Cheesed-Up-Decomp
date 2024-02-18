if (currentState == (0 << 0))
{
    currentState = (2 << 0)
    sprite_index = spr_Lowering
    if (save_trigger && (!in_saveroom()))
        add_saveroom()
}
