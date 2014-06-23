/*--------------------------------------------------------
Default teams. If you make a team above the citizen team, people will spawn with that team!
--------------------------------------------------------*/
TEAM_CITIZEN = AddExtraTeam("Survivor", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group01/Female_01.mdl",
		"models/player/Group01/Female_02.mdl",
		"models/player/Group01/Female_03.mdl",
		"models/player/Group01/Female_04.mdl",
		"models/player/Group01/Female_06.mdl",
		"models/player/group01/male_01.mdl",
		"models/player/Group01/Male_02.mdl",
		"models/player/Group01/male_03.mdl",
		"models/player/Group01/Male_04.mdl",
		"models/player/Group01/Male_05.mdl",
		"models/player/Group01/Male_06.mdl",
		"models/player/Group01/Male_07.mdl",
		"models/player/Group01/Male_08.mdl",
		"models/player/Group01/Male_09.mdl"
	},
	description = [[The survivor is the most basic level of society you can hold
		besides being a hobo.
		You have no specific role in city life.]],
	weapons = {},
	command = "Survivor",
	max = 0,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	mayorCanSetSalary = true
})

TEAM_SCAVENGER = AddExtraTeam("Scavenger", {
	color = Color(221, 151, 151),
	model = {
		"models/player/Group01/Female_01.mdl",
		"models/player/Group01/Female_02.mdl",
		"models/player/Group01/Female_03.mdl",
		"models/player/Group01/Female_04.mdl",
		"models/player/Group01/Female_06.mdl",
		"models/player/group01/male_01.mdl",
		"models/player/Group01/Male_02.mdl",
		"models/player/Group01/male_03.mdl",
		"models/player/Group01/Male_04.mdl",
		"models/player/Group01/Male_05.mdl",
		"models/player/Group01/Male_06.mdl",
		"models/player/Group01/Male_07.mdl",
		"models/player/Group01/Male_08.mdl",
		"models/player/Group01/Male_09.mdl"
	},
	description = [[You wander around the wasteland, your like
		a normal survivor, but you get some guns to survive.]],
	weapons = {"m9k_colt191", "fas2_m24"},
	command = "scavenger",
	max = 3,
	salary = 1,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	scavenger = true,
	mayorCanSetSalary = true,
	customCheck = function(ply)
    return ply:GetUserGroup() == "Member" or ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    
})

