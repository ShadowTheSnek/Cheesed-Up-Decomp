visible = false
x = -10000
y = -10000
scr_init_input()
global.coop = 0
if (!global.coop)
{
    obj_player1.spotlight = 1
    state = states.titlescreen
}
