music_pos = 0
play = 0
global.leveltorestart = -4
instance_destroy(obj_pigtotal)
music_arr = [["event:/music/soundtest/intro", "Time For A Smackdown - MrSauceman"], ["event:/music/soundtest/pizzadeluxe", "Pizza Deluxe - PostElvis"], ["event:/music/soundtest/funiculi", "funiculi funicula - ClascyJitto"], ["event:/music/soundtest/pizzatime", "It's Pizza Time! - MrSauceman"], ["event:/music/soundtest/lap", "The Death That I Deservioli - MrSauceman"], ["event:/music/soundtest/mondays", "Mondays - MrSauceman"], ["event:/music/soundtest/unearthly", "Unearthly Blues - MrSauceman"], ["event:/music/soundtest/hotspaghetti", "Hot Spaghetti - MrSauceman"], ["event:/music/soundtest/coldspaghetti", "Cold Spaghetti - MrSauceman"], ["event:/music/soundtest/theatrical", "Theatrical Shenanigans - MrSauceman"], ["event:/music/soundtest/putonashow", "Put On A Show!! - ClascyJitto"], ["event:/music/soundtest/dungeon", "Dungeon Freakshow - ClascyJitto"], ["event:/music/soundtest/pepperman", "Pepperman Strikes! - MrSauceman"], ["event:/music/soundtest/tuesdays", "Tuesdays - MrSauceman"], ["event:/music/soundtest/oregano", "Oregano Desert - ClascyJitto"], ["event:/music/soundtest/ufo", "Oregano UFO - ClascyJitto"], ["event:/music/soundtest/tombstone", "Tombstone Arizona - MrSauceman"], ["event:/music/soundtest/mort", "Mort's Farm - ClascyJitto"], ["event:/music/soundtest/kidsmenu", "What's On The Kid's Menu? - ClascyJitto"], ["event:/music/soundtest/yeehaw", "Yeehaw Deliveryboy - ClascyJitto"], ["event:/music/soundtest/vigilante", "Calzonification - MrSauceman"], ["event:/music/soundtest/wednesdays", "Wednesdays - ClascyJitto"], ["event:/music/soundtest/tropical", "Tropical Crust - MrSauceman"], ["event:/music/soundtest/forest1", "mmm yess put the tree on my pizza - ClascyJitto"], ["event:/music/soundtest/gustavo", "gustavo - ClascyJitto"], ["event:/music/soundtest/forest2", "Wudpecker - ClascyJitto"], ["event:/music/soundtest/goodeatin", "Good Eatin' - ClascyJitto"], ["event:/music/soundtest/extraterrestial", "Extraterrestial Wahwahs - MrSauceman"], ["event:/music/soundtest/noise", "Pimpin' Hot Stuff - MrSauceman"], ["event:/music/soundtest/thursdays", "Thursdays - ClascyJitto"], ["event:/music/soundtest/tubular", "Tubular Trash Zone - MrSauceman"], ["event:/music/soundtest/engineer", "Pizza Engineer - MrSauceman"], ["event:/music/soundtest/saucemachine", "Peppino's Sauce Machine - MrSauceman"], ["event:/music/soundtest/bitethecrust", "Bite The Crust - MrSauceman"], ["event:/music/soundtest/wayoftheitalian", "Way of the Italian - MrSauceman"], ["event:/music/soundtest/preheat", "dont preheat your oven - ClascyJitto"], ["event:/music/soundtest/celsius", "Celsius Troubles - ClascyJitto"], ["event:/music/soundtest/plains", "On the Rocks - MrSauceman"], ["event:/music/soundtest/fakepep", "Pizza Time Never Ends!! - ClascyJitto"], ["event:/music/soundtest/fridays", "Fridays - MrSauceman"], ["event:/music/soundtest/chateau", "There's A Bone In My Spaghetti! - MrSauceman"], ["event:/music/soundtest/tunnely", "Tunnely Shimbers - MrSauceman"], ["event:/music/soundtest/thousand", "Thousand March - MrSauceman"], ["event:/music/soundtest/unexpectancy1", "Unexpectancy, Part 1 - MrSauceman"], ["event:/music/soundtest/unexpectancy2", "Unexpectancy, Part 2 - MrSauceman"], ["event:/music/soundtest/unexpectancy3", "Unexpectancy, Part 3 - MrSauceman"], ["event:/music/soundtest/bye", "Bye Bye There! - MrSauceman"], ["event:/music/soundtest/notime", "Receding Hairline Celebration Party - MrSauceman"], ["event:/music/soundtest/meatphobia", "Meatphobia - MrSauceman"], ["event:/music/soundtest/mayhem", "Pizza Mayhem Instrumental - MrSauceman"], ["event:/music/soundtest/mayhem2", "Pizza Mayhem - MrSauceman"], ["event:/music/w1/entrancesecret", "An Entrance Secret - ClascyJitto"], ["event:/music/w1/medievalsecret", "A Medieval Secret - ClascyJitto"], ["event:/music/w1/dungeonsecret", "A Dungeon Secret - ClascyJitto"], ["event:/music/w1/ruinsecret", "A Ruin Secret - ClascyJitto"], ["event:/music/w2/desertsecret", "A Desert Secret - ClascyJitto"], ["event:/music/w2/farmsecret", "A Farm Secret - ClascyJitto"], ["event:/music/w2/graveyardsecret", "An Undead Secret - ClascyJitto"], ["event:/music/w2/saloonsecret", "A Saloon Secret - ClascyJitto"], ["event:/music/w3/beachsecret", "A Secret in the Sands - ClascyJitto"], ["event:/music/w3/forestsecret", "A Secret in the Trees - ClascyJitto"], ["event:/music/w3/golfsecret", "A Secret Hole in One - ClascyJitto"], ["event:/music/w3/spacesecret", "An Space Secret - ClascyJitto"], ["event:/music/w4/freezersecret", "A Frozen Secret - ClascyJitto"], ["event:/music/w4/industrialsecret", "An Industry Secret - ClascyJitto"], ["event:/music/w4/sewersecret", "A Sewer Secret - ClascyJitto"], ["event:/music/w4/streetsecret", "A Secret In The Streets - ClascyJitto"], ["event:/music/w5/kidspartysecret", "A Secret You Don't Want To Find - ClascyJitto"], ["event:/music/w5/warsecret", "A War Secret - ClascyJitto"]]
index = 0
music_event = fmod_event_create_instance(music_arr[0][0])
