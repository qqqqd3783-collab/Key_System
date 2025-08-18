-------------------------------------------------------------------------------
--! Roblox Script with Platoboost Integration
--! Complete Platoboost Library with Working GUI and External Script Loader

-------------------------------------------------------------------------------
--! CONFIGURATION SECTION - แก้ไขตรงนี้
local service = 5683;  -- ใส่ Service ID ของคุณ
local secret = "1e88032b-e163-4a76-81db-c59c8337b38c";  -- ใส่ Secret ของคุณ
local useNonce = true;  

-- 📁 EXTERNAL SCRIPT URL - ใส่ URL ของสคริปที่ต้องการโหลดหลังใส่คีย์เสร็จ
-- แก้ไขตรงนี้: ใส่ Raw URL ของสคริปที่ต้องการโหลด
local EXTERNAL_SCRIPT_URL = nil  -- ใส่ URL ตรงนี้

-------------------------------------------------------------------------------
--! json library
--! cryptography library
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(d,e)d=d%a;return(-1-d)%a end;local function p(d,e)d=d%a;e=e%32;local m=n(d,2^e-1);d=(d-m)/2^e;local f=d%2;if f==1 then d=d+b end;return d%a end;local function q(d,e)d=d%a;e=e%32;local f=0;local g=1;for h=1,e do local i=d%2;d=(d-i)/2;f=f+g*i;g=g*2 end;return f end;local function r(d,e)d=d%a;e=e%32;local f=q(d,e);return d-f+f*2^(32-e)end;local s={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,1,6,11,0,5,10,15,4,9,14,3,8,13,2,7,12,5,8,11,14,1,4,7,10,13,0,3,6,9,12,15,2,0,7,14,5,12,3,10,1,8,15,6,13,4,11,2,9};local t={7,12,17,22,7,12,17,22,7,12,17,22,7,12,17,22,5,9,14,20,5,9,14,20,5,9,14,20,5,9,14,20,4,11,16,23,4,11,16,23,4,11,16,23,4,11,16,23,6,10,15,21,6,10,15,21,6,10,15,21,6,10,15,21};local u={0xd76aa478,0xe8c7b756,0x242070db,0xc1bdceee,0xf57c0faf,0x4787c62a,0xa8304613,0xfd469501,0x698098d8,0x8b44f7af,0xffff5bb1,0x895cd7be,0x6b901122,0xfd987193,0xa679438e,0x49b40821,0xf61e2562,0xc040b340,0x265e5a51,0xe9b6c7aa,0xd62f105d,0x02441453,0xd8a1e681,0xe7d3fbc8,0x21e1cde6,0xc33707d6,0xf4d50d87,0x455a14ed,0xa9e3e905,0xfcefa3f8,0x676f02d9,0x8d2a4c8a,0xfffa3942,0x8771f681,0x6d9d6122,0xfde5380c,0xa4beea44,0x4bdecfa9,0xf6bb4b60,0xbebfbc70,0x289b7ec6,0xeaa127fa,0xd4ef3085,0x04881d05,0xd9d4d039,0xe6db99e5,0x1fa27cf8,0xc4ac5665,0xf4292244,0x432aff97,0xab9423a7,0xfc93a039,0x655b59c3,0x8f0ccc92,0xffeff47d,0x85845dd1,0x6fa87e4f,0xfe2ce6e0,0xa3014314,0x4e0811a1,0xf7537e82,0xbd3af235,0x2ad7d2bb,0xeb86d391};local function v(w,x,y,z,A,B,C)return(k(n(k(w,x),k(z,C)),B)+y)end;local function D(w,x,y,z,A,B,C)return v(n(x,y),o(x),w,z,A,B,C)end;local function E(w,x,y,z,A,B,C)return v(k(x,z),y,o(z),w,A,B,C)end;local function F(w,x,y,z,A,B,C)return v(k(x,y),k(x,z),w,A,B,C)end;local function G(w,x,y,z,A,B,C)return v(k(y,o(z)),x,w,A,B,C)end;local function H(I)local J={}local K=string.len(I)local L=K;for i=1,K do J[i]=string.byte(I,i)end;J[K+1]=128;K=K+1;while K%64~=56 do J[K+1]=0;K=K+1 end;local M=8*L;for i=1,8 do J[K+i]=M%256;M=math.floor(M/256)end;return J end;local function N(J)local O,P,Q,R=1732584193,4023233417,2562383102,271733878;for S=1,#J,64 do local T={}for i=0,15 do T[i]=J[S+i*4]+J[S+i*4+1]*256+J[S+i*4+2]*65536+J[S+i*4+3]*16777216 end;local U,V,W,X=O,P,Q,R;for i=0,63 do local Y,Z;if i<=15 then Y=D(V,W,X,T[i],t[i+1],u[i+1])Z=i elseif i<=31 then Y=E(V,W,X,T[(5*i+1)%16],t[i+1],u[i+1])Z=(5*i+1)%16 elseif i<=47 then Y=F(V,W,X,T[(3*i+5)%16],t[i+1],u[i+1])Z=(3*i+5)%16 else Y=G(V,W,X,T[(7*i)%16],t[i+1],u[i+1])Z=(7*i)%16 end;U,V,W,X=X,Y,V,W end;O=k(O,U)P=k(P,V)Q=k(Q,W)R=k(R,X)end;return O,P,Q,R end;local function _(...) local a0={...} local a1="" for i=1,#a0 do a1=a1..string.format("%08x",a0[i]):gsub("(%w%w)(%w%w)(%w%w)(%w%w)","%4%3%2%1") end return a1 end;local function Z(a2)return _(N(H(a2)))end;local function a3(a4)local a5={[0]='A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9','+','/'}local a6=''local a7=string.len(a4)local a8=a7%3;a4=a4..string.rep('\0',a8==0 and 0 or 3-a8)for i=1,string.len(a4),3 do local a9,aa,ab=string.byte(a4,i,i+2)local ac=a9*65536+aa*256+ab;a6=a6..a5[math.floor(ac/262144)]..a5[math.floor(ac/4096)%64]..a5[math.floor(ac/64)%64]..a5[ac%64]end;return a6:sub(1,math.ceil(a7/3)*4-(a8==0 and 0 or 3-a8))..(a8==0 and''or string.rep('=',3-a8))end;local function ad(ae)local af="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local ag={}for i=1,#af do ag[af:sub(i,i)]=i-1 end;local ah=''local ai=#ae;if ai%4~=0 or ae:find('[^'..af..'=]')then return nil end;for i=1,ai,4 do local aj,ak,al,am=ae:sub(i,i),ae:sub(i+1,i+1),ae:sub(i+2,i+2),ae:sub(i+3,i+3)if not(ag[aj]and ag[ak]and(ag[al]or al=='=')and(ag[am]or am=='='))then return nil end;local an=(ag[aj]or 0)*262144+(ag[ak]or 0)*4096+(ag[al]or 0)*64+(ag[am]or 0)if am=='='then if al=='='then ah=ah..string.char(math.floor(an/65536))else ah=ah..string.char(math.floor(an/65536),math.floor(an/256)%256)end else ah=ah..string.char(math.floor(an/65536),math.floor(an/256)%256,an%256)end end;return ah end;local function ao(ap)local aq={}local ar=""local as=1;local at=string.len(ap)while as<=at do local au=string.byte(ap,as)if au<128 then ar=ar..string.char(au)elseif au<224 then local av=string.byte(ap,as+1)ar=ar..string.char(((au-192)*64)+(av-128))as=as+1 elseif au<240 then local av=string.byte(ap,as+1)local aw=string.byte(ap,as+2)ar=ar..string.char(((au-224)*4096)+((av-128)*64)+(aw-128))as=as+2 else as=as+3 end;as=as+1 end;return ar end;local function ax(I)if not I then return""end;local ay={}for az=1,#I do local aA=I:sub(az,az)if aA:match("%w")or aA:match("[ !@#$%^&*()_+{}|:<>?`~\\[\\];'./,]")then table.insert(ay,aA)end end;return table.concat(ay)end;local function aB(aC)local aD={}local aE=""local aF=string.len(aC)local i=1;while i<=aF do local aG=aC:sub(i,i)if aG=="{"then local aH=""i=i+1;while i<=aF do local aI=aC:sub(i,i)if aI=="}"then break end;aH=aH..aI;i=i+1 end;local aJ=tonumber(aH)if aJ then table.insert(aD,aJ)else aE=aE..aH end elseif aG==","then elseif aG=='"'then local aH=""i=i+1;while i<=aF do local aI=aC:sub(i,i)if aI=='"'and aC:sub(i-1,i-1)~="\\"then break end;aH=aH..aI;i=i+1 end;table.insert(aD,ax(aH))elseif aG==":"then elseif aG==" "then else aE=aE..aG end;i=i+1 end;local aK={}if#aD>0 then for aL,aM in ipairs(aD)do if type(aM)=="string"then aK[aL]=aM elseif type(aM)=="number"then aK[aL]=aM end end else for aN in aE:gmatch('([^,]+)')do local aO,aP=aN:match('(.-):(.*)')if aO and aP then aO=aO:gsub('^%s*"?',''):gsub('"?%s*$','')aP=aP:gsub('^%s*"?',''):gsub('"?%s*$','')local aQ=tonumber(aP)aK[aO]=aQ or aP end end end;return aK end;local function aw(aR)local aS,aT=pcall(function()local aU={}if type(aR)=="table"then local aV={}for aN,aM in pairs(aR)do local aW=type(aM)if aW=="string"then table.insert(aV,'"'..aN..'"'..':"'..tostring(aM)..'"')elseif aW=="number"then table.insert(aV,'"'..aN..'"'..":"..tostring(aM))elseif aW=="boolean"then table.insert(aV,'"'..aN..'"'..":"..tostring(aM))end end;return "{"..table.concat(aV,",").."}"else return tostring(aR)end end)return aS and aT or tostring(aR)end;
local lEncode, lDecode, lDigest = a3, aB, Z;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--! platoboost library

