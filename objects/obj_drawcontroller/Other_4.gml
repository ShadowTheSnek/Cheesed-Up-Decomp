if (room != kidsparty_entrance1)
{
    var roomname = room_get_name(room)
    roomname = string_letters(roomname)
    if (room == tower_pizzafacehall || room == tower_5 || room == boss_fakepephallway || roomname == "kidspartyfloor" || roomname == "kidspartyentrance" || roomname == "kidspartybasementsecret" || roomname == "kidspartysecret" || roomname == "streetbacon")
    {
        kidsparty_lightning = 1
        dark_lightning = 0
    }
    else
    {
        kidsparty_lightning = 0
        dark_lightning = 0
    }
}
else
{
    kidsparty_lightning = 0
    dark_lightning = 0
}
if (room == dungeon_5 || room == dungeon_6 || room == strongcold_10 || room == strongcold_9 || room == strongcold_lap || room == sucrose_6 || room == sucrose_6_1 || room == sucrose_7 || room == sucrose_8)
{
    use_dark = 1
    dark_alpha = 1
}
else
    use_dark = 0
if (room == Mainmenu || room == Longintro)
{
    use_dark = 0
    kidsparty_lightning = 0
    dark_lightning = 0
}
