event_inherited()
scr_pizzaface_init_sounds()
on_y = 0
skipintro = 0
superslambuffer = 0
attackbuffer = 120
floatdir = 1
facepart_count = 4
baddie_arr = [[obj_cheeseslime, spr_slimestun], [obj_forknight, spr_forknight_stun], [obj_badrat, spr_badrat_stun], [obj_banditochicken, spr_banditochicken_stun], [obj_spitcheese, spr_spitcheese_stun], [obj_ninja, spr_ninja_stun], [obj_minijohn, spr_minijohn_stun], [obj_minijohn, spr_minijohn_stun], [obj_minijohn, spr_minijohn_stun], [obj_minijohn, spr_minijohn_stun]]
nosespit = 1
nosecount = 1
bighitbox = gml_Script_instance_create(x, y, obj_pizzafacehitbox)
bighitbox.baddieID = id
baddie_range = 1
pizzahead = 0
spotlightID = -4
parryable = 0
flameID = -4
playerhit = 0
introbuffer = 80
introstate = states.normal
important = 1
stompable = 0
shakestun = 0
killbyenemy = 0
elite = 1
elitehit = 8
prevhp = elitehit
turned = 0
wastedhits = 0
sprite_index = spr_pizzaface
state = states.arenaintro
introbuffer = 80
hitboxID = -4
attackspeed = 0
hitboxID = -4
destroyable = 0
idle_max = 240
idle_timer = idle_max
grav = 0.5
hsp = 0
vsp = 0
stunned = 0
alarm[0] = 150
roaming = 1
collectdrop = 5
flying = 0
straightthrow = 0
cigar = 0
cigarcreate = 0
stomped = 0
shot = 0
reset = 0
flash = 0
landspr = spr_pizzaface
idlespr = spr_pizzaface
fallspr = spr_pizzaface
stunfallspr = spr_pizzaface_stun
walkspr = spr_pizzaface
turnspr = spr_pizzaface
recoveryspr = spr_pizzaface_stun
grabbedspr = spr_pizzaface_stun
scaredspr = spr_pizzaface
ragespr = spr_pizzaface
hp = 1
slapped = 0
grounded = 1
birdcreated = 0
boundbox = 0
spr_dead = spr_pizzaface_stun
important = 0
heavy = 1
paletteselect = 0
spr_palette = palette_cheeseslime
grabbedby = 0
stuntouchbuffer = 0
scaredbuffer = 0
cooldown = 40
phase = 1
dir = 1
woosh = 0
flickertime = 0
touchedground = 0
cowcrate = 0
mask_index = spr_player_mask
