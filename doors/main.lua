local library = loadstring(game:HttpGet('https://pastebin.com/raw/vPWzQEC8'))()
local PathfindingService = game:GetService("PathfindingService")
local VirtualInputManager = game:GetService('VirtualInputManager')
local LocalPlayer = game.Players.LocalPlayer
local LatestRoom = game.ReplicatedStorage.GameData.LatestRoom
local Cooldown = false
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")
function esp(what,color,core,name)
    local parts
    if typeof(what) == "Instance" then

        if what:IsA("Model") then

            parts = what:GetChildren()

        elseif what:IsA("BasePart") then

            parts = {what,table.unpack(what:GetChildren())}

        end

    elseif typeof(what) == "table" then

        parts = what

    end

    

    local bill

    local boxes = {}

    

    for i,v in pairs(parts) do

        if v:IsA("BasePart") then

            local box = Instance.new("BoxHandleAdornment")

            box.Size = v.Size

            box.AlwaysOnTop = true

            box.ZIndex = 1

            box.AdornCullingMode = Enum.AdornCullingMode.Never

            box.Color3 = color

            box.Transparency = 0.7

            box.Adornee = v

            box.Parent = game.CoreGui

            

            table.insert(boxes,box)

            

            task.spawn(function()

                while box do

                    if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then

                        box.Adornee = nil

                        box.Visible = false

                        box:Destroy()

                    end  

                    task.wait()

                end

            end)

        end

    end

    

    if core and name then

        bill = Instance.new("BillboardGui",game.CoreGui)

        bill.AlwaysOnTop = true

        bill.Size = UDim2.new(0,400,0,100)

        bill.Adornee = core

        bill.MaxDistance = 2000

        

        local mid = Instance.new("Frame",bill)

        mid.AnchorPoint = Vector2.new(0.5,0.5)

        mid.BackgroundColor3 = color

        mid.Size = UDim2.new(0,8,0,8)

        mid.Position = UDim2.new(0.5,0,0.5,0)

        Instance.new("UICorner",mid).CornerRadius = UDim.new(1,0)

        Instance.new("UIStroke",mid)

        

        local txt = Instance.new("TextLabel",bill)

        txt.AnchorPoint = Vector2.new(0.5,0.5)

        txt.BackgroundTransparency = 1

        txt.BackgroundColor3 = color

        txt.TextColor3 = color

        txt.Size = UDim2.new(1,0,0,20)

        txt.Position = UDim2.new(0.5,0,0.7,0)

        txt.Text = name

        Instance.new("UIStroke",txt)

        

        task.spawn(function()

            while bill do

                if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then

                    bill.Enabled = false

                    bill.Adornee = nil

                    bill:Destroy() 

                end  

                task.wait()

            end

        end)

    end

    

    local ret = {}

    

    ret.delete = function()

        for i,v in pairs(boxes) do

            v.Adornee = nil

            v.Visible = false

            v:Destroy()

        end

        

        if bill then

            bill.Enabled = false

            bill.Adornee = nil

            bill:Destroy() 

        end

    end

    

    return ret 

end



local entityinfo = game.ReplicatedStorage:WaitForChild("EntityInfo")

function message(text)

    local msg = Instance.new("Message",workspace)

    msg.Text = tostring(text)

    task.wait(5)

    msg:Destroy()

    

    --firesignal(entityinfo.Caption.OnClientEvent,tostring(text)) 

-- Get the player's character
local character = game.Players.LocalPlayer.Character

-- Create a new Humanoid and add it to the character
local humanoid = character:WaitForChild("Humanoid")

-- Function to make the character say something
local function say(message)
    -- Create a new ChatMessage instance
    local chatMessage = Instance.new("ChatMessage")
    chatMessage.Text = message

    -- Inject the ChatMessage into the Chat service
    game:GetService("Chat"):Chat(character.Head, chatMessage)
end

							
say("Hello :3")
print('Hellooooo :3 Made by Catteleya#0093')