--! callbacks
local onMessage = function(message) 
    print("[Platoboost]", message)
end

--! wait for game to load
repeat task.wait(1) until game:IsLoaded();

--! functions
local requestSending = false;
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid = setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function() return game:GetService("Players").LocalPlayer.UserId end
local cachedLink, cachedTime = "", 0;

--! pick host
local host = "https://api.platoboost.com";
local hostResponse = fRequest({
    Url = host .. "/public/connectivity",
    Method = "GET"
});
if hostResponse.StatusCode ~= 200 and hostResponse.StatusCode ~= 429 then
    host = "https://api.platoboost.net";
end

function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response = fRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({
                service = service,
                identifier = lDigest(fGetHwid())
            }),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        });

        if response.StatusCode == 200 then
            local decoded = lDecode(response.Body);

            if decoded.success == true then
                cachedLink = decoded.data.url;
                cachedTime = fOsTime();
                return true, cachedLink;
            else
                onMessage(decoded.message);
                return false, decoded.message;
            end
        elseif response.StatusCode == 429 then
            local msg = "you are being rate limited, please wait 20 seconds and try again.";
            onMessage(msg);
            return false, msg;
        end

        local msg = "Failed to cache link.";
        onMessage(msg);
        return false, msg;
    else
        return true, cachedLink;
    end
