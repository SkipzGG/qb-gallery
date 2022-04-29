# Simple Selling Script

Original Script: https://github.com/MonkeyWhisper/mw-shopseller

* This script is a original fork from mw-shopseller by MonkeyWhisper. This is made for the Art Gallery with the Honeynut art gallery mlo. This is a player run business that allows players to sell gems, paintings, and other items that can be easily changed in the config with pricing. A built in pay  register since you will be paying customers money that comes directly out of the business boss menu. Employees get a commision for making payments to other characters. Fully functional and box zones can easily be changed with little to no coding experience. 

* You can add more items on the Config.

Again this script was not my idea, it was origannily mw-shopseller and redesigned. 

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


# To Do:
* ui menu to sell items online

# OPTIONAL

Honeynutts Art Gallery: https://honeynutt.tebex.io/package/4373130