local flags = {

    speed = 0,

    espdoors = false,

    espkeys = false,

    espitems = false,

    espbooks = false,

    esprush = false,

    espchest = false,

    esplocker = false,

    esphumans = false,

    espgold = false,

    goldespvalue = 0,

    hintrush = false,

    light = false,

    instapp = false,

    noseek = false,

    nogates = false,

    nopuzzle = false,

    noa90 = false,

    noskeledoors = false,

    noscreech = false,

    getcode = false,

    roomsnolock = false,

    draweraura = false,

    autorooms = false,

}



local DELFLAGS = {table.unpack(flags)}

local esptable = {doors={},keys={},items={},books={},entity={},chests={},lockers={},people={},gold={}}


local window_exit = library.window("Exit")

local window_credits = library.window("Credits")

local window_player = library.window("Player")

local window_misc = library.window("Misc")

local window_esp = library.window("Esp")

window_exit.button("Close Gui",function()

    flags = DELFLAGS

    task.wait()

    library.delete()

end)


window_credits.label("Credits: Catteleya#0093",16)

window_player.toggle("Client Glow",false,function(val)

    flags.light = val

   

    if val then

        local l = Instance.new("PointLight")

        l.Range = 10000

        l.Brightness = 2

        l.Parent = char.PrimaryPart

       

        repeat task.wait() until not flags.light

        l:Destroy() 

    end

end)


window_player.toggle("Instant Use",false,function(val)

    flags.instapp = val

    

    local holdconnect

    holdconnect = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p)

		fireproximityprompt(p)

	end)

    

    repeat task.wait() until not flags.instapp

    holdconnect:Disconnect()

end)



task.spawn(function()

    while true do

        if hum.WalkSpeed < flags.speed then

            hum.WalkSpeed = flags.speed

        end

        

        task.wait()

    end

end)

window_misc.toggle("Notify Entities",false,function(val)
	
	
    flags.hintrush = val

    if val then

        local addconnect

        addconnect = workspace.ChildAdded:Connect(function(v)

            if table.find(entitynames,v.Name) then

                repeat task.wait() until plr:DistanceFromCharacter(v:GetPivot().Position) < 1000 or not v:IsDescendantOf(workspace)

                

                if v:IsDescendantOf(workspace) then

                    message(v.Name:gsub("Moving",""):upper().." is coming go hide")
							
		chatrem:FireServer(v.Name:upper().." is coming go hide")
							

                end

            end

        end) 

        

        repeat task.wait() until not flags.hintrush

        addconnect:Disconnect()

    end

end)


local screechremote = entityinfo:FindFirstChild("Screech")



if screechremote then

    window_misc.toggle("Harmless Screech",false,function(val)

        flags.noscreech = val

        

        if val then

            screechremote.Parent = nil

            repeat task.wait() until not flags.noscreech

            screechremote.Parent = entityinfo

        end

    end)

end






window_misc.toggle("Auto Library Code",false,function(val)

    flags.getcode = val

    

    if val then

        local function deciphercode()

        local paper = char:FindFirstChild("LibraryHintPaper")

        local hints = plr.PlayerGui:WaitForChild("PermUI"):WaitForChild("Hints")

        

        local code = {[1]="_",[2]="_",[3]="_",[4]="_",[5]="_"}

            

            if paper then

                for i,v in pairs(paper:WaitForChild("UI"):GetChildren()) do

                    if v:IsA("ImageLabel") and v.Name ~= "Image" then

                        for i,img in pairs(hints:GetChildren()) do

                            if img:IsA("ImageLabel") and img.Visible and v.ImageRectOffset == img.ImageRectOffset then

                                local num = img:FindFirstChild("TextLabel").Text

                                

                                code[tonumber(v.Name)] = num 

                            end

                        end

                    end

                end 

            end

            

            return code

        end

        

        local addconnect

        addconnect = char.ChildAdded:Connect(function(v)

            if v:IsA("Tool") and v.Name == "LibraryHintPaper" then

                task.wait()

                

                local code = table.concat(deciphercode())

                

                if code:find("_") then

                    message("get all hints first")

                else

                    message("the code is ".. code)

                end

            end

        end)

        

        repeat task.wait() until not flags.getcode

        addconnect:Disconnect()

    end

end)

window_misc.label("You have to get the books first! (You can enable this before getting all books)",16)

