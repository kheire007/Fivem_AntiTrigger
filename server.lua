ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Tableau contenant les événements à contrôler
local antitriggerserverent = {
    {
        event = "esx:giveInventoryItem",
        onlystaff = false,
        joballowed = nil,
        job2allowed = nil,
        kick = nil,
        ban = nil,
        notif = true,
        coord = nil,
        reason = "Anti Trigger Server Event"
    },
    {
        event = "Ambulance:revive",
        onlystaff = true,
        joballowed = "ambulance",
        job2allowed = nil,
        kick = true,
        ban = nil,
        notif = false,
        coord = nil,
        reason = "Anti Trigger Server Event"
    },
    -- Ajoutez ici d'autres événements à contrôler
}

-- Fonction de contrôle pour chaque événement
local function CheckEvent(data, source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()

    if data.onlystaff and group == "user" then
        if data.kick then
            DropPlayer(source, "Anti Trigger Server Event (" .. data.event .. ")")
        end
        if data.ban then
            TriggerEvent('BanSql:ICheat', source, "Anti Trigger Server Event (" .. data.event .. ")")
        end
        if data.notif then
            TriggerClientEvent('esx:showNotification', source, data.reason .. " Not staff")
        end
        return
    end

    if data.joballowed and xPlayer.job.name ~= data.joballowed then
        if xPlayer.getGroup() == "user" then
            if data.kick then
                DropPlayer(source, "Anti Trigger Server Event (" .. data.event .. ")")
            end
            if data.ban then
                TriggerEvent('BanSql:ICheat', source, "Anti Trigger Server Event (" .. data.event .. ")")
            end
            if data.notif then
                TriggerClientEvent('esx:showNotification', source, data.reason .. " Not job")
            end
        end
        return
    end

    if data.job2allowed and xPlayer.job2.name ~= data.job2allowed then
        if xPlayer.getGroup() == "user" then
            if data.kick then
                DropPlayer(source, "Anti Trigger Server Event (" .. data.event .. ")")
            end
            if data.ban then
                TriggerEvent('BanSql:ICheat', source, "Anti Trigger Server Event (" .. data.event .. ")")
            end
            if data.notif then
                TriggerClientEvent('esx:showNotification', source, data.reason .. " Not job2")
            end
        end
        return
    end

    if data.coord then
        local coords = xPlayer.getCoords(true)
        local distance = #(coords - data.coord)
        if distance > 10 then
            if data.kick then
                DropPlayer(source, "Anti Trigger Server Event (" .. data.event .. ")")
            end
            if data.ban then
                TriggerEvent('BanSql:ICheat', source, "Anti Trigger Server Event (" .. data.event .. ")")
            end
            if data.notif then
                TriggerClientEvent('esx:showNotification', source, data.reason .. " Not coord")
            end
            return
        end
    end
end

-- Enregistrement des événements côté serveur
for _, data in ipairs(antitriggerserverent) do
    RegisterServerEvent(data.event)
    AddEventHandler(data.event, function()
        local source = source
        CheckEvent(data, source)
    end)
end
