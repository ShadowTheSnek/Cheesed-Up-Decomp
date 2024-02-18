if other.cutscene
    return;
var rm = global.leveltorestart
global.levelattempts++
ds_list_clear(global.saveroom)
ds_list_clear(global.baddieroom)
ds_list_clear(global.escaperoom)
clear_particles()
instance_destroy(obj_fadeout)
global.levelreset = 0
scr_playerreset(1)
global.levelreset = 1
other.targetDoor = "A"
other.targetRoom = rm
scr_room_goto(rm)
