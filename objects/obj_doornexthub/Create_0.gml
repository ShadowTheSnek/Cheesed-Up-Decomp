if (!instance_exists(obj_cyop_loader))
{
    ini_open_from_string(obj_savesystem.ini_str)
    if (ini_key_exists("Ranks", "exit") || global.sandbox)
    {
        instance_change(obj_hubelevator, true)
        ini_close()
        return;
    }
    ini_close()
}
event_inherited()
targetDoor = -4
key = 0
save = "w1stick"
unlocked = 0
state = states.normal
depth = 50
