local player = game.Players.LocalPlayer
-- Zaktualizowana whitelist z dodatkowymi nickami
local whitelist = {
"sashaboxexe", "PFS_SCORPION"
}
-- Funkcja normalizująca nazwę użytkownika (np. do małych liter)
local function normalizeUsername(username)
    return username:lower():gsub("%s+", "")  -- Zmienia na małe litery i usuwa spacje
end
-- Funkcja sprawdzająca, czy użytkownik jest na whiteliście
local function isWhitelisted(username)
    local normalizedName = normalizeUsername(username)
    for _, whitelistedName in ipairs(whitelist) do
        if normalizeUsername(whitelistedName) == normalizedName then
            return true
        end
    end
    return false
end
-- Sprawdzenie i reakcja na wynik
if isWhitelisted(player.Name) then
    print("Whitelisted: " .. player.Name)
else
    -- Powiadomienie i wyrzucenie użytkownika
    print(player.Name .. " is not on the whitelist. Kicking...")
    player:Kick("You are not on the whitelist. Please contact support for assistance.")
end
