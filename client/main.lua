local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

Citizen.CreateThread(function()
    Gallery = AddBlipForCoord(-424.04, 32.14, 46.23)
    SetBlipSprite (Gallery, 617)
    SetBlipDisplay(Gallery, 4)
    SetBlipScale  (Gallery, 0.9)
    SetBlipAsShortRange(Gallery, true)
    SetBlipColour(Gallery, 27)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Art Gallery")
    EndTextCommandSetBlipName(Gallery)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(200)
        PlayerJob = QBCore.Functions.GetPlayerData().job
        isLoggedIn = true
    end
end)

RegisterNetEvent("qb-gallery:Tray1")
AddEventHandler("qb-gallery:Tray1", function()
	TriggerEvent("inventory:client:SetCurrentstash", "gallerytray1")
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "gallarytray1", {
		maxweight = 100000,
		slots = 10,
	})
end)

--Billing
RegisterNetEvent('qb-gallery:client:Charge', function()
		if not onDuty then TriggerEvent("QBCore:Notify", "Not clocked in!", "error") return end
    local dialog = exports['qb-input']:ShowInput({
        header = "Pay Customer",
        submitText = "Send",
        inputs = {
            { type = 'number', isRequired = true, name = 'citizen', text = 'ID' },
            { type = 'number', isRequired = true, name = 'price', text = 'Payment Amount' },
        }
    })
    if dialog then
        if not dialog.citizen or not dialog.price then return end
        TriggerServerEvent('qb-gallery:server:Charge', dialog.citizen, dialog.price)
    end
end)

--- CUSTOMER TRAYS
RegisterNetEvent('qb-gallery:Stash')
AddEventHandler('qb-gallery:Stash',function(data)
	id = data.stash
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "GalStash_"..id)
    TriggerEvent("inventory:client:SetCurrentStash", "GalStash_"..id)
end)

-- Office Stash
RegisterNetEvent('qb-gallery:officestash')
AddEventHandler('qb-gallery:officestash', function()
	TriggerEvent("inventory:client:SetCurrentStash", "GalOfficeStash")
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "GalOfficeStash", {
		maxweight = 1000000,
		slots = 20,
	})
end)

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("galleryshop", vector3(-484.79, 60.95, 52.41), 1, 1, {
			name="galleryshop",
			heading=310,
			debug = Config.debugPoly,
			minZ=48.81,
			maxZ=52.81
		},{
			options = {
					{
					type = "server",
					event = "qb-gallery:server:sellItems",
					icon = "far fa-gem",
					label = "Sell Gems Online",
					job = "gallery", -- Remove this line if you do not want a job check.
					},
				},
			distance = 1.5
	})

	exports['qb-target']:AddBoxZone("gallerypay", vector3(-422.49, 31.86, 46.23), 0.7, 0.5, { 
			name="GalleryRegister", 
			heading = 12, 
			debug = Config.debugPoly,
			minZ = 42.73, 
			maxZ = 46.93, 
		}, { 
			options = { 
					{
					event = "qb-gallery:client:Charge", 
					icon = "fas fa-credit-card", 
					label = "Charge Customer", 
					job = "gallery" 
				}, 
			},
  		distance = 2.0
	})

	-- Office Stash
	exports['qb-target']:AddBoxZone("galleryofficestash", vector3(-483.24, 63.88, 52.41), 1.2, 1, {
		name = "galleryofficestash",
		heading = 265,
		debug = Config.debugPoly,
		minZ=49.31,
		maxZ=53.31
	}, {
		options = {
			{
				event = "qb-gallery:officestash",
				icon = "fas fa-diamond", 
				label = "Open Stash", 
				stash = "Office",
				job = "gallery"

			}, 
		},
	  distance = 2.0
	})

	---- TRAY 
	exports['qb-target']:AddBoxZone("GalleryCounter", vector3(-421.87, 30.33, 46.23), 1.8, 0.5, { 
			name="PawnCounter", 
			heading = 38, 
			debug = Config.debugPoly,
			minZ=42.78, 
			maxZ=46.78,
		}, { 
			options = { 
					{ 
					event = "qb-gallery:Stash", 
					icon = "fas fa-diamond", 
					label = "Open Counter", 
					stash = "Counter" 
				}, 
			},
  		distance = 2.0
	})
end)

-- exports['qb-target']:AddBoxZone("gallerytray", vector3(-466.92, 46.06, 46.23), 1, 1.8, {
--     name="galleryshop",
--     heading=265,
--     debugPoly=false,
--     minZ=42.33,
--     maxZ=46.33
--   },{
--     options = {
--             {
--               event = "qb-gallery:Tray1",
--               icon = "far fa-gem",
--               label = "Seller Desk",
--              -- Remove this line if you do not want a job check.
--             },
--          },
--     distance = 1.5
-- })

RegisterNetEvent('Toggle:Duty', function()
    onDuty = not onDuty
RegisterNetEvent('QBCore:Client:SetDuty')
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)