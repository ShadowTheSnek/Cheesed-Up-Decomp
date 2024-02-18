if variable_global_exists("sound_map")
    return;
banks = [
{
    eventPath: "data\\sound\\Master.strings.bank",
    handle: -4
}
, 
{
    eventPath: "data\\sound\\Master.bank",
    handle: -4
}
, 
{
    eventPath: "data\\sound\\music.bank",
    handle: -4
}
, 
{
    eventPath: "data\\sound\\sfx.bank",
    handle: -4
}
]
trace("Loading FMOD Banks...")
for (var i = 0; i < array_length(banks); i++)
{
    var b = banks[i].eventPath
    banks[i].handle = fmod_bank_load(b)
    if (banks[i].handle == -4)
        show_message(concat("Failed to load ", b, "\nIt may be corrupted."))
    else if (!fmod_bank_load_sample_data(banks[i].handle))
        show_message(concat("Couldn't load sample data for ", b))
    else
        trace(string("Loaded Bank: \"{0}\" with id: {1}", b, banks[i].handle))
}
global.sound_map = ds_map_create()
global.steam_api = 0
global.screenshotcount = 0
