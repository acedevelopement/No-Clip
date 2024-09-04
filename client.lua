-- Client-side script for No-Clip

local noClip = false

-- Function to toggle no-clip mode
function toggleNoClip()
    local playerPed = PlayerPedId()
    noClip = not noClip

    if noClip then
        -- Enable no-clip mode
        SetEntityCollision(playerPed, false, false)
        SetPlayerCanDoDriveBy(PlayerId(), false)
        SetEntityAlpha(playerPed, 51, false) -- Partially invisible
        SetEveryoneIgnorePlayer(playerPed, true)
        SetPoliceIgnorePlayer(playerPed, true)
        SetEntityInvincible(playerPed, true)
        FreezeEntityPosition(playerPed, true)
    else
        -- Disable no-clip mode
        SetEntityCollision(playerPed, true, true)
        SetPlayerCanDoDriveBy(PlayerId(), true)
        SetEntityAlpha(playerPed, 255, false) -- Fully visible
        SetEveryoneIgnorePlayer(playerPed, false)
        SetPoliceIgnorePlayer(playerPed, false)
        SetEntityInvincible(playerPed, false)
        FreezeEntityPosition(playerPed, false)
    end
end

-- Key event listener for F2
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Wait for a frame

        if IsControlJustReleased(1, 289) then -- F2 key code
            toggleNoClip()
        end
    end
end)
