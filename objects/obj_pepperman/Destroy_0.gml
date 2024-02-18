if (elitehit <= 0 && pizzahead && destroyable)
{
    instance_create_unique(0, 0, obj_viginoiseyspawner)
    with (instance_create_unique((room_width / 4), (room_height + 100), obj_vigilanteboss))
    {
        with (obj_bosscontroller)
        {
            boss_hpsprite = spr_bossfight_vigiHP
            boss_palette = spr_bossfight_vigipalette
        }
        instance_destroy(spotlightID)
        pizzahead = 1
        flickertime = 0
        state = states.pizzaheadjump
        sprite_index = spr_playerV_hurt
        image_index = 0
        image_speed = 0.35
        hsp = 0
        vsp = -18
        elitehit = 4
        prevhp = elitehit
        destroyable = 1
        vigilante_start_attack(0, 5)
        vigilante_add_attack(0, 5, (1 << 0))
        vigilante_add_attack(0, 5, (1 << 0))
        vigilante_add_attack(0, 5, (9 << 0), 25)
        vigilante_add_attack(0, 5, (0 << 0), 5)
        vigilante_add_attack(0, 5, (0 << 0), 5)
        vigilante_add_attack(0, 5, (8 << 0), 20)
        vigilante_start_attack(0, 6)
        vigilante_add_attack(0, 6, (1 << 0))
        vigilante_add_attack(0, 6, (1 << 0))
        vigilante_add_attack(0, 6, (9 << 0), 25)
        vigilante_add_attack(0, 6, (0 << 0), 5)
        vigilante_add_attack(0, 6, (0 << 0), 5)
        vigilante_add_attack(0, 6, (8 << 0), 20)
        vigilante_start_attack(0, 7)
        vigilante_add_attack(0, 7, (6 << 0))
        vigilante_add_attack(0, 7, (8 << 0), 20)
        vigilante_add_attack(0, 7, (5 << 0))
        vigilante_add_attack(0, 7, (4 << 0), 200)
        vigilante_add_attack(0, 7, (9 << 0), 25)
        vigilante_start_attack(0, 8)
        vigilante_add_attack(0, 8, (1 << 0))
        vigilante_add_attack(0, 8, (1 << 0))
        vigilante_add_attack(0, 8, (9 << 0), 25)
        vigilante_add_attack(0, 8, (1 << 0))
        vigilante_add_attack(0, 8, (1 << 0))
        vigilante_add_attack(0, 8, (8 << 0), 20)
        vigilante_start_attack(0, 9)
        vigilante_add_attack(0, 9, (5 << 0))
        vigilante_add_attack(0, 9, (8 << 0))
        vigilante_add_attack(0, 9, (9 << 0), 25)
    }
}
event_inherited()