window_misc.toggle("A-000 Door No Locks",false,function(val)

    flags.roomsnolock = val

    

    if val then

        local function check(room)

            local door = room:WaitForChild("RoomsDoor_Entrance",2)

            

            if door then

                local prompt = door:WaitForChild("Door"):WaitForChild("EnterPrompt")

                prompt.Enabled = true

            end 

        end

        

        local addconnect

        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            check(room)

        end)

        

        for i,v in pairs(workspace.CurrentRooms:GetChildren()) do

            check(room)

        end

        

        repeat task.wait() until not flags.roomsnolock

        addconnect:Disconnect()

    end

end)



window_misc.toggle("Loot Aura",false,function(val)

    flags.draweraura = val

    

    if val then

        local function setup(room)

            local function check(v)

                if v:IsA("Model") then

                    if v.Name == "DrawerContainer" then

                        local knob = v:WaitForChild("Knobs")

                        

                        if knob then

                            local prompt = knob:WaitForChild("ActivateEventPrompt")

                            local interactions = prompt:GetAttribute("Interactions")

                            

                            if not interactions then

                                task.spawn(function()

                                    repeat task.wait(0.1)

                                        if plr:DistanceFromCharacter(knob.Position) <= 12 then

                                            fireproximityprompt(prompt)

                                        end

                                    until prompt:GetAttribute("Interactions") or not flags.draweraura

                                end)

                            end

                        end

                    elseif v.Name == "GoldPile" then

                        local prompt = v:WaitForChild("LootPrompt")

                        local interactions = prompt:GetAttribute("Interactions")

                            

                        if not interactions then

                            task.spawn(function()

                                repeat task.wait(0.1)

                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then

                                        fireproximityprompt(prompt) 

                                    end

                                until prompt:GetAttribute("Interactions") or not flags.draweraura

                            end)

                        end

                    elseif v.Name:sub(1,8) == "ChestBox" then

                        local prompt = v:WaitForChild("ActivateEventPrompt")

                        local interactions = prompt:GetAttribute("Interactions")

                        

                        if not interactions then

                            task.spawn(function()

                                repeat task.wait(0.1)

                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then

                                        fireproximityprompt(prompt)

                                    end

                                until prompt:GetAttribute("Interactions") or not flags.draweraura

                            end)

                        end

                    elseif v.Name == "RolltopContainer" then

                        local prompt = v:WaitForChild("ActivateEventPrompt")

                        local interactions = prompt:GetAttribute("Interactions")

                        

                        if not interactions then

                            task.spawn(function()

                                repeat task.wait(0.1)

                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then

                                        fireproximityprompt(prompt)

                                    end

                                until prompt:GetAttribute("Interactions") or not flags.draweraura

                            end)

                        end

                    end 

                end

            end

    

            local subaddcon

            subaddcon = room.DescendantAdded:Connect(function(v)

                check(v) 

            end)

            

            for i,v in pairs(room:GetDescendants()) do

                check(v)

            end

            

            task.spawn(function()

                repeat task.wait() until not flags.draweraura

                subaddcon:Disconnect() 

            end)

        end

        

        local addconnect

        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            setup(room)

        end)

        

        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do

            if room:FindFirstChild("Assets") then

                setup(room) 

            end

        end

        

        repeat task.wait() until not flags.draweraura

        addconnect:Disconnect()

    end

end)


window_esp.toggle("Door Esp",false,function(val)

    flags.espdoors = val

    

    if val then

        local function setup(room)

            local door = room:WaitForChild("Door"):WaitForChild("Door")

            

            task.wait(0.1)

            local h = esp(door,Color3.fromRGB(255,240,0),door,"Door")

            table.insert(esptable.doors,h)

            

            door:WaitForChild("Open").Played:Connect(function()

                h.delete()

            end)

            

            door.AncestryChanged:Connect(function()

                h.delete()

            end)

        end

        

        local addconnect

        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            setup(room)

        end)

        

        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do

            if room:FindFirstChild("Assets") then

                setup(room) 

            end

        end

        

        repeat task.wait() until not flags.espdoors

        addconnect:Disconnect()

        

        for i,v in pairs(esptable.doors) do

            v.delete()

        end 

    end

end)