end

local generateNonce = function()
    local str = ""
    for _ = 1, 16 do
        str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97)
    end
    return str
end

local copyLink = function()
    local success, link = cacheLink();
    
    if success then
        fSetClipboard(link);
    end
end

local redeemKey = function(key)
    local nonce = generateNonce();
    local endpoint = host .. "/public/redeem/" .. fToString(service);

    local body = {
        identifier = lDigest(fGetHwid()),
        key = key
    }

    if useNonce then
        body.nonce = nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "POST",
        Body = lEncode(body),
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end    
                else
                    return true;
                end
            else
                onMessage("key is invalid.");
                return false;
            end
        else
            if fStringSub(decoded.message, 1, 27) == "unique constraint violation" then
                onMessage("you already have an active key, please wait for it to expire before redeeming it.");
                return false;
            else
                onMessage(decoded.message);
                return false;
            end
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false; 
    end
end

local verifyKey = function(key)
    if requestSending == true then
        onMessage("a request is already being sent, please slow down.");
        return false;
    else
        requestSending = true;
    end

    local nonce = generateNonce();
    local endpoint = host .. "/public/whitelist/" .. fToString(service) .. "?identifier=" .. lDigest(fGetHwid()) .. "&key=" .. key;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    requestSending = false;

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end
                else
                    return true;
                end
            else
                if fStringSub(key, 1, 4) == "KEY_" then
                    return redeemKey(key);
                else
                    onMessage("key is invalid.");
                    return false;
                end
            end
        else
            onMessage(decoded.message);
            return false;
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false;
    end
