local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("portablechair", function(source)
    TriggerClientEvent("portablechair:Toggle", source)
end)