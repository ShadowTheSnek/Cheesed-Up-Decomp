function __levelinfo(argument0, argument1, argument2) constructor //gml_Script___levelinfo
{
    gate_room = argument0
    john_room = argument1
    name = argument2
}

function level_info(argument0) //gml_Script_level_info
{
    switch argument0
    {
        case "entrance":
            return new __levelinfo(entrance_1, entrance_10, "John Gutter");
        case "medieval":
            return new __levelinfo(medieval_1, medieval_10, "Pizzascape");
        case "ruin":
            return new __levelinfo(ruin_1, ruin_11, "Ancient Cheese");
        case "dungeon":
            return new __levelinfo(dungeon_1, dungeon_10, "Bloodsauce Dungeon");
        case "badland":
            return new __levelinfo(badland_1, badland_9, "Oregano Desert");
        case "graveyard":
            return new __levelinfo(graveyard_1, graveyard_6, "Wasteyard");
        case "farm":
            return new __levelinfo(farm_2, farm_11, "Fun Farm");
        case "saloon":
            return new __levelinfo(saloon_1, saloon_6, "Fast Food Saloon");
        case "plage":
            return new __levelinfo(plage_entrance, plage_cavern2, "Crust Cove");
        case "forest":
            return new __levelinfo(forest_1, forest_john, "Gnome Forest");
        case "space":
            return new __levelinfo(space_1, space_9, "Deep-Dish 9");
        case "minigolf":
            return new __levelinfo(minigolf_1, minigolf_8, "GOLF");
        case "street":
            return new __levelinfo(street_intro, street_john, "The Pig City");
        case "sewer":
            return new __levelinfo(sewer_1, sewer_8, "Oh Shit!");
        case "industrial":
            return new __levelinfo(industrial_1, industrial_5, "Peppibot Factory");
        case "freezer":
            return new __levelinfo(freezer_1, freezer_escape1, "Refrigerator-Refrigerador-Freezerator");
        case "chateau":
            return new __levelinfo(chateau_1, chateau_9, "Pizzascare");
        case "kidsparty":
            return new __levelinfo(kidsparty_1, kidsparty_john, "Don't Make A Sound");
    }

    return -4;
}