end

local getFlag = function(name)
    local nonce = generateNonce();
    local endpoint = host .. "/public/flag/" .. fToString(service) .. "?name=" .. name;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if useNonce then
                if decoded.data.hash == lDigest(fToString(decoded.data.value) .. "-" .. nonce .. "-" .. secret) then
                    return decoded.data.value;
                else
                    onMessage("failed to verify integrity.");
                    return nil;
                end
            else
                return decoded.data.value;
            end
        else
            onMessage(decoded.message);
            return nil;
        end
    else
        return nil;
    end
end

-- Save/Load Key System
local function saveKey(key)
    local success, err = pcall(function()
        if not isfolder("TadHub_SaveKey") then
            makefolder("TadHub_SaveKey")
        end
        
        writefile("TadHub_SaveKey/saved_key.txt", key)
        print("Key saved successfully!")
    end)
    
    if not success then
        print("Failed to save key:", err)
    end
end

local function loadSavedKey()
    if isfolder("TadHub_SaveKey") and isfile("TadHub_SaveKey/saved_key.txt") then
        local success, key = pcall(function()
            return readfile("TadHub_SaveKey/saved_key.txt")
        end)
        
        if success and key and key ~= "" then
            return key
        end
    end
    return nil
end

local function deleteSavedKey()
    if isfile("TadHub_SaveKey/saved_key.txt") then
        delfile("TadHub_SaveKey/saved_key.txt")
        print("Saved key deleted!")
    end
end

-- 🔥 MAIN SCRIPT LOADER - โหลดสคริปจากภายนอก
local function loadExternalScript()
    if EXTERNAL_SCRIPT_URL == nil or EXTERNAL_SCRIPT_URL == "" then
        print("⚠️ No external script URL configured!")
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Configuration Notice",
            Text = "No external script URL set. Please configure EXTERNAL_SCRIPT_URL.",
            Duration = 6
        })
        return
    end
    
    print("🔄 Loading external script from: " .. EXTERNAL_SCRIPT_URL)
    
    local success, result = pcall(function()
        local scriptContent = game:HttpGet(EXTERNAL_SCRIPT_URL)
        return loadstring(scriptContent)()
    end)
    
    if success then
        print("✅ External script loaded successfully!")
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Script Loader",
            Text = "External script loaded successfully!",
            Duration = 4
        })
    else
        print("❌ Failed to load external script:", result)
        -- Fallback - show error message
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Script Loader Error",
            Text = "Failed to load external script. Check URL.",
            Duration = 5
        })
    end
end

-- Main script logic - รันหลังใส่คีย์เสร็จ
local function mainScript()
    print("✅ Authentication successful! Running main script...")
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    
    print("🎮 Welcome, " .. player.Name .. "!")
    
    -- Load the external script
    loadExternalScript()
    
    print("🔥 Main script completed!")
end

