---------------------------
-- Configuration Section --
---------------------------

local plateStarts = {"M"} -- First letter(s) of the plate (e.g., city identifier)
local plateLetters = {"A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
local plateYears = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99"}
local textureFile = "nui://GermanPlates-FiveM/plates/plate.png" -- Path to main plate texture
local normalMapFile = "nui://GermanPlates-FiveM/plates/plate_n.png" -- Path to normal map texture

-- End of Configuration Section --

Citizen.CreateThread(function()
    while true do
        for _, vehicle in pairs(GetGamePool('CVehicle')) do
            local currentPlate = GetVehicleNumberPlateText(vehicle)
			
            if currentPlate ~= nil then
                whiteSpace = 0

                for i = 1, #currentPlate do
                    if (string.sub(currentPlate, i, i) == " ") then
                        whiteSpace = whiteSpace + 1
                    end
                end

                if whiteSpace == 0 then
                    local plate = plateStarts[math.random(1, #plateStarts)]
                    plate = plate .. '' .. plateLetters[math.random(1, #plateLetters)]
                    plate = plate .. '' .. plateLetters[math.random(1, #plateLetters)]
                    plate = plate .. '' .. plateYears[math.random(1, #plateYears)]
                    plate = plate .. '' .. plateYears[math.random(1, #plateYears)]

                    SetVehicleNumberPlateText(vehicle, plate)
                end
            end
        end

        Citizen.Wait(500)
    end
end)

local textureDic = CreateRuntimeTxd('duiTxd')
local object = CreateDui(textureFile, 540, 300)
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle)

AddReplaceTexture('vehshare', 'plate01', 'duiTxd', 'duiTex')
AddReplaceTexture('vehshare', 'plate02', 'duiTxd', 'duiTex')
AddReplaceTexture('vehshare', 'plate03', 'duiTxd', 'duiTex')
AddReplaceTexture('vehshare', 'plate04', 'duiTxd', 'duiTex')
AddReplaceTexture('vehshare', 'plate05', 'duiTxd', 'duiTex')

local object2 = CreateDui(normalMapFile, 540, 300)
local handle2 = GetDuiHandle(object2)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex2", handle2)

AddReplaceTexture('vehshare', 'plate01_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate02_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate03_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate04_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate05_n', 'duiTxd', 'duiTex2')
