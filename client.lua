local chair = "prop_skid_chair_02"
local isAttached = false
local ChairObject = nil
local isSitting = false
local detachKeys = {157, 158, 160, 164, 165, 73, 36}
local dict = "sitchair"
local ped = PlayerPedId()
local coords = GetEntityCoords(ped)
local closestchair = GetClosestObjectOfType(coords.x, coords.y, coords.z, 10.0, `prop_skid_chair_02`, false, false, false)
local ped = PlayerPedId()
local chairout = false

local QBCore = exports['qb-core']:GetCoreObject()
local src = source 
local Player = QBCore.Functions

-- load anim

local function loadAnim(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

--get off chair
local function GetOffChair()
    local ped = PlayerPedId()

    DetachEntity(ChairObject, true, true)
    local veh = IsPedInAnyVehicle(ped, true)
    
    if veh == false then
        ClearPedTasksImmediately(PlayerPedId())
    end
    
    DeleteEntity(ChairObject)
    FreezeEntityPosition(ped, false)
    disableMovement = false
end

-- get closest chair
local function setClosestChair()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 10.0, `prop_skid_chair_02`, false, false, false)
    if object ~= 0 then
        ChairObject = object
    end
end

-- sit on chair
local function SitInChair()
    local ped = PlayerPedId()
    
    NetworkRequestControlOfEntity(ChairObject)
    loadAnim("timetable@reunited@ig_10")
    while chairout == true do
        TaskPlayAnim(ped, 'timetable@reunited@ig_10', 'base_amanda', 8.0, 8.0, -1, 2, 0, false, false, false)
        AttachEntityToEntity(ChairObject, ped, GetPedBoneIndex(ped, 6442), 0.0, -0.15, -0.1, 0.0, 88.0, 96.0, false, false, false, true, false, 13, false)
        --FreezeEntityPosition(ChairObject, true)
        FreezeEntityPosition(ped, true)
        disableMovement = true
        if IsEntityDead(ped) then 
            GetOffChair()
            chairout = false
        end
        Wait(0)
    end
end

-- take out chair event
RegisterNetEvent('portablechair:Toggle', function()
    local ped = PlayerPedId()
    local veh = IsPedInAnyVehicle(ped, true)
    
    if veh ~= false then
        chairout = true
        QBCore.Functions.Notify("You can't use this here!", "error")
    end
    
    if chairout == false then
        RequestModel("prop_skid_chair_02")
            while not HasModelLoaded("prop_skid_chair_02") do
                Wait(0)
            end
        local obj = CreateObject(`prop_skid_chair_02`, GetEntityCoords(PlayerPedId()), true)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)
            ChairObject = obj
            chairout = true
            SitInChair()
    else 
        GetOffChair()
        chairout = false
    end
end)


-- QBCore.Functions.CreateUseableItem("portablechair", function(source)
--     TriggerClientEvent("portablechair:Toggle", source)
-- end)