-- Create ultra-modern GUI for key verification
local function createKeyGUI()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- Remove existing GUI if it exists
    local existingGui = playerGui:FindFirstChild("PlatoboostGUI")
    if existingGui then
        existingGui:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "PlatoboostGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    -- Create camera blur effect
    local camera = workspace.CurrentCamera
    local blurEffect = Instance.new("BlurEffect")
    blurEffect.Size = 15
    blurEffect.Parent = camera

    local frameWidth = 400
    local frameHeight = 300

    -- Main frame with glassmorphism effect
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, frameWidth, 0, frameHeight)
    frame.Position = UDim2.new(0.5, -frameWidth/2, 0.5, -frameHeight/2)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 255, 150)
    stroke.Thickness = 2
    stroke.Transparency = 0.2
    stroke.Parent = frame

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 60)
    title.BackgroundTransparency = 1
    title.Text = "🛡️ PLATOBOOST KEY SYSTEM"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 18
    title.Font = Enum.Font.GothamBold
    title.Parent = frame

    -- Key input
    local keyInput = Instance.new("TextBox")
    keyInput.Size = UDim2.new(0.8, 0, 0, 45)
    keyInput.Position = UDim2.new(0.1, 0, 0.25, 0)
    keyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    keyInput.BackgroundTransparency = 0.2
    keyInput.BorderSizePixel = 0
    keyInput.PlaceholderText = "Enter your authentication key..."
    keyInput.PlaceholderColor3 = Color3.fromRGB(100, 150, 120)
    keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyInput.TextSize = 14
    keyInput.Font = Enum.Font.Gotham
    keyInput.Parent = frame

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 8)
    inputCorner.Parent = keyInput

    -- Get Key button
    local getKeyButton = Instance.new("TextButton")
    getKeyButton.Size = UDim2.new(0.35, 0, 0, 40)
    getKeyButton.Position = UDim2.new(0.1, 0, 0.55, 0)
    getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    getKeyButton.BorderSizePixel = 0
    getKeyButton.Text = "🔗 GET KEY"
    getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    getKeyButton.TextSize = 14
    getKeyButton.Font = Enum.Font.GothamBold
    getKeyButton.Parent = frame

    local getKeyCorner = Instance.new("UICorner")
    getKeyCorner.CornerRadius = UDim.new(0, 8)
    getKeyCorner.Parent = getKeyButton

    -- Verify button
    local verifyButton = Instance.new("TextButton")
    verifyButton.Size = UDim2.new(0.35, 0, 0, 40)
    verifyButton.Position = UDim2.new(0.55, 0, 0.55, 0)
    verifyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    verifyButton.BorderSizePixel = 0
    verifyButton.Text = "⚡ VERIFY"
    verifyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    verifyButton.TextSize = 14
    verifyButton.Font = Enum.Font.GothamBold
    verifyButton.Parent = frame

    local verifyCorner = Instance.new("UICorner")
    verifyCorner.CornerRadius = UDim.new(0, 8)
    verifyCorner.Parent = verifyButton

    -- Status label
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(0.8, 0, 0, 25)
    status.Position = UDim2.new(0.1, 0, 0.78, 0)
    status.BackgroundTransparency = 1
    status.Text = "Enter your key and click verify"
    status.TextColor3 = Color3.fromRGB(200, 200, 200)
    status.TextSize = 12
    status.Font = Enum.Font.Gotham
    status.Parent = frame

    -- Script URL info
    local urlInfo = Instance.new("TextLabel")
    urlInfo.Size = UDim2.new(0.8, 0, 0, 20)
    urlInfo.Position = UDim2.new(0.1, 0, 0.88, 0)
    urlInfo.BackgroundTransparency = 1
    urlInfo.Text = "External Script: " .. string.sub(EXTERNAL_SCRIPT_URL, 1, 40) .. "..."
    urlInfo.TextColor3 = Color3.fromRGB(100, 150, 120)
    urlInfo.TextSize = 10
    urlInfo.Font = Enum.Font.Gotham
    urlInfo.Parent = frame

    -- Button events
    getKeyButton.MouseButton1Click:Connect(function()
        copyLink()
        status.Text = "Key link copied to clipboard!"
        status.TextColor3 = Color3.fromRGB(0, 255, 150)
        
        task.spawn(function()
            task.wait(3)
            status.Text = "Enter your key and click verify"
            status.TextColor3 = Color3.fromRGB(200, 200, 200)
        end)
    end)

    verifyButton.MouseButton1Click:Connect(function()
        local key = keyInput.Text
        if key == "" then
            status.Text = "Please enter a key!"
            status.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        
        status.Text = "Verifying key..."
        status.TextColor3 = Color3.fromRGB(255, 200, 0)
        verifyButton.Text = "⏳ VERIFYING..."
        getKeyButton.Visible = false
        
        task.spawn(function()
            local success = verifyKey(key)
            
            if success then
                status.Text = "✅ Key verified successfully!"
                status.TextColor3 = Color3.fromRGB(0, 255, 150)
                verifyButton.Text = "✅ VERIFIED!"
                
                saveKey(key)
                
                -- Close animation
                local closeTween = TweenService:Create(
                    frame,
                    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                    {Size = UDim2.new(0, 0, 0, 0)}
                )
                
                local blurFadeTween = TweenService:Create(
                    blurEffect,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = 0}
                )
                
                closeTween:Play()
                blurFadeTween:Play()
                
                closeTween.Completed:Connect(function()
                    blurEffect:Destroy()
                    screenGui:Destroy()
                    mainScript() -- รันสคริปหลัก
                end)
            else
                status.Text = "❌ Invalid key! Please try again."
                status.TextColor3 = Color3.fromRGB(255, 100, 100)
                verifyButton.Text = "⚡ VERIFY"
                getKeyButton.Visible = true
                deleteSavedKey()
            end
        end)
    end)

    -- Entrance animation
    frame.Size = UDim2.new(0, 0, 0, 0)
    blurEffect.Size = 0
    
    local openTween = TweenService:Create(
        frame,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, frameWidth, 0, frameHeight)}
    )
    
    local blurTweenIn = TweenService:Create(
        blurEffect,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = 15}
    )
    
    blurTweenIn:Play()
    task.wait(0.1)
    openTween:Play()