TEAM_POLICE = AddExtraTeam("Survival Protection", {
	color = Color(25, 25, 170, 255),
	model = {"models/player/police.mdl", "models/player/police_fem.mdl"},
	description = [[The protector of every survivor that lives in the city .
		You have the power to arrest criminals and protect innocents.
		Hit them with your arrest baton to put them in jail
		Bash them with a stunstick and they might learn better than to disobey
		the law.
		The Battering Ram can break down the door of a criminal with a warrant
		for his/her arrest.
		The Battering Ram can also unfreeze frozen props(if owner of the prop is wanted).
		Type /wanted <name> to alert the public to this criminal
		OR go to tab and warrant someone by clicking the warrant button
		!!You also hunt down the Runners!!]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_colt1911", "stunstick", "door_ram", "weaponchecker"},
	command = "cp",
	max = 6,
	salary = 65,
	admin = 0,
	vote = true,
	hasLicense = true,
	help = {
		"Please don't abuse your job",
		"Hunt down the runners arrest them!",
		"Keep an eye on bandits and thiefs!",
		"When you arrest someone they are auto transported to jail.",
		"They are auto let out of jail after some time",
		"Type /warrant [Nick|SteamID|Status ID] to set a search warrant for a player.",
		"Type /wanted [Nick|SteamID|Status ID] to alert everyone to a wanted suspect",
		"Type /unwanted [Nick|SteamID|Status ID] to clear the suspect",
		"Type /jailpos to set the jail position"
	}
})

TEAM_GANG = AddExtraTeam("Bandit", {
	color = Color(75, 75, 75, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl",
		"models/player/Group03/Female_03.mdl",
		"models/player/Group03/Female_04.mdl",
		"models/player/Group03/Female_06.mdl",
		"models/player/group03/male_01.mdl",
		"models/player/Group03/Male_02.mdl",
		"models/player/Group03/male_03.mdl",
		"models/player/Group03/Male_04.mdl",
		"models/player/Group03/Male_05.mdl",
		"models/player/Group03/Male_06.mdl",
		"models/player/Group03/Male_07.mdl",
		"models/player/Group03/Male_08.mdl",
		"models/player/Group03/Male_09.mdl"},
	description = [[The lowest person of crime.
		A bandit generally works for the Bandit Leader who runs the crime family.
		The Bandit Leader sets your agenda and you follow it or you might be punished.]],
	weapons = {"m9k_luger"},
	command = "gangster",
	max = 5,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false
})

TEAM_MOB = AddExtraTeam("Bandit Leader", {
	color = Color(25, 25, 25, 255),
	model = "models/player/gman_high.mdl",
	description = [[The Bandit leader is the boss of the criminals in the wasteland.
		With his power he coordinates the bandits and forms an efficient crime
		organization.
		He has the ability to break into houses by using a lockpick.
		The Bandit Leader also can unarrest you.]],
	weapons = {"lockpick", "unarrest_stick", "m9k_luger", "m9k_mp40"},
	command = "mobboss",
	max = 1,
	salary = 60,
	admin = 0,
	vote = false,
	NeedToChangeFrom = TEAM_BANDIT,
	hasLicense = false,
	mayorCanSetSalary = false,
	help = {
		"As the Bandit Leader, you decide what you want the other Bandits to do.",
		"You get an Unarrest Stick which you can use to break people out of jail.",
		"/agenda <Message> Sets the Gangsters' agenda. Use // to go to the next line."
	}
})

TEAM_GUN = AddExtraTeam("Gundealer", {
	color = Color(255, 140, 0, 255),
	model = "models/player/monk.mdl",
	description = [[A gundealer is the person who can sell guns to other
		people.
		/Buyshipment <name> to Buy a  weapon shipment
		/Buygunlab to Buy a gunlab that spawns P228 pistols]],
	weapons = {},
	command = "gundealer",
	max = 2,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = true
})

TEAM_MEDIC = AddExtraTeam("Medic", {
	color = Color(47, 79, 79, 255),
	model = "models/player/kleiner.mdl",
	description = [[With your medical knowledge,
		you heal players to proper
		health.
		Without a medic, people cannot be healed.
		Left click with the Medical Kit to heal other players.
		Right click with the Medical Kit to heal yourself.]],
	weapons = {"fas2_ifak"},
	command = "medic",
	max = 5,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false,
	medic = true,
	mayorCanSetSalary = true
})

TEAM_CHIEF = AddExtraTeam("Survival Protection Chief", {
	color = Color(20, 20, 255, 255),
	model = "models/player/combine_soldier_prisonguard.mdl",
	description = [[The Chief is the leader of the Civil Protection unit.
		Coordinate the police force to enforce law in the city.
		Hit them with arrest baton to put them in jail.
		Bash them with a stunstick and they might learn better than to
		disobey the law.
		The Battering Ram can break down the door of a criminal with a
		warrant for his/her arrest.
		Type /wanted <name> to alert the public to this criminal
		Type /jailpos to set the Jail Position
		!!You also hunt down the Runners!!]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_colt191", "m9k_mossberg590", "stunstick", "door_ram", "weaponchecker"},
	command = "chief",
	max = 1,
	salary = 75,
	admin = 0,
	vote = false,
	hasLicense = true,
	chief = true,
	NeedToChangeFrom = TEAM_POLICE,
	help = {
		"Please don't abuse your job",
		"Hunt down the runners and arrest them!",
		"Keep an eye on bandits and thiefs!",
		"When you arrest someone they are auto transported to jail.",
		"They are auto let out of jail after some time",
		"Type /warrant [Nick|SteamID|Status ID] to set a search warrant for a player.",
		"Type /wanted [Nick|SteamID|Status ID] to alert everyone to a wanted suspect",
		"Type /unwanted [Nick|SteamID|Status ID] to clear the suspect",
		"Type /jailpos to set the jail position"
	}
})

TEAM_MAYOR = AddExtraTeam("Governor", {
	color = Color(150, 20, 20, 255),
	model = "models/player/breen.mdl",
	description = [[The Governor of the city creates laws to serve the greater good
	of the people.
	If you are the mayor you may create and accept warrants.
	Type /wanted <name>  to warrant a player
	Type /jailpos to set the Jail Position
	Type /lockdown initiate a lockdown of the city.
	Everyone must be inside during a lockdown.
	The cops patrol the area
	/unlockdown to end a lockdown]],
	weapons = {"m9k_colt191"},
	command = "mayor",
	max = 1,
	salary = 85,
	admin = 0,
	vote = true,
	hasLicense = false,
	mayor = true,
	help = {
		"Type /warrant [Nick|SteamID|Status ID] to set a search warrant for a player.",
		"Type /wanted [Nick|SteamID|Status ID] to alert everyone to a wanted suspect.",
		"Type /unwanted [Nick|SteamID|Status ID] to clear the suspect.",
		"Type /lockdown to initiate a lockdown",
		"Type /unlockdown to end a lockdown",
		"Type /placelaws to place a screen containing the laws.",
		"Type /addlaw and /removelaw to edit the laws."
	}
})

TEAM_HOBO = AddExtraTeam("Hobo", {
	color = Color(80, 45, 0, 255),
	model = "models/player/corpse1.mdl",
	description = [[The lowest member of society. All people see you laugh.
		Beg for your food and money
		Sing for everyone who passes to get money(micspam)
		Make your own wooden home somewhere in a corner or
		outside someone else's door]],
	weapons = {"weapon_bugbait"},
	command = "hobo",
	max = 5,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true,
	mayorCanSetSalary = false
})

//Secret Service
TEAM_SECRETSERVICE = AddExtraTeam("Secret Service", {
	color = Color(15, 255, 111, 255),
	model = "models/player/barney.mdl",
	description = [[Your a secret service, protect mayor at all costs.]],
	weapons = {"arrest_stick", "m9k_colt191", "m9k_mp9"},
	command = "secretservice",
	max = 2,
	salary = 100,
	admin = 0,
	vote = true,
	hasLicense = false,
	mayorCanSetSalary = true
})

//Ninja
TEAM_NINJA = AddExtraTeam("Ninja", {
	color = Color(0, 10, 0, 255),
	model = "models/nikout/dishonored/assassin1.mdl",
	description = [[This class was a poor fighter when he was young,
	    but then he found hes master. Your job is to protect the people from harm by other people and the zombies with your parkour skill and crossbow.
	    	You are not a bad guy who raid or steal, you come from the shadow and helps anyone who is in danger.]],
	weapons = {"weapon_crossbow", "climb_swep2", "fas2_dv2"},
	command = "ninja",
	max = 2,
	salary = 55,
	admin = 0,
	vote = true,
	hasLicense = false,
	candemote = true,
	Ninja = true,
	mayorCanSetSalary = false
})

//Admin
TEAM_ADMIN = AddExtraTeam("Admin on Duty", {
	color = Color(38, 255, 0, 153),
	model = "models/nikout/dishonored/assassin1.mdl",
	description = [[Don't rp as this job.]],
	weapons = {"weapon_nautilus", "fas2_dv2", "stunstick", "arrest_stick", "unarrest_stick"},
	command = "admin",
	max = 64,
	salary = 45,
	admin = 1,
	vote = false,
	hasLicense = true,
	candemote = true,
	Admin = true,
	mayorCanSetSalary = false
})

//Faith
TEAM_RUNNER = AddExtraTeam("Runner", {
	color = Color(255, 0, 0, 255),
	model = "models/player/alyx.mdl",
	description = [[A parkour master since she was born, 
	    skilled in climbing and parkouring.
		She is also hunted down by the police and S.W.A.T.
		
		SKILL:
		Parkour]],
	weapons = {"m9k_luger", "climb_swep2"},
	command = "parkour",
	max = 3,
	salary = 40,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = true,
	Runner = true,
	mayorCanSetSalary = false,
})

//Hitman
TEAM_HITMAN = AddExtraTeam("Hitman", {
	color = Color(84, 34, 94, 255),
	model = "models/player/guerilla.mdl",
	description = [[A hitman gets payed to kill people.]],
	weapons = {"m9k_luger", "fas2_dv2", "m9k_intervention"},
	command = "hitman",
	max = 1,
	salary = 60,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = true,
	Hitman = true,
	mayorCanSetSalary = false,
	help = {
		"Do NOT abuse this job",
		"You only kill people when you're payed for it"
    }
})

//S.W.A.T
TEAM_SWAT = AddExtraTeam("Military Infantry", {
	color = Color(22, 121, 191, 255),
	model = "models/player/swat.mdl",
	description = [[The Militairy is a very special team.
		Coordinate the S.P.T force to enforce law in the city.
		Hit people them with arrest baton to put them in jail.
		Bash them with a stunstick and they might learn better than to
		disobey the law.
		The Battering Ram can break down the door of a criminal with a
		warrant for his/her arrest.
		Type /wanted <name> to alert the public to this criminal
		Type /jailpos to set the Jail Position]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_colt1911", "stunstick", "door_ram", "weaponchecker", "fas2_m4a1"},
	command = "swat",
	max = 4,
	salary = 60,
	admin = 0,
	vote = true,
	hasLicense = true,
	candemote = true,
	SWAT = true,
	mayorCanSetSalary = false,
	customCheck = function(ply)
    return ply:GetUserGroup() != "user"
    end
})

//S.W.A.T Leader
TEAM_SWATLEADER = AddExtraTeam("Military Commander", {
	color = Color(19, 81, 124, 255),
	model = "models/player/riot.mdl",
	description = [[The Military is a very special team.
	    As Commander you're the leader of the team.
		Coordinate the S.P.T force to enforce law in the city.
		Hit people with arrest baton to put them in jail.
		Bash them with a stunstick and they might learn better than to
		disobey the law.
		The Battering Ram can break down the door of a criminal with a
		warrant for his/her arrest.
		Type /wanted <name> to alert the public to this criminal
		Type /jailpos to set the Jail Position]],
	weapons = {"m9k_colt1911", "arrest_stick", "unarrest_stick", "stunstick", "door_ram", "weaponchecker", "m9k_mossberg590", "fas2_m4a1"},
	command = "swatleader",
	max = 1,
	salary = 100,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = true,
	SWATLEADER = true,
	mayorCanSetSalary = false,
	NeedToChangeFrom = TEAM_SWAT,
    customCheck = function(ply)
    return ply:GetUserGroup() == "Member" or "donator" or ply:IsAdmin()
    end    
})

//S.W.A.T-Medic
TEAM_SWATMEDIC = AddExtraTeam("Military Medic", {
	color = Color(19, 81, 124, 255),
	model = "models/player/gasmask.mdl",
	description = [[The Military Team is a very special team.
	    As the medic you heal your teammates and wounded people.
		Coordinate the S.P.T force to enforce law in the city.
		Hit people with arrest baton to put them in jail.
		Bash them with a stunstick and they might learn better than to
		disobey the law.
		The Battering Ram can break down the door of a criminal with a
		warrant for his/her arrest.
		Type /wanted <name> to alert the public to this criminal
		Type /jailpos to set the Jail Position
		!!You also hunt down the Runners!!]],
	weapons = {"m9k_colt1911", "arrest_stick", "unarrest_stick", "fas2_m4a1", "stunstick", "door_ram", "weaponchecker", "fas2_ifak"},
	command = "swatmedic",
	max = 100,
	salary = 100,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = true,
	police = true,
	mayorCanSetSalary = false,
    customCheck = function(ply)
    return ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    
})

TEAM_SWATSNIPER = AddExtraTeam("Military Sniper", {
	color = Color(19, 81, 124, 255),
	model = "models/player/urban.mdl",
	description = [[The Military is a very special team.
	    As the sniper you snipe the people down who are wanted.
		Coordinate the S.P.T force to enforce law in the city.
		Hit people with arrest baton to put them in jail.
		Bash them with a stunstick and they might learn better than to
		disobey the law.
		The Battering Ram can break down the door of a criminal with a
		warrant for his/her arrest.
		Type /wanted <name> to alert the public to this criminal
		Type /jailpos to set the Jail Position
		!!You also hunt down the Runners!!]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_colt1911", "stunstick", "door_ram", "weaponchecker", "fas2_m24"},
	command = "swatsniper",
	max = 5,
	salary = 100,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = true,
	police = true,
	mayorCanSetSalary = false,
    customCheck = function(ply)
    return ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    
})

TEAM_SWATEXPLOSIVE = AddExtraTeam("Military Explosives Expert", {
	color = Color(19, 81, 124, 255),
	model = "models/player/swat.mdl",
	description = [[The Military is a very special team.
	    As Explosive Master your the person that helps raids with explosions.
		Type /wanted <name> to alert the public to this criminal
		Type /jailpos to set the Jail Position
		!!You also hunt down the Runners!!]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_colt1911", "stunstick", "weaponchecker", "m9k_mossberg590", "weapon_slam"},
	command = "swatexplosive",
	max = 5,
	salary = 120,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = true,
	police = true,
	mayorCanSetSalary = false,
    customCheck = function(ply)
    return ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    
})

TEAM_SWATHACKER = AddExtraTeam("Military Hacker", {
	color = Color(19, 81, 124, 255),
	model = "models/player/swat.mdl",
	description = [[The Military is a very special team.
	    As Hacking Master you're the person that supports raids with a keypad cracker!!!
		Type /wanted <name> to alert the public to this criminal
		Type /jailpos to set the Jail Position
		!!You also hunt down the Runners!!]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_colt1911", "fas2_m4a1", "stunstick", "weaponchecker", "weapon_hack_phone"},
	command = "swathacker",
	max = 5,
	salary = 100,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = true,
	police = true,
	mayorCanSetSalary = false,
    customCheck = function(ply)
    return ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    
})

TEAM_SWATJUGGER = AddExtraTeam("Military Juggernaut", {
	color = Color(19, 81, 124, 255),
	model = "models/player/combine_super_soldier.mdl",
	description = [[The Military is a very special team.
	    The Military Juggernaut is the toughest of the Military.
	    He has a riot shield that makes him tough in front, but vunerable in sides and back.
		Type /wanted <name> to alert the public to this criminal
		Type /jailpos to set the Jail Position
		!!You also hunt down the Runners!!]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_colt1911", "fas2_m4a1", "riotshield", "stunstick", "weaponchecker"},
	command = "swatjugger",
	max = 5,
	salary = 100,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = true,
	police = true,
	mayorCanSetSalary = false,
	customCheck = function(ply)
    return ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    

})

//Engineer
TEAM_ENGINEER = AddExtraTeam("Engineer", {
	color = Color(255, 144, 0, 176),
	model = "models/player/magnusson.mdl",
	description = [[A Technician, an engineer they call him.
	    He builds crazy stuff like robots and cores.
		This is THE ENGINEER!]],
	weapons = {"weapon_crowbar"},
	command = "engineer",
	max = 3,
	salary = 60,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = true,
	Engineer = true,
	mayorCanSetSalary = false
})

//Fisher
//TEAM_FISH = AddExtraTeam("Fisher", {
//	color = Color(255, 255, 0, 255),
//	model = "models/player/odessa.mdl",
//	description = [[A simple fisher, nothing special really.]],
//	weapons = {"weapon_fishing_rod"},
//	command = "fisher",
//	max = 3,
//	salary = 35,
//	admin = 0,
//	vote = false,
//	hasLicense = true,
//	candemote = true,
//	Fisher = true,
//	mayorCanSetSalary = true
//})

//Guard
TEAM_PGUARD = AddExtraTeam("Personal Guard", {
	color = Color(27, 209, 48, 120),
	model = "models/player/riot.mdl",
	description = [[A guard protects people who they hired you.
	    Do not abuse this job.
		If they hire you as their personal guard, you NEED to protect them.
		If you don't, that's breaking the rules, goodluck!]],
	weapons = {"m9k_colt1911"},
	command = "pguard",
	max = 2,
	salary = 40,
	admin = 0,
	vote = true,
	hasLicense = true,
	candemote = true,
	Guard = true,
	mayorCanSetSalary = false,
})

//Black Market Dealer
TEAM_BMDEALER = AddExtraTeam("Black Market Dealer", {
	color = Color(0, 0, 0, 255),
	model = "models/player/eli.mdl",
	description = [[A Black Market Dealer
	    is hunted down by the police.
		He sells illegal weapons like explosives.]],
	weapons = {},
	command = "BMD",
	max = 2,
	salary = 80,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = true,
	BMD = true,
	mayorCanSetSalary = false
})

//Thief
TEAM_THIEF = AddExtraTeam("Thief", {
	color = Color(25, 25, 25, 255),
	model = "models/player/arctic.mdl",
	description = [[Steal, mug people is your priority]],
	weapons = {"lockpick", "keypad_cracker"},
	command = "thief",
	max = 3,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false
})

TEAM_PROTHIEF = AddExtraTeam("Professional Thief", {
	color = Color(25, 25, 25, 255),
	model = "models/player/arctic.mdl",
	description = [[Leaned from the best
		However, your professional skills are illegal
		You are AOS as this job
		<Donator Only>]],
	weapons = {"pro_lockpick", "prokeypad_cracker"},
	command = "prothief",
	max = 4,
	salary = 90,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = false,
	customCheck = function(ply)
    return ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    
})

TEAM_ADVGUN = AddExtraTeam("Adv. Arms Dealer", {
	color = Color(255, 140, 0, 255),
	model = "models/player/monk.mdl",
	description = [[A gun dealer is the only person who can sell guns to other
		people.
		/Buyshipment <name> to Buy a weapon shipment
		/Buygunlab to Buy a gunlab that spawns P228 pistols]],
	weapons = {"fas2_ammobox"},
	command = "advgun",
	max = 2,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayorCanSetSalary = true
})

//Assassin
TEAM_ASSASSIN = AddExtraTeam("Assassin", {
	color = Color(0, 10, 0, 255),
	model = "models/nikout/dishonored/assassin1.mdl",
	description = [[Assassinate for money,
		Stealth skills are required.
		<donator only>]],
	weapons = {"weapon_crossbow", "blink_swep", "climb_swep2", "fas2_dv2", "vortigaunt_beam"},
	command = "Assassin",
	max = 5,
	salary = 160,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = true,
	Assassin = true,
	mayorCanSetSalary = false,
	customCheck = function(ply)
    return ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    
})

TEAM_STEAMPILOT = AddExtraTeam("Steampunk Pilot", {
	color = Color(0, 168, 184),
	model = "models/player/combine_super_soldier.mdl",
	description = [[A Futuristic Soldier, that came to
		make justice to this, strange, mad world.
		You are some kind of a cop but you aren't
		suppose to team with them.
		---Donator Only---]],
	weapons = {"arrest_stick", "unarrest_stick", "weapon_357", "weapon_ar2", "stunstick", "door_ram"},
	command = "steampilot",
	max = 3,
	salary = 120,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = true,
	SteamPilot = true,
	police = true,
	mayorCanSetSalary = false,
    customCheck = function(ply)
    return ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    
})

TEAM_VIGILANTE = AddExtraTeam("Vigilante", {
	color = Color(221, 151, 151),
	model = {
		"models/player/leet.mdl"},
	description = [[After years of travelling you
	have finally found civilization in this Zombie Apocalypse.
	With your great dual wielding skills and loads of weapons.
	You have decided to protect these people]],
	weapons = {"dual_weapons", "weapon_hack_phone"},
	command = "quickshot",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = true,
	candemote = false,
	quickshot = true,
	mayorCanSetSalary = false,
	customCheck = function(ply)
    return ply:GetUserGroup() == "donator" or ply:IsAdmin()
    end    
})

/*
--------------------------------------------------------
HOW TO MAKE A DOOR GROUP
--------------------------------------------------------
AddDoorGroup("NAME OF THE GROUP HERE, you see this when looking at a door", Team1, Team2, team3, team4, etc.)

WARNING: THE DOOR GROUPS HAVE TO BE UNDER THE TEAMS IN SHARED.LUA. IF THEY ARE NOT, IT MIGHT MUCK UP!


The default door groups, can also be used as examples:
*/
AddDoorGroup("Goverment only", TEAM_CHIEF, TEAM_POLICE, TEAM_MAYOR, TEAM_SWAT, TEAM_SWATLEADER, TEAM_ADMIN, TEAM_SWATMEDIC, TEAM_SWATSNIPER, TEAM_SECRETSERVICE, TEAM_SWATEXPLOSIVE)
AddDoorGroup("Gundealer only", TEAM_GUN, TEAM_ADMIN)
AddDoorGroup("Outlanders only", TEAM_ASSASSIN, TEAM_NINJA, TEAM_VIPNINJA)


/*
--------------------------------------------------------
HOW TO MAKE AN AGENDA
--------------------------------------------------------
AddAgenda(Title of the agenda, Manager (who edits it), Listeners (the ones who just see and follow the agenda))

WARNING: THE AGENDAS HAVE TO BE UNDER THE TEAMS IN SHARED.LUA. IF THEY ARE NOT, IT MIGHT MUCK UP!

The default agenda's, can also be used as examples:
*/
AddAgenda("Gangster's agenda", TEAM_MOB, {TEAM_GANG})
AddAgenda("Survivor Protection Team's Agenda", TEAM_MAYOR, {TEAM_CHIEF, TEAM_POLICE, TEAM_ADMIN})
AddAgenda("Military Agenda", TEAM_SWATLEADER, {TEAM_SWATMEDIC, TEAM_SWATSNIPER, TEAM_SWATEXPLOSIVE, TEAM_SWAT})
AddAgenda("Assassins Agenda", TEAM_ASSASSIN, {TEAM_NINJA, TEAM_VIPNINJA})

/*
---------------------------------------------------------------------------
HOW TO MAKE A GROUP CHAT
---------------------------------------------------------------------------
Pick one!
GAMEMODE:AddGroupChat(List of team variables separated by comma)

or

GAMEMODE:AddGroupChat(a function with ply as argument that returns whether a random player is in one chat group)
This one is for people who know how to script Lua.

*/
GM:AddGroupChat(function(ply) return ply:IsCP() end)
GM:AddGroupChat(TEAM_MOB, TEAM_GANG, TEAM_ADMIN)
GM:AddGroupChat(TEAM_POLICE, TEAM_CHIEF, TEAM_SWAT, TEAM_SWATLEADER, TEAM_SWATMEDIC, TEAM_SWATSNIPER, TEAM_ADMIN, TEAM_SWATHACKER)
GM:AddGroupChat(TEAM_ASSASSIN, TEAM_NINJA, TEAM_VIPNINJA)

/*---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------*/
GM.DefaultTeam = TEAM_CITIZEN

/*---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------*/
GM.CivilProtection = {
	[TEAM_POLICE] = true,
	[TEAM_CHIEF] = true,
	[TEAM_MAYOR] = true,
	[TEAM_SWAT] = true,
	[TEAM_SWATLEADER] = true,
	[TEAM_SWATMEDIC] = true,
	[TEAM_SWATSNIPER] = true,
        [TEAM_SWATEXPLOSIVE] = true,
	[TEAM_ADMIN] = true
}

/*---------------------------------------------------------------------------
Enable hitman goodies on this team
---------------------------------------------------------------------------*/
DarkRP.addHitmanTeam(TEAM_HITMAN)
DarkRP.addHitmanTeam(TEAM_ASSASSIN)