window_esp.toggle("Key/Lever Esp",false,function(val)

    flags.espkeys = val

    

    if val then

        local function check(v)

            if v:IsA("Model") and (v.Name == "LeverForGate" or v.Name == "KeyObtain") then

                task.wait(0.1)

                if v.Name == "KeyObtain" then

                    local hitbox = v:WaitForChild("Hitbox")

                    local parts = hitbox:GetChildren()

                    table.remove(parts,table.find(parts,hitbox:WaitForChild("PromptHitbox")))

                    

                    local h = esp(parts,Color3.fromRGB(90,255,40),hitbox,"Key")

                    table.insert(esptable.keys,h)

                    

                elseif v.Name == "LeverForGate" then

                    local h = esp(v,Color3.fromRGB(90,255,40),v.PrimaryPart,"Lever")

                    table.insert(esptable.keys,h)

                    

                    v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function()

                        h.delete()

                    end) 

                end

            end

        end

        

        local function setup(room)

            local assets = room:WaitForChild("Assets")

            

            assets.DescendantAdded:Connect(function(v)

                check(v) 

            end)

                

            for i,v in pairs(assets:GetDescendants()) do

                check(v)

            end 

        end

        

        local addconnect

        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            setup(room)

        end)

        

        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do

            if room:FindFirstChild("Assets") then

                setup(room) 

            end

        end

        

        repeat task.wait() until not flags.espkeys

        addconnect:Disconnect()

        

        for i,v in pairs(esptable.keys) do

            v.delete()

        end 

    end

end)



window_esp.toggle("Item Esp",false,function(val)

    flags.espitems = val

    

    if val then

        local function check(v)

            if v:IsA("Model") and (v:GetAttribute("Pickup") or v:GetAttribute("PropType")) then

                task.wait(0.1)

                

                local part = (v:FindFirstChild("Handle") or v:FindFirstChild("Prop"))

                local h = esp(part,Color3.fromRGB(160,190,255),part,v.Name)

                table.insert(esptable.items,h)

            end

        end

        

        local function setup(room)

            local assets = room:WaitForChild("Assets")

            

            if assets then  

                local subaddcon

                subaddcon = assets.DescendantAdded:Connect(function(v)

                    check(v) 

                end)

                

                for i,v in pairs(assets:GetDescendants()) do

                    check(v)

                end

                

                task.spawn(function()

                    repeat task.wait() until not flags.espitems

                    subaddcon:Disconnect()  

                end) 

            end 

        end

        

        local addconnect

        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            setup(room)

        end)

        

        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do

            if room:FindFirstChild("Assets") then

                setup(room) 

            end

        end

        

        repeat task.wait() until not flags.espitems

        addconnect:Disconnect()

        

        for i,v in pairs(esptable.items) do

            v.delete()

        end 

    end

end)


window_esp.toggle("Book/Breaker Esp",false,function(val)

    flags.espbooks = val

    

    if val then

        local function check(v)

            if v:IsA("Model") and (v.Name == "LiveHintBook") then

                task.wait(0.1)

                

                local h = esp(v,Color3.fromRGB(160,190,255),v.PrimaryPart,"Book")

                table.insert(esptable.books,h)

                

                v.AncestryChanged:Connect(function()

                    if not v:IsDescendantOf(room) then

                        h.delete() 

                    end
                end)
            elseif v:IsA("Model") and (v.Name == "LiveBreakerPolePickup") then

                task.wait(0.1)

                

                local h = esp(v,Color3.fromRGB(160,190,255),v.PrimaryPart,"Breaker")

                table.insert(esptable.books,h)

                

                v.AncestryChanged:Connect(function()

                    if not v:IsDescendantOf(room) then

                        h.delete() 

                    end

                end)

            end

        end

        

        local function setup(room)

            if room.Name == "50" or room.Name == "100" then

                room.DescendantAdded:Connect(function(v)

                    check(v) 

                end)

                

                for i,v in pairs(room:GetDescendants()) do

                    check(v)

                end

            end

        end

        

        local addconnect

        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            setup(room)

        end)

        

        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do

            setup(room) 

        end

        

        repeat task.wait() until not flags.espbooks

        addconnect:Disconnect()

        

        for i,v in pairs(esptable.books) do

            v.delete()

        end 

    end