end

-- Auto-verification system with saved key
local function initializeScript()
    local savedKey = loadSavedKey()
    
    if savedKey then
        print("🔍 Found saved key, verifying...")
        
        -- Show simple loading notification
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "TadHub Security",
            Text = "Auto-verifying saved key...",
            Duration = 3
        })
        
        task.spawn(function()
            task.wait(1) -- Brief delay for loading effect
            
            local success = verifyKey(savedKey)
            
            if success then
                print("✅ Saved key is valid! Loading script...")
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "TadHub Security",
                    Text = "Key verified! Loading main script...",
                    Duration = 4
                })
                
                task.wait(1)
                mainScript()
            else
                print("❌ Saved key expired, showing GUI...")
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "TadHub Security",
                    Text = "Key expired. Please enter a new key.",
                    Duration = 4
                })
                
                deleteSavedKey()
                task.wait(1.5)
                createKeyGUI()
            end
        end)
    else
        print("🔑 No saved key found, showing GUI...")
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "TadHub Security",
            Text = "Welcome! Please enter your key to continue.",
            Duration = 4
        })
        
        task.wait(1)
        createKeyGUI()
    end
end

-- Initialize the script
initializeScript()

-------------------------------------------------------------------------------
--! 📋 วิธีการใช้งาน:
--! 1. แก้ไข service และ secret ในส่วน CONFIGURATION
--! 2. แก้ไข EXTERNAL_SCRIPT_URL เป็น URL ของสคริปที่ต้องการโหลด
--! 3. บันทึกไฟล์นี้และอัปโหลดไปยัง GitHub
--! 4. ใช้ Raw URL เพื่อโหลดสคริปนี้
--! 
--! ชื่อไฟล์แนะนำ: platoboost_loader.lua
-------------------------------------------------------------------------------