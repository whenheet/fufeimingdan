local HttpService = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeyAuthUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- UI创建（保持你原来的样式，不改动）
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 320, 0, 190)
Frame.Position = UDim2.new(0.5, -160, 0.5, -95)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)
local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Thickness = 1.5
UIStroke.Color = Color3.fromRGB(100, 100, 255)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, -40, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "大司马 验证系统"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

local Close = Instance.new("TextButton", Frame)
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BackgroundTransparency = 1
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 80, 80)
Close.Font = Enum.Font.SourceSansBold
Close.TextSize = 24

local Input = Instance.new("TextBox", Frame)
Input.PlaceholderText = "请输入密钥..."
Input.Size = UDim2.new(1, -40, 0, 35)
Input.Position = UDim2.new(0, 20, 0, 60)
Input.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Input.TextColor3 = Color3.new(1, 1, 1)
Input.Font = Enum.Font.SourceSans
Input.TextSize = 20
Input.Text = ""
Instance.new("UICorner", Input).CornerRadius = UDim.new(0, 6)

local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(1, -40, 0, 35)
Button.Position = UDim2.new(0, 20, 0, 110)
Button.Text = "验证 卡密"
Button.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 20
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)

local Status = Instance.new("TextLabel", Frame)
Status.Size = UDim2.new(1, 0, 0, 25)
Status.Position = UDim2.new(0, 0, 1, -25)
Status.BackgroundTransparency = 1
Status.TextColor3 = Color3.new(1, 1, 1)
Status.TextSize = 18
Status.Text = "等待输入 卡密..."

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- 核心修改：本地密钥列表（无网络请求，100%验证成功）
Button.MouseButton1Click:Connect(function()
    local userKey = Input.Text
    if userKey == "" then
        Status.Text = "请先输入密钥"
        return
    end
    Status.Text = "正在验证..."
    
    -- 👇 本地密钥列表（替换成 用户名，直接用）
    local LOCAL_KEYS = {
       ["K3Z7B9X2"] = {user = "whenheer", expire = "2030-12-31"},
       ["M6F2D8G4"] = {user = "Blade_QAQ", expire = "2030-12-31"},
       ["P9H5J3L7"] = {user = "TcaMoChen", expire = "2030-12-31"},
       ["Q2W4E6R8"] = {user = "55EEAF", expire = "2030-12-31"},
       ["T5Y7U9I1"] = {user ="BAI_Z07", expire = "2030-12-31"},
       ["O3P5A7S9"] = {user = "999hj08", expire = "2030-12-31"},
       ["D2F4G6H8"] = {user = "dasima", expire = "2030-12-31"},
       ["J1K3L5M7"] = {user ="CN_ylwhnb", expire = "2030-12-31"},
       ["N9B7V5C3"] = {user = "iiiii11111iiiii6", expire = "2030-12-31"},
       ["X8Z6D4F2"] = {user = "hvgjcigvjg", expire = "2030-12-31"},
       ["X1Z6D4k6"] = {user = "byhgvgyhu", expire = "2030-12-31"},
       ["X8h6D4F0"] = {user = "EVOKINGJFC3", expire = "2030-12-31"},
       ["X8h6hk88"] = {user = "123456VBNM75", expire = "2030-12-31"}, 
       ["dasima886"] = {user = "zybnb1", expire = "2030-12-31"},
       ["raqikdd42"] = {user = "raqikdd42", expire = "2030-12-31"},
       ["raafewda6"] = {user = "chen200305", expire = "2030-12-31"},
       ["ghaqldd92"] = {user = "jian201291", expire = "2030-12-31"},
       ["lkhvstii513"] = {user = "szsbsjnd", expire = "2030-12-31"},
       ["yijudahur91"] = {user = "dhccchjxz98", expire = "2030-12-31"},
       ["ghryjvd237"] = {user = "114514sz66866", expire = "2030-12-31"},
       ["jsvwq9178c"] = {user = "YBA_KLS", expire = "2030-12-31"},
       ["9178ggcsaq"] = {user = "xhyjyu", expire = "2030-12-31"},
       ["9178jvd237"] = {user = "wenbaiowo", expire = "2030-12-31"},
       ["gayhgx9178"] = {user = "skating9178_2", expire = "2030-12-31"},
       ["ghrydt9178"] = {user = "hhhxhx895", expire = "2030-12-31"},
       ["zdsdj84f42"] = {user = "1123kkjj", expire = "2030-12-31"},
       ["zszyjvd97v"] = {user = "Djdkds03", expire = "2030-12-31"},
       ["fkryjvd237"] = {user = "xiaoxi_042", expire = "2030-12-31"},
       ["hrjd9vd237"] = {user = "liwenfeng789", expire = "2030-12-31"},
       ["jdgwk8wj76"] = {user = "lostlife215", expire = "2030-12-31"},
       ["eudhs45jw8"] = {user = "qwer12341799", expire = "2030-12-31"},
       ["shenchou9178"] = {user = "shenchou888", expire = "2030-12-31"},
       ["eud4889dfjkl"] = {user = "LMK2854562558", expire = "2030-12-31"},
       ["eud4gs866"] = {user = "rroorroororrooror", expire = "2030-12-31"},
       ["ghk4gs664"] = {user = "FJHC1222", expire = "2030-12-31"},
       ["hddtjhc4h3g"] = {user = "Mike52013414", expire = "2030-12-31"},
       ["wikwj4hr57"] = {user = "CHONGKAIBALAODI", expire = "2030-12-31"},
       ["shenchouwkq45"] = {user = "sie8hxow", expire = "2030-12-31"},
       ["xiaoguangsz"] = {user = "wzhxIl", expire = "2030-12-31"},
       ["wkab46wu57"] = {user = "wprobertsky843", expire = "2030-12-31"},
       ["bcf54ey46n"] = {user = "sjsks886", expire = "2030-12-31"},
       ["hdbw74wj64"] = {user = "liwenfeng789", expire = "2030-12-31"},
       ["jdjwhjs45"] = {user = "wumao8", expire = "2030-12-31"},
       ["fcxza9178c"] = {user = "FB_VGcdou", expire = "2030-12-31"},
       ["wjsna456ew"] = {user = "Foverev1", expire = "2030-12-31"},
       ["kshe75sjqw"] = {user = "dsb_731", expire = "2030-12-31"},
       ["hhdyh57h12"] = {user = "ufyh666", expire = "2030-12-31"},
       ["jdesbs78ajw"] = {user = "qppf443", expire = "2030-12-31"},
       ["hksgnsyjs4hk6dj"] = {user = "zkmnnbhAkjm122", expire = "2030-12-31"},
       ["gjhsa42gjk"] = {user = "用户名", expire = "2030-12-31"},
       ["ljf3542gjk"] = {user = "dsc2028748268", expire = "2030-12-31"},
       ["djmq42wh31"] = {user = "octobercp", expire = "2030-12-31"},
       ["difdjlfhi"] = {user = "zxcvgh30", expire = "2030-12-31"},
       ["kjdjkn45gl"] = {user = "ywnmsb", expire = "2030-12-31"},
       ["hsjshc45k6"] = {user = "iecollinseo930", expire = "2030-12-31"},
       ["hxvjs45jk"] = {user = "sdf44w", expire = "2030-12-31"},
       ["ghjz69glp"] = {user = "xxxxbabc", expire = "2030-12-31"},
       ["lzhwkq43io"] = {user = "jjfcx28", expire = "2030-12-31"},
       ["kxgkje54j1"] = {user = "wweqr16", expire = "2030-12-31"},
       ["uhfd54v2n"] = {user = "GG004455", expire = "2030-12-31"},
       ["qoalejwha"] = {user = "yuuuooo86", expire = "2030-12-31"},
       ["kdynf451"] = {user = "wernmef", expire = "2025-12-24"},
       ["hjddh14lk"] = {user = "strawberry5ay", expire = "2030-12-31"},
       ["h5Z6D4D2"] = {user = "12345678xto", expire = "2030-12-31"}
        -- 可复制上面的格式，添加更多卡密
    }
    
    -- 本地验证（无网络，秒过）
    local keyData = LOCAL_KEYS[userKey]
    if not keyData then
        Status.Text = "无效的密钥"
        return
    end
  
    if keyData.user ~= player.Name then
        Status.Text = "此密钥属于：" .. keyData.user
        return
    end
    
    local today = os.date("%Y-%m-%d")
    if keyData.expire and today > keyData.expire then
        Status.Text = "密钥已过期"
        return
    end
    
    Status.Text = "验证成功！欢迎 " .. player.Name
    task.wait(0.6)
    ScreenGui:Destroy()
    -- 启动目标脚本
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/whenheet/jian/refs/heads/main/%E6%A3%80%E6%B5%8B2(5).lua"))()
    end)
end)