end)



local entitynames = {"RushMoving","AmbushMoving","Snare","A60","A120"}


window_esp.toggle("Entity Esp",false,function(val)

    flags.esprush = val

    

    if val then

        local addconnect

        addconnect = workspace.ChildAdded:Connect(function(v)

            if table.find(entitynames,v.Name) then

                task.wait(0.1)

                

                local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))

                table.insert(esptable.entity,h)

            end

        end)

        

        local function setup(room)

            if room.Name == "50" or room.Name == "100" then

                local figuresetup = room:WaitForChild("FigureSetup")

            

                if figuresetup then

                    local fig = figuresetup:WaitForChild("FigureRagdoll")

                    task.wait(0.1)

                    

                    local h = esp(fig,Color3.fromRGB(255,25,25),fig.PrimaryPart,"Figure")

                    table.insert(esptable.entity,h)

                end 

            else

                local assets = room:WaitForChild("Assets")

                

                local function check(v)

                    if v:IsA("Model") and table.find(entitynames,v.Name) then

                        task.wait(0.1)

                        

                        local h = esp(v:WaitForChild("Base"),Color3.fromRGB(255,25,25),v.Base,"Snare")

                        table.insert(esptable.entity,h)

                    end

                end

                

                assets.DescendantAdded:Connect(function(v)

                    check(v) 

                end)

                

                for i,v in pairs(assets:GetDescendants()) do

                    check(v)

                end

            end 

        end

        

        local roomconnect

        roomconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            setup(room)

        end)

        

        for i,v in pairs(workspace.CurrentRooms:GetChildren()) do

            setup(room) 

        end

        

        repeat task.wait() until not flags.esprush

        addconnect:Disconnect()

        roomconnect:Disconnect()

        

        for i,v in pairs(esptable.entity) do

            v.delete()

        end 

    end

end)



window_esp.toggle("Locker Esp",false,function(val)

    flags.esplocker = val

    

    if val then

        local function check(v)

            if v:IsA("Model") then
 
                task.wait(0.1)

                if v.Name == "Wardrobe" then

                    local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"Closet")

                    table.insert(esptable.lockers,h) 

                elseif (v.Name == "Rooms_Locker" or v.Name == "Rooms_Locker_Fridge") then

                    local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"Locker")

                    table.insert(esptable.lockers,h) 

                end

            end

        end

        

        local function setup(room)

            local assets = room:WaitForChild("Assets")

            

            if assets then

                local subaddcon

                subaddcon = assets.DescendantAdded:Connect(function(v)

                    check(v) 

                end)

                

                for i,v in pairs(assets:GetDescendants()) do

                    check(v)

                end

                

                task.spawn(function()

                    repeat task.wait() until not flags.esplocker

                    subaddcon:Disconnect()  

                end) 

            end 

        end

        

        local addconnect

        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            setup(room)

        end)

        

        for i,v in pairs(workspace.CurrentRooms:GetChildren()) do

            setup(room) 

        end

        

        repeat task.wait() until not flags.esplocker

        addconnect:Disconnect()

        

        for i,v in pairs(esptable.lockers) do

            v.delete()

        end 

    end

end)



window_esp.toggle("Chest Esp",false,function(val)

    flags.espchest = val

    

    if val then

        local function check(v)

            if v:IsA("Model") then

                task.wait(0.1)

                if v.Name == "ChestBox" then

                    warn(v.Name)

                    local h = esp(v,Color3.fromRGB(205,120,255),v.PrimaryPart,"Chest")

                    table.insert(esptable.chests,h) 

                elseif v.Name == "ChestBoxLocked" then

                    local h = esp(v,Color3.fromRGB(255,77,85),v.PrimaryPart,"Locked Chest")

                    table.insert(esptable.chests,h) 

                end

            end

        end

        

        local function setup(room)

            local subaddcon

            subaddcon = room.DescendantAdded:Connect(function(v)

                check(v) 

            end)

            

            for i,v in pairs(room:GetDescendants()) do

                check(v)

            end

            

            task.spawn(function()

                repeat task.wait() until not flags.espchest

                subaddcon:Disconnect()  

            end)  

        end

        

        local addconnect

        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            setup(room)

        end)

        

        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do

            if room:FindFirstChild("Assets") then

                setup(room) 

            end

        end

        

        repeat task.wait() until not flags.espchest

        addconnect:Disconnect()

        

        for i,v in pairs(esptable.chests) do

            v.delete()

        end 

    end

