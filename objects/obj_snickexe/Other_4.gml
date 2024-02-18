hitboxcreate = 0
self.reset_pos(0)
if (((!global.snickchallenge) && (global.laps < 2 || global.lapmode != (2 << 0))) || room == timesuproom || room == rank_room || global.MOD.EasyMode)
    instance_destroy()
