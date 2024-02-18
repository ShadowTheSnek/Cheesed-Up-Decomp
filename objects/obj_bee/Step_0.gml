switch state
{
    case states.idle:
        scr_bee_idle()
        break
    case (141 << 0):
        scr_bee_chase()
        break
    case (257 << 0):
        scr_bee_bee()
        break
    case (107 << 0):
        scr_bee_hurt()
        break
}