end)



window_esp.toggle("Player Esp",false,function(val)

    flags.esphumans = val

    

    if val then

        local function personesp(v)

            v.CharacterAdded:Connect(function(vc)

                local vh = vc:WaitForChild("Humanoid")

                local torso = vc:WaitForChild("UpperTorso")

                task.wait(0.1)

                

                local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)

                table.insert(esptable.people,h) 

            end)

            

            if v.Character then

                local vc = v.Character

                local vh = vc:WaitForChild("Humanoid")

                local torso = vc:WaitForChild("UpperTorso")

                task.wait(0.1)

                

                local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)

                table.insert(esptable.people,h) 

            end

        end

        

        local addconnect

        addconnect = game.Players.PlayerAdded:Connect(function(v)

            if v ~= plr then

                personesp(v)

            end

        end)

        

        for i,v in pairs(game.Players:GetPlayers()) do

            if v ~= plr then

                personesp(v) 

            end

        end

        

        repeat task.wait() until not flags.esphumans

        addconnect:Disconnect()

        

        for i,v in pairs(esptable.people) do

            v.delete()

        end 

    end

end)



window_esp.toggle("Goldpile Esp",false,function(val)

    flags.espgold = val

    

    if val then

        local function check(v)

            if v:IsA("Model") then

                task.wait(0.1)

                local goldvalue = v:GetAttribute("GoldValue")

                

                if goldvalue and goldvalue >= flags.goldespvalue then

                    local hitbox = v:WaitForChild("Hitbox")

                    local h = esp(hitbox:GetChildren(),Color3.fromRGB(255,255,0),hitbox,"GoldPile [".. tostring(goldvalue).."]")

                    table.insert(esptable.gold,h)

                end

            end

        end

        

        local function setup(room)

            local assets = room:WaitForChild("Assets")

            

            local subaddcon

            subaddcon = assets.DescendantAdded:Connect(function(v)

                check(v) 

            end)

            

            for i,v in pairs(assets:GetDescendants()) do

                check(v)

            end

            

            task.spawn(function()

                repeat task.wait() until not flags.espchest

                subaddcon:Disconnect()  

            end)  

        end

        

        local addconnect

        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)

            setup(room)

        end)

        

        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do

            if room:FindFirstChild("Assets") then

                setup(room) 

            end

        end

        

        repeat task.wait() until not flags.espgold

        addconnect:Disconnect()

        

        for i,v in pairs(esptable.gold) do

            v.delete()

        end 

    end

end)



window_esp.slider("Minimum Gold Value",5,150,5,25,function(val)

    flags.goldespvalue = val

end)





if game.ReplicatedStorage:WaitForChild("GameData"):WaitForChild("Floor").Value == "Rooms" then

    local window_rooms = library.window("the rooms")
		local GC = getconnections or get_signal_cons
		if GC then
    			for i,v in pairs(GC(LocalPlayer.Idled)) do
        			if v["Disable"] then
            				v["Disable"](v)
        			elseif v["Disconnect"] then
            		v["Disconnect"](v)
        		end
    		end
