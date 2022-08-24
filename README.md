# Simple Selling Script

Original Script: https://github.com/MonkeyWhisper/mw-shopseller

* This script is a original fork from mw-shopseller by MonkeyWhisper. This is made for the Art Gallery with the Honeynut art gallery mlo. This is a player run business that allows players to sell gems, paintings, and other items that can be easily changed in the config with pricing. A built in pay  register since you will be paying customers money that comes directly out of the business boss menu. Employees get a commision for making payments to other characters. Fully functional and box zones can easily be changed with little to no coding experience. 

* You can add more items on the Config.

Again this script was not my idea, it was origannily mw-shopseller and redesigned. 

As far as support goes. I will help with setting up if needed. Although it should be very simple my DMs are open for support. Pull Request are allowed if you want to improve something on it. Lastly, MLO is not provived. You must purchase from the creator, if you want to change all the zones to another location you can do so in the client.lua. 

# Dependencies
* qb-core
* qb-target by Berkie - https://github.com/BerkieBb/qb-target
* qb-input

# Bossmenu/Config (if still using qb-bossmenu)

* ['gallery'] = vector3(-466.85, 47.89, 46.23),


# QB-Core/Shared/Job.lua
*     ['gallery'] = {
		label = 'Gallery',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Host',
				payment = 150
			},
			['1'] = {
				name = 'Gem Apraiser',
				payment = 180
			},
			['2'] = {
				name = 'Gem Expert',
				payment = 225
			},
			['3'] = {
				name = 'Manager',
				payment = 265
			},
			['4'] = {
				name = 'Boss',
				isboss = true,
				payment = 300
			},
		},

#items.lua
	["diamond"] 					 = {["name"] = "diamond", 			  	  	  	["label"] = "Diamond", 					["weight"] = 5000, 		["type"] = "item", 		["image"] = "diamond.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Shiny Diamond",  ["created"] = nil, 		["decay"] = 28.0,	},
	["emerald"] 					 = {["name"] = "emerald", 			  	  	  	["label"] = "Emerald", 					["weight"] = 5000, 		["type"] = "item", 		["image"] = "emerald.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Emerald",  ["created"] = nil, 		["decay"] = 28.0,	},
	['small_painting']				 = {['name'] = 'small_painting',				['label'] = 'Family Portrait',			['weight'] = 5000,		['type'] = 'item',		['image'] = 'smallpainting.png',		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Small Family Portrait',  ["created"] = nil, 		["decay"] = 28.0,	},
	['stolen_art']				 	 = {['name'] = 'stolen_art',					['label'] = 'High Grade Art',			['weight'] = 10000,		['type'] = 'item',		['image'] = 'stolen_art.png',			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Stolen Art',  ["created"] = nil, 		["decay"] = 28.0,	},
	['blue_diamond']				 = {['name'] = 'blue_diamond',					['label'] = 'Rare Blue Diamond',		['weight'] = 1200,		['type'] = 'item',		['image'] = 'bluediamond', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Rare Blue Diamond',  ["created"] = nil, 		["decay"] = 28.0,	},
	['ruby']				 		 = {['name'] = 'ruby',							['label'] = 'Ruby',						['weight'] = 1200,		['type'] = 'item',		['image'] = 'ruby.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Bright Red Ruby',  ["created"] = nil, 		["decay"] = 28.0,	},
	['goldbar'] 			 	 	 = {['name'] = 'goldbar', 			  			['label'] = 'Gold Bar', 				['weight'] = 7000, 	    ['type'] = 'item', 		['image'] = 'goldbar.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Looks pretty expensive to me',  ["created"] = nil, 		["decay"] = 28.0,	},
	['diamond_ring'] 				 = {['name'] = 'diamond_ring', 			  	  	['label'] = 'Diamond Ring', 			['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'diamond_ring.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A diamond ring seems like the jackpot to me!',  ["created"] = nil, 		["decay"] = 28.0,	},


# To Do:

# OPTIONAL

Honeynutts Art Gallery: https://honeynutt.tebex.io/package/4373130