end

    

    local a90remote = game.ReplicatedStorage:WaitForChild("EntityInfo"):WaitForChild("A90")

    

    window_rooms.toggle("harmless A90",false,function(val)

        flags.noa90 = val

        

        if val  then

            local jumpscare = plr.PlayerGui:WaitForChild("MainUI"):WaitForChild("Jumpscare"):FindFirstChild("Jumpscare_A90")

           

            if jumpscare then

                jumpscare.Parent = nil

                

                a90remote.Parent = nil

                repeat task.wait()

                    game.SoundService.Main.Volume = 1 

                until not flags.noa90

                jumpscare.Parent = plr.PlayerGui.MainUI.Jumpscare

                a90remote.Parent = entityinfo 

            end

        end

    end)

    

    window_rooms.toggle("Auto A-1000",false,function(val)

        local Folder = Instance.new("Folder")
Folder.Parent = workspace
Folder.Name = "PathFindPartsFolder"
 
if LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90") then
    LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Name = "lol" -- Fuck you A90
end
 
function getLocker()
    local Closest
 
    for i,v in pairs(workspace.CurrentRooms:GetDescendants()) do
        if v.Name == "Rooms_Locker" then
            if v:FindFirstChild("Door") and v:FindFirstChild("HiddenPlayer") then
                if v.HiddenPlayer.Value == nil then
                    if v.Door.Position.Y > -3 then -- Prevents going to the lower lockers in the room with the bridge 
                        if Closest == nil then
                            Closest = v.Door
                        else
                            if (LocalPlayer.Character.HumanoidRootPart.Position - v.Door.Position).Magnitude < (Closest.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                                Closest = v.Door
                            end
                        end
                    end
                end
            end
        end
    end
    return Closest
end
 
function getPath()
    local Part
 
    local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
    if Entity and Entity.Main.Position.Y > -4 then
        Part = getLocker()
    else
        Part = workspace.CurrentRooms[LatestRoom.Value].Door.Door
    end
    return Part
end
 
LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
    TextLabel.Text = "Room: "..math.clamp(LatestRoom.Value, 1,1000)
 
    if LatestRoom.Value ~= 1000 then
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
    else
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
 
        Folder:ClearAllChildren()
 
        local Sound = Instance.new("Sound")
        Sound.Parent = game.SoundService
        Sound.SoundId = "rbxassetid://4590662766"
        Sound.Volume = 3
        Sound.PlayOnRemove = true
        Sound:Destroy()
 
        game.StarterGui:SetCore("SendNotification", { Title = "youtube.com/geoduude"; Text = "Thank you for using my script!" })
        return
    end
end)
 
game:GetService("RunService").RenderStepped:connect(function()
    LocalPlayer.Character.HumanoidRootPart.CanCollide = false
    LocalPlayer.Character.Collision.CanCollide = false
    LocalPlayer.Character.Collision.Size = Vector3.new(8,LocalPlayer.Character.Collision.Size.Y,8)
 
    LocalPlayer.Character.Humanoid.WalkSpeed = 21
 
    local Path = getPath()
 
    local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
    if Entity then
        if Path then
            if Path.Parent.Name == "Rooms_Locker" then
                if Entity.Main.Position.Y > -4 then
                    if (LocalPlayer.Character.HumanoidRootPart.Position - Path.Position).Magnitude < 2 then
                        if LocalPlayer.Character.HumanoidRootPart.Anchored == false then
                            fireproximityprompt(Path.Parent.HidePrompt)
                        end
                    end
                end
            end
        end
        if Entity.Main.Position.Y < -4 then
            if LocalPlayer.Character.HumanoidRootPart.Anchored == true then
                LocalPlayer.Character:SetAttribute("Hiding", false)
            end
        end
    else
        if LocalPlayer.Character.HumanoidRootPart.Anchored == true then
            LocalPlayer.Character:SetAttribute("Hiding", false)
        end
    end
end)
 
while true do
 
    local Destination = getPath()
 
    local path = PathfindingService:CreatePath({ WaypointSpacing = 1, AgentRadius = 0.1, AgentCanJump = false })
    path:ComputeAsync(LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0,3,0), Destination.Position)
    local Waypoints = path:GetWaypoints()
 
    if path.Status ~= Enum.PathStatus.NoPath then
 
        Folder:ClearAllChildren()
 
        for _, Waypoint in pairs(Waypoints) do
            local part = Instance.new("Part")
            part.Size = Vector3.new(1,1,1)
            part.Position = Waypoint.Position
            part.Shape = "Cylinder"
            part.Rotation = Vector3.new(0,0,90)
            part.Material = "SmoothPlastic"
            part.Anchored = true
            part.CanCollide = false
            part.Parent = Folder
        end
 
        for _, Waypoint in pairs(Waypoints) do
            if LocalPlayer.Character.HumanoidRootPart.Anchored == false then
                LocalPlayer.Character.Humanoid:MoveTo(Waypoint.Position)
                LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
            end
        end
    end
end
