local Pl=game:GetService("Players");local RS=game:GetService("RunService")
local UIS=game:GetService("UserInputService");local TS=game:GetService("TweenService")
local LP=Pl.LocalPlayer;local Cam=workspace.CurrentCamera
local SoundService=game:GetService("SoundService")
local Lighting=game:GetService("Lighting")
local gameName=game.Name
pcall(function()
    local ok,nf=pcall(function() return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) end)
    if ok and nf and nf.Name then gameName=nf.Name end
end)
local C={
    bg=Color3.fromRGB(32,32,32),surface=Color3.fromRGB(42,42,42),
    panel=Color3.fromRGB(55,55,55),card=Color3.fromRGB(68,68,68),
    cardHi=Color3.fromRGB(90,90,90),input=Color3.fromRGB(38,38,38),
    border=Color3.fromRGB(20,20,20),borderBr=Color3.fromRGB(110,110,110),
    acc=Color3.fromRGB(93,157,58),accLt=Color3.fromRGB(126,200,84),
    accDim=Color3.fromRGB(40,68,22),accDark=Color3.fromRGB(20,40,10),
    cyan=Color3.fromRGB(93,157,58),cyanDim=Color3.fromRGB(40,68,22),
    vio=Color3.fromRGB(130,60,190),vioDim=Color3.fromRGB(52,24,76),
    rose=Color3.fromRGB(200,60,60),roseDim=Color3.fromRGB(80,20,20),
    rage=Color3.fromRGB(255,60,60),rageLt=Color3.fromRGB(255,110,110),rageDim=Color3.fromRGB(100,20,20),
    legit=Color3.fromRGB(93,185,80),legitLt=Color3.fromRGB(130,220,110),legitDim=Color3.fromRGB(32,70,24),
    txt=Color3.fromRGB(255,255,255),sub=Color3.fromRGB(200,200,200),mut=Color3.fromRGB(130,130,130),
    white=Color3.fromRGB(255,255,255),red=Color3.fromRGB(255,60,60),gold=Color3.fromRGB(255,215,0),
    eye1=Color3.fromRGB(93,157,58),eye2=Color3.fromRGB(255,215,0),
    teal=Color3.fromRGB(93,157,58),tealDim=Color3.fromRGB(40,68,22),
    sky=Color3.fromRGB(40,40,40),skyDark=Color3.fromRGB(28,28,28),
}
local MODE="Legit"
local TIER="Free"
local ti=TweenInfo.new
local function tw(o,p,t,s,d) TS:Create(o,ti(t or .2,s or Enum.EasingStyle.Quart,Enum.EasingDirection.Out,0,false,d or 0),p):Play() end
local function rnd(p,r) local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,r or 8);c.Parent=p end
local function bdr(p,col,th) local s=Instance.new("UIStroke");s.Color=col or C.border;s.Thickness=th or 1;s.ApplyStrokeMode=Enum.ApplyStrokeMode.Border;s.Parent=p end
local function grd(p,a,b,r,t1,t2)
    local g=Instance.new("UIGradient");g.Rotation=r or 90
    g.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,a),ColorSequenceKeypoint.new(1,b)})
    if t1 then g.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,t1),NumberSequenceKeypoint.new(1,t2 or t1)}) end
    g.Parent=p
end
local function gui(n)
    local g=Instance.new("ScreenGui");g.Name=n;g.ResetOnSpawn=false;g.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;g.IgnoreGuiInset=true
    local ok=pcall(function() g.Parent=gethui() end)
    if not ok then ok=pcall(function() g.Parent=game:GetService("CoreGui") end) end
    if not ok then pcall(function() g.Parent=LP:FindFirstChild("PlayerGui") or LP:WaitForChild("PlayerGui",3) end) end
    return g
end
local function fr(par,sz,pos,col,zi)
    local f=Instance.new("Frame");f.Size=sz or UDim2.new(0,100,0,100);f.Position=pos or UDim2.new(0,0,0,0)
    f.BackgroundColor3=col or C.card;f.BorderSizePixel=0;f.ZIndex=zi or 2;f.Parent=par;return f
end
local function lb(par,txt,sz,pos,col,fnt,ts,zi,xa)
    local l=Instance.new("TextLabel");l.Text=txt;l.Size=sz or UDim2.new(1,0,0,20);l.Position=pos or UDim2.new(0,0,0,0)
    l.BackgroundTransparency=1;l.TextColor3=col or C.txt;l.Font=fnt or Enum.Font.Gotham
    l.TextSize=ts or 13;l.ZIndex=zi or 3;l.TextXAlignment=xa or Enum.TextXAlignment.Center;l.Parent=par;return l
end
local function bt(par,txt,sz,pos,bg,tc,fnt,ts,zi)
    local b=Instance.new("TextButton");b.Text=txt;b.Size=sz or UDim2.new(0,100,0,32);b.Position=pos or UDim2.new(0,0,0,0)
    b.BackgroundColor3=bg or C.card;b.TextColor3=tc or C.txt;b.Font=fnt or Enum.Font.GothamBold
    b.TextSize=ts or 13;b.AutoButtonColor=false;b.BorderSizePixel=0;b.ZIndex=zi or 3;b.Parent=par;return b
end
local function mcStoneBg(par,zi)
    local z=zi or 1
    local bg=fr(par,UDim2.new(1,0,1,0),nil,Color3.fromRGB(32,32,32),z);bg.BorderSizePixel=0
    local cols={Color3.fromRGB(130,130,130),Color3.fromRGB(110,110,110),Color3.fromRGB(96,96,96),Color3.fromRGB(142,142,142)}
    for r=0,12 do for cc=0,18 do
        local px=fr(bg,UDim2.new(0,60,0,60),UDim2.new(0,cc*60,0,r*60),cols[((r+cc)%4)+1],z+1);px.BorderSizePixel=0
        local s=fr(px,UDim2.new(1,0,1,0),nil,Color3.fromRGB(0,0,0),z+2);s.BackgroundTransparency=((r+cc)%3==0) and 0.48 or 0.71;s.BorderSizePixel=0
    end end
    fr(par,UDim2.new(1,0,1,0),nil,Color3.fromRGB(0,0,0),z+3).BackgroundTransparency=0.45
end
local function mcBtn(par,txt,sz,pos,zi)
    local z=zi or 5
    local outer=fr(par,sz,pos,Color3.fromRGB(25,25,25),z);outer.BorderSizePixel=0
    local face=fr(outer,UDim2.new(1,-4,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(139,139,139),z+1);face.BorderSizePixel=0
    local tH=fr(outer,UDim2.new(1,-4,0,2),UDim2.new(0,2,0,0),Color3.fromRGB(198,198,198),z+2);tH.BorderSizePixel=0
    local lH=fr(outer,UDim2.new(0,2,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(198,198,198),z+2);lH.BorderSizePixel=0
    local bS=fr(outer,UDim2.new(1,-4,0,2),UDim2.new(0,2,1,-2),Color3.fromRGB(55,55,55),z+2);bS.BorderSizePixel=0
    local rS=fr(outer,UDim2.new(0,2,1,-4),UDim2.new(1,-2,0,2),Color3.fromRGB(55,55,55),z+2);rS.BorderSizePixel=0
    local sh=Instance.new("TextLabel");sh.Text=txt;sh.Size=UDim2.new(1,0,1,0);sh.Position=UDim2.new(0,1,0,1)
    sh.BackgroundTransparency=1;sh.TextColor3=Color3.fromRGB(60,60,60);sh.Font=Enum.Font.SciFi;sh.TextSize=13;sh.ZIndex=z+2;sh.Parent=face
    local btn=Instance.new("TextButton");btn.Text=txt;btn.Size=UDim2.new(1,0,1,0)
    btn.BackgroundTransparency=1;btn.TextColor3=Color3.fromRGB(255,255,255);btn.Font=Enum.Font.SciFi
    btn.TextSize=13;btn.AutoButtonColor=false;btn.BorderSizePixel=0;btn.ZIndex=z+3;btn.Parent=face
    btn.MouseEnter:Connect(function() face.BackgroundColor3=Color3.fromRGB(160,160,255) end)
    btn.MouseLeave:Connect(function() face.BackgroundColor3=Color3.fromRGB(139,139,139) end)
    btn.MouseButton1Down:Connect(function() tH.BackgroundColor3=Color3.fromRGB(55,55,55);lH.BackgroundColor3=Color3.fromRGB(55,55,55);bS.BackgroundColor3=Color3.fromRGB(198,198,198);rS.BackgroundColor3=Color3.fromRGB(198,198,198) end)
    btn.MouseButton1Up:Connect(function() tH.BackgroundColor3=Color3.fromRGB(198,198,198);lH.BackgroundColor3=Color3.fromRGB(198,198,198);bS.BackgroundColor3=Color3.fromRGB(55,55,55);rS.BackgroundColor3=Color3.fromRGB(55,55,55) end)
    return btn,face,outer
end
local function mcLbl(par,txt,sz,pos,col,ts,zi,xa)
    local sh=Instance.new("TextLabel");sh.Text=txt;sh.Size=sz or UDim2.new(1,0,0,20)
    local p=pos or UDim2.new(0,0,0,0)
    sh.Position=UDim2.new(p.X.Scale,p.X.Offset+1,p.Y.Scale,p.Y.Offset+1)
    sh.BackgroundTransparency=1;sh.TextColor3=Color3.fromRGB(60,60,60);sh.Font=Enum.Font.SciFi
    sh.TextSize=ts or 13;sh.ZIndex=(zi or 3)-1;sh.TextXAlignment=xa or Enum.TextXAlignment.Center;sh.Parent=par
    local l=Instance.new("TextLabel");l.Text=txt;l.Size=sz or UDim2.new(1,0,0,20);l.Position=p
    l.BackgroundTransparency=1;l.TextColor3=col or Color3.fromRGB(255,255,255);l.Font=Enum.Font.SciFi
    l.TextSize=ts or 13;l.ZIndex=zi or 3;l.TextXAlignment=xa or Enum.TextXAlignment.Center;l.Parent=par
    return l
end
local function mcItemFrame(par,sz,pos,zi)
    local z=zi or 5
    local f=fr(par,sz,pos,Color3.fromRGB(55,55,55),z);f.BorderSizePixel=0
    fr(f,UDim2.new(1,0,0,4),nil,Color3.fromRGB(185,185,185),z+1).BorderSizePixel=0
    fr(f,UDim2.new(1,0,0,4),UDim2.new(0,0,1,-4),Color3.fromRGB(45,45,45),z+1).BorderSizePixel=0
    fr(f,UDim2.new(0,4,1,0),nil,Color3.fromRGB(185,185,185),z+1).BorderSizePixel=0
    fr(f,UDim2.new(0,4,1,0),UDim2.new(1,-4,0,0),Color3.fromRGB(45,45,45),z+1).BorderSizePixel=0
    return f
end
local function mcMeowlPortrait(par,sz,pos,zi)
    local frame=mcItemFrame(par,sz,pos,zi)
    local img=Instance.new("ImageLabel");img.Size=UDim2.new(1,-8,1,-8);img.Position=UDim2.new(0,4,0,4)
    img.BackgroundTransparency=1;img.Image="rbxthumb://type=Asset&id=95013312984287&w=420&h=420";img.ScaleType=Enum.ScaleType.Fit;img.ZIndex=(zi or 5)+2;img.Parent=frame
    return frame,img
end
local KEYS={
    {key="meowl",      tier="Free",    col=C.legit, badge="FREE"},
    {key="comingsoon", tier="Premium", col=C.acc,   badge="PREMIUM"},
    {key="ninjakirk_2",tier="Owner",   col=C.gold,  badge="OWNER"},
}
local MG=gui("MS_Mode");MG.Enabled=false
local mgBg=fr(MG,UDim2.new(1,0,1,0),nil,Color3.fromRGB(10,10,12),1)
grd(mgBg,Color3.fromRGB(10,10,12),Color3.fromRGB(18,18,22),90)
local mgPanel=fr(MG,UDim2.new(0,360,0,340),UDim2.new(0.5,-180,0.5,-170),Color3.fromRGB(18,18,22),3)
rnd(mgPanel,20);bdr(mgPanel,Color3.fromRGB(55,55,65),1.2)
local mgAccent=fr(mgPanel,UDim2.new(1,0,0,3),nil,C.legit,4);rnd(mgAccent,20)
local mgLogo,_=mcMeowlPortrait(mgPanel,UDim2.new(0,64,0,64),UDim2.new(0.5,-32,0,20),5)
lb(mgPanel,"MEOWL SENSE",UDim2.new(1,0,0,24),UDim2.new(0,0,0,92),Color3.fromRGB(255,255,255),Enum.Font.GothamBold,18,5)
lb(mgPanel,"Choose your mode",UDim2.new(1,0,0,16),UDim2.new(0,0,0,118),C.mut,Enum.Font.Gotham,12,4)
fr(mgPanel,UDim2.new(1,-40,0,1),UDim2.new(0,20,0,140),Color3.fromRGB(45,45,55),4)
local mStatusLbl=lb(MG,"",UDim2.new(1,0,0,14),UDim2.new(0,0,1,-20),C.sub,Enum.Font.Gotham,10,6)
local MODES={
    {id="Legit",col=C.legit, colD=C.legitDim,badge="SAFE", desc="Subtle & undetected",y=152},
    {id="Rage", col=C.rage,  colD=C.rageDim, badge="RAGE", desc="Full power mode",     y=210},
    {id="HvH",  col=C.vio,   colD=C.vioDim,  badge="HvH",  desc="Hack vs Hack",        y=268},
}
local modeBtns={}
for _,md in ipairs(MODES) do
    local mBtn=bt(mgPanel,"",UDim2.new(1,-40,0,48),UDim2.new(0,20,0,md.y),Color3.fromRGB(24,24,30),C.white,Enum.Font.GothamBold,13,5)
    rnd(mBtn,12);bdr(mBtn,Color3.fromRGB(50,50,62),1)
    local mAccL=fr(mBtn,UDim2.new(0,3,0,16),UDim2.new(0,6,.5,-8),md.col,6);rnd(mAccL,2)
    lb(mBtn,md.id,UDim2.new(1,-100,0,18),UDim2.new(0,20,0,7),C.txt,Enum.Font.GothamBold,13,6,Enum.TextXAlignment.Left)
    lb(mBtn,"["..md.badge.."]  "..md.desc,UDim2.new(1,-100,0,14),UDim2.new(0,20,0,26),md.col,Enum.Font.Gotham,10,6,Enum.TextXAlignment.Left)
    mBtn.MouseEnter:Connect(function() tw(mBtn,{BackgroundColor3=Color3.fromRGB(32,32,40)},.12) end)
    mBtn.MouseLeave:Connect(function() tw(mBtn,{BackgroundColor3=Color3.fromRGB(24,24,30)},.18) end)
    modeBtns[md.id]={btn=mBtn,data=md}
end
local function doMode(md)
    MODE=md.id
    mStatusLbl.Text="Loading "..md.id.."...";mStatusLbl.TextColor3=md.col
    tw(mgPanel,{BackgroundTransparency=1},.3)
    task.wait(0.4);MG.Enabled=false;loadMain()
end
for _,md in ipairs(MODES) do
    modeBtns[md.id].btn.MouseButton1Click:Connect(function() doMode(md) end)
end
local function showModeSelector()
    MG.Enabled=true
end
local KG=gui("MS_Key")
local kBg=fr(KG,UDim2.new(1,0,1,0),nil,Color3.fromRGB(8,8,10),1)
grd(kBg,Color3.fromRGB(8,8,10),Color3.fromRGB(16,16,20),90)
local glow1=fr(KG,UDim2.new(0,500,0,500),UDim2.new(0.5,-400,0,-100),Color3.fromRGB(93,185,80),2)
glow1.BackgroundTransparency=0.94;rnd(glow1,250)
local glow2=fr(KG,UDim2.new(0,400,0,400),UDim2.new(1,-100,1,-200),Color3.fromRGB(93,157,58),2)
glow2.BackgroundTransparency=0.92;rnd(glow2,200)
local KP=fr(KG,UDim2.new(0,460,0,400),UDim2.new(0.5,-230,0.5,-200),Color3.fromRGB(16,16,20),5)
rnd(KP,22);bdr(KP,Color3.fromRGB(50,50,62),1.2)
local kAccent=fr(KP,UDim2.new(0.6,0,0,3),UDim2.new(0.2,0,0,0),C.legit,6);rnd(kAccent,3)
grd(kAccent,Color3.fromRGB(0,0,0),C.legit,0,1,0)
local kAccent2=fr(KP,UDim2.new(0.6,0,0,3),UDim2.new(0.2,0,0,0),C.legit,6);rnd(kAccent2,3)
grd(kAccent2,C.legit,Color3.fromRGB(0,0,0),0,0,1)
local kLogo,_=mcMeowlPortrait(KP,UDim2.new(0,70,0,70),UDim2.new(0.5,-35,0,22),7)
lb(KP,"MEOWL SENSE",UDim2.new(1,0,0,26),UDim2.new(0,0,0,102),Color3.fromRGB(255,255,255),Enum.Font.GothamBold,20,7)
lb(KP,"Enter your key to continue",UDim2.new(1,0,0,16),UDim2.new(0,0,0,132),C.mut,Enum.Font.Gotham,12,6)
fr(KP,UDim2.new(1,-40,0,1),UDim2.new(0,20,0,156),Color3.fromRGB(40,40,52),6)
local kTierBadge=lb(KP,"",UDim2.new(1,0,0,14),UDim2.new(0,0,0,160),C.mut,Enum.Font.GothamBold,10,6)
local Kbox=Instance.new("TextBox")
Kbox.Size=UDim2.new(1,-40,0,46);Kbox.Position=UDim2.new(0,20,0,180)
Kbox.BackgroundColor3=Color3.fromRGB(22,22,28);Kbox.TextColor3=Color3.fromRGB(255,255,255)
Kbox.PlaceholderColor3=Color3.fromRGB(80,80,95);Kbox.PlaceholderText="Enter key..."
Kbox.Text="";Kbox.Font=Enum.Font.Gotham;Kbox.TextSize=15
Kbox.ClearTextOnFocus=false;Kbox.BorderSizePixel=0;Kbox.ZIndex=8
Kbox.TextXAlignment=Enum.TextXAlignment.Left;Kbox.Parent=KP
rnd(Kbox,12);bdr(Kbox,Color3.fromRGB(55,55,68),1)
local kbPad=Instance.new("UIPadding");kbPad.PaddingLeft=UDim.new(0,14);kbPad.Parent=Kbox
local dotsFrame=fr(KP,UDim2.new(1,-40,0,16),UDim2.new(0,20,0,234),Color3.fromRGB(0,0,0),7);dotsFrame.BackgroundTransparency=1
lb(dotsFrame,"Attempts:",UDim2.new(0,70,1,0),nil,C.mut,Enum.Font.Gotham,10,8,Enum.TextXAlignment.Left)
local dot1=fr(dotsFrame,UDim2.new(0,10,0,10),UDim2.new(0,72,0.5,-5),C.legit,8);rnd(dot1,5)
local dot2=fr(dotsFrame,UDim2.new(0,10,0,10),UDim2.new(0,86,0.5,-5),C.legit,8);rnd(dot2,5)
local dot3=fr(dotsFrame,UDim2.new(0,10,0,10),UDim2.new(0,100,0.5,-5),C.legit,8);rnd(dot3,5)
local dots={dot1,dot2,dot3}
local Kbtn=bt(KP,"AUTHENTICATE",UDim2.new(1,-40,0,46),UDim2.new(0,20,0,258),C.legit,Color3.fromRGB(8,8,10),Enum.Font.GothamBold,14,8)
rnd(Kbtn,12)
Kbtn.MouseEnter:Connect(function() tw(Kbtn,{BackgroundColor3=C.legitLt},.12) end)
Kbtn.MouseLeave:Connect(function() tw(Kbtn,{BackgroundColor3=C.legit},.18) end)
local Kst=lb(KP,"",UDim2.new(1,-40,0,16),UDim2.new(0,20,0,312),C.red,Enum.Font.Gotham,11,8)
lb(KP,"discord.gg/CWtD5thj",UDim2.new(1,0,0,14),UDim2.new(0,0,0,340),Color3.fromRGB(60,60,75),Enum.Font.Gotham,10,7)
lb(KP,"MeowlSense v14",UDim2.new(1,0,0,14),UDim2.new(0,0,0,358),Color3.fromRGB(45,45,58),Enum.Font.Gotham,9,7)
local attempts=0
local function updateDots()
    for i,d in ipairs(dots) do
        tw(d,{BackgroundColor3=i<=attempts and C.rage or C.legit},.15)
    end
end
local function kickPlayer()
    task.wait(1.5)
    game:GetService("TeleportService"):Teleport(game.PlaceId,LP)
    task.wait(2)
    pcall(function() LP:Kick("Stop guessing the key, just join the discord: discord.gg/CWtD5thj") end)
end
local function tryKey()
    local entered=Kbox.Text:match("^%s*(.-)%s*$")
    local matched=nil
    for _,k in ipairs(KEYS) do
        if entered:lower()==k.key:lower() then matched=k;break end
    end
    if matched then
        TIER=matched.tier
        tw(kAccent,{BackgroundColor3=matched.col},.3)
        tw(kAccent2,{BackgroundColor3=matched.col},.3)
        tw(Kbtn,{BackgroundColor3=matched.col},.3)
        kTierBadge.Text="["..matched.badge.."] Access granted"
        kTierBadge.TextColor3=matched.col
        Kst.Text="✓  Welcome! Loading...";Kst.TextColor3=C.legit
        Kbox.TextEditable=false
        task.wait(0.6);KG:Destroy();showModeSelector()
    else
        attempts=attempts+1
        updateDots()
        tw(KP,{Position=UDim2.new(0.5,-230,0.5,-200)},.05)
        tw(KP,{Position=UDim2.new(0.5,-220,0.5,-200)},.05,Enum.EasingStyle.Bounce,0.05)
        tw(KP,{Position=UDim2.new(0.5,-230,0.5,-200)},.1,Enum.EasingStyle.Bounce,0.1)
        tw(Kbtn,{BackgroundColor3=C.rage},.08)
        task.delay(.5,function() tw(Kbtn,{BackgroundColor3=C.legit},.2) end)
        if attempts>=3 then
            Kst.Text="✗  Too many attempts — kicking...";Kst.TextColor3=C.rage
            Kbox.TextEditable=false;Kbtn.Active=false
            kickPlayer()
        else
            Kst.Text="✗  Wrong key  ("..attempts.."/3 attempts)";Kst.TextColor3=C.red
            Kbox.Text=""
        end
    end
end
Kbtn.MouseButton1Click:Connect(tryKey)
Kbox.FocusLost:Connect(function(enter) if enter then tryKey() end end)
function loadMain()
    MG.Enabled=false
    local isDev=(LP.Name=="mediansymbol519") or TIER=="Owner"
    local A={c=MODE=="Rage" and C.rage or MODE=="HvH" and C.vio or C.legit, l=MODE=="Rage" and C.rageLt or MODE=="HvH" and Color3.fromRGB(180,110,255) or C.legitLt, d=MODE=="Rage" and C.rageDim or MODE=="HvH" and C.vioDim or C.legitDim}
    local S={
        speedOn=true,speedVal=16,noclipOn=false,flyOn=true,flyVal=80,jumpOn=true,bhopOn=true,
        espOn=true,espBoxOn=true,espNameOn=true,espCol=A.c,
        aimbotOn=true,visCheck=false,switchDelay=3,jitterOn=false,jitterVal=2,maxDist=500,multipointOn=false,
        aimbotSmooth=0.15,fakeLagOn=false,fakeLagMs=200,
        spinOn=false,spinVal=5000,boxType="Full",boxFill=false,antiFlingOn=false,
        triggerbotOn=MODE=="Rage",triggerbotFov=30,
        silentAimOn=false,
    }
    local flying=false;local flyActive=false;local spinA=0
    local invOn=false;local invFloorY=nil;local invBP=nil;local espD={}
    local aimbotLast=nil;local aimbotTick=0
    local MPARTS={"Head","UpperTorso","Torso","LowerTorso"}
    local G=gui("MS_Main");local BG=gui("MS_Box")
    local acReg={}
    local SILENT_SIZE_LEGIT=8
    local SILENT_SIZE_RAGE=40
    local silentOrigSizes={}
    local silentOrigTrans={}
    local function mouse1click()
    end
    local Win=fr(G,UDim2.new(0,700,0,500),UDim2.new(.5,-350,.5,-250),Color3.fromRGB(30,30,30),2)
    Win.Active=true;Win.Draggable=true;Win.BorderSizePixel=0
    fr(Win,UDim2.new(1,0,0,3),nil,Color3.fromRGB(198,198,198),3).BorderSizePixel=0
    fr(Win,UDim2.new(1,0,0,3),UDim2.new(0,0,1,-3),Color3.fromRGB(55,55,55),3).BorderSizePixel=0
    fr(Win,UDim2.new(0,3,1,0),nil,Color3.fromRGB(198,198,198),3).BorderSizePixel=0
    fr(Win,UDim2.new(0,3,1,0),UDim2.new(1,-3,0,0),Color3.fromRGB(55,55,55),3).BorderSizePixel=0
    fr(Win,UDim2.new(1,0,1,-54),UDim2.new(0,0,0,54),Color3.fromRGB(28,28,28),1).BorderSizePixel=0
    local Hdr=fr(Win,UDim2.new(1,0,0,54),nil,Color3.fromRGB(15,15,15),10);Hdr.BorderSizePixel=0
    fr(Win,UDim2.new(1,0,0,2),UDim2.new(0,0,0,54),Color3.fromRGB(0,0,0),11).BorderSizePixel=0
    fr(Win,UDim2.new(1,0,0,1),UDim2.new(0,0,0,56),Color3.fromRGB(100,100,100),11).BorderSizePixel=0
    local logo,_=mcMeowlPortrait(Hdr,UDim2.new(0,40,0,40),UDim2.new(0,10,.5,-20),12)
    mcLbl(Hdr,"MEOWL SENSE",UDim2.new(0,165,0,18),UDim2.new(0,58,.5,-20),Color3.fromRGB(255,255,255),13,14,Enum.TextXAlignment.Left)
    local gameModeLbl=mcLbl(Hdr,gameName.."  "..MODE.."  "..TIER,UDim2.new(0,265,0,12),UDim2.new(0,58,.5,2),Color3.fromRGB(160,160,160),9,13,Enum.TextXAlignment.Left)
    acReg[#acReg+1]={obj=logo,prop="BackgroundColor3",role="d"}
    acReg[#acReg+1]={obj=gameModeLbl,prop="TextColor3",role="c"}
    local _pb,_pbf,_pbo=mcBtn(Hdr,"Preview",UDim2.new(0,64,0,24),UDim2.new(1,-102,.5,-12),12)
    local prevTogBtn=_pb
    local _mb,_mbf,_mbo=mcBtn(Hdr,"—",UDim2.new(0,28,0,26),UDim2.new(1,-34,.5,-13),12)
    local MinB=_mb
    local SB=fr(Win,UDim2.new(0,158,1,-76),UDim2.new(0,4,0,58),Color3.fromRGB(15,15,15),10)
    SB.BorderSizePixel=0
    fr(SB,UDim2.new(0,2,1,0),UDim2.new(1,-2,0,0),Color3.fromRGB(30,30,30),11).BorderSizePixel=0
    fr(SB,UDim2.new(0,1,1,0),UDim2.new(1,-1,0,0),Color3.fromRGB(80,80,80),11).BorderSizePixel=0
    local uBadge=fr(SB,UDim2.new(1,-10,0,50),UDim2.new(0,5,0,6),Color3.fromRGB(40,40,40),11);uBadge.BorderSizePixel=0
    fr(uBadge,UDim2.new(1,0,0,3),nil,Color3.fromRGB(100,100,100),12).BorderSizePixel=0
    fr(uBadge,UDim2.new(1,0,0,3),UDim2.new(0,0,1,-3),Color3.fromRGB(20,20,20),12).BorderSizePixel=0
    fr(uBadge,UDim2.new(0,3,1,0),nil,Color3.fromRGB(100,100,100),12).BorderSizePixel=0
    fr(uBadge,UDim2.new(0,3,1,0),UDim2.new(1,-3,0,0),Color3.fromRGB(20,20,20),12).BorderSizePixel=0
    local uIco,_=mcMeowlPortrait(uBadge,UDim2.new(0,36,0,36),UDim2.new(0,6,.5,-18),13)
    mcLbl(uBadge,TIER,UDim2.new(1,-50,0,16),UDim2.new(0,48,0,7),Color3.fromRGB(255,215,0),10,13,Enum.TextXAlignment.Left)
    mcLbl(uBadge,"Active",UDim2.new(1,-50,0,12),UDim2.new(0,48,0,27),Color3.fromRGB(160,160,160),8,12,Enum.TextXAlignment.Left)
    acReg[#acReg+1]={obj=uIco,prop="BackgroundColor3",role="d"}
    fr(SB,UDim2.new(1,0,0,2),UDim2.new(0,0,0,62),Color3.fromRGB(0,0,0),11).BorderSizePixel=0
    fr(SB,UDim2.new(1,0,0,1),UDim2.new(0,0,0,64),Color3.fromRGB(80,80,80),11).BorderSizePixel=0
    local TABS={
        {id="movement", lbl="Movement", ico="MV", icol=Color3.fromRGB(80,160,255)},
        {id="combat",   lbl="Combat",   ico="CB", icol=Color3.fromRGB(255,80,80)},
        {id="teleport", lbl="Teleport", ico="TP", icol=Color3.fromRGB(255,180,50)},
        {id="players",  lbl="Players",  ico="PL", icol=Color3.fromRGB(80,220,140)},
        {id="world",    lbl="World",    ico="WD", icol=Color3.fromRGB(100,200,255)},
        {id="music",    lbl="Music",    ico="♪",  icol=Color3.fromRGB(255,130,200)},
        {id="invisible",lbl="Invisible",ico="IV", icol=Color3.fromRGB(180,80,255)},
        {id="chat",     lbl="Chat Spam", ico="CS", icol=Color3.fromRGB(255,200,50)},
        {id="ragebot",  lbl="Ragebot",   ico="RB", icol=Color3.fromRGB(255,60,60)},
        {id="settings", lbl="Settings", ico="ST", icol=Color3.fromRGB(140,140,200)},
    }
    local TD={};local pages={}
    for i,t in ipairs(TABS) do
        local outer=fr(SB,UDim2.new(1,-10,0,30),UDim2.new(0,5,0,68+(i-1)*34),Color3.fromRGB(25,25,25),11);outer.BorderSizePixel=0
        local face=fr(outer,UDim2.new(1,-4,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(55,55,55),12);face.BorderSizePixel=0
        local tH=fr(outer,UDim2.new(1,-4,0,2),UDim2.new(0,2,0,0),Color3.fromRGB(90,90,90),13);tH.BorderSizePixel=0
        local lH=fr(outer,UDim2.new(0,2,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(90,90,90),13);lH.BorderSizePixel=0
        local bS=fr(outer,UDim2.new(1,-4,0,2),UDim2.new(0,2,1,-2),Color3.fromRGB(20,20,20),13);bS.BorderSizePixel=0
        local rS=fr(outer,UDim2.new(0,2,1,-4),UDim2.new(1,-2,0,2),Color3.fromRGB(20,20,20),13);rS.BorderSizePixel=0
        local actInd=fr(face,UDim2.new(0,2,0,16),UDim2.new(0,2,.5,-8),A.c,14);actInd.BackgroundTransparency=1
        local icoBox=fr(face,UDim2.new(0,20,0,20),UDim2.new(0,6,.5,-10),Color3.fromRGB(30,30,30),14)
        fr(icoBox,UDim2.new(1,0,0,1),nil,Color3.fromRGB(80,80,80),15).BorderSizePixel=0
        lb(icoBox,t.ico,UDim2.new(1,0,1,0),nil,t.icol,Enum.Font.SciFi,7,15)
        local lbl=lb(face,t.lbl,UDim2.new(1,-32,1,0),UDim2.new(0,30,0,0),Color3.fromRGB(160,160,160),Enum.Font.SciFi,10,14,Enum.TextXAlignment.Left)
        local btn=Instance.new("TextButton");btn.Text="";btn.Size=UDim2.new(1,0,1,0)
        btn.BackgroundTransparency=1;btn.ZIndex=16;btn.Parent=face;btn.BorderSizePixel=0
        TD[t.id]={btn=btn,lbl=lbl,ind=actInd,ico=icoBox,face=face,tH=tH,lH=lH,bS=bS,rS=rS}
        acReg[#acReg+1]={obj=actInd,prop="BackgroundColor3",role="c"}
        btn.MouseEnter:Connect(function()
            if not pages[t.id].Visible then face.BackgroundColor3=Color3.fromRGB(80,80,80) end
        end)
        btn.MouseLeave:Connect(function()
            if not pages[t.id].Visible then face.BackgroundColor3=Color3.fromRGB(55,55,55) end
        end)
        btn.MouseButton1Down:Connect(function()
            tH.BackgroundColor3=Color3.fromRGB(20,20,20);lH.BackgroundColor3=Color3.fromRGB(20,20,20)
            bS.BackgroundColor3=Color3.fromRGB(90,90,90);rS.BackgroundColor3=Color3.fromRGB(90,90,90)
        end)
        btn.MouseButton1Up:Connect(function()
            tH.BackgroundColor3=Color3.fromRGB(90,90,90);lH.BackgroundColor3=Color3.fromRGB(90,90,90)
            bS.BackgroundColor3=Color3.fromRGB(20,20,20);rS.BackgroundColor3=Color3.fromRGB(20,20,20)
        end)
    end
    local Host=fr(Win,UDim2.new(1,-170,1,-78),UDim2.new(0,166,0,60),Color3.fromRGB(0,0,0),9);Host.BackgroundTransparency=1
    local function newPage()
        local p=Instance.new("ScrollingFrame");p.Size=UDim2.new(1,0,1,0);p.BackgroundTransparency=1
        p.BorderSizePixel=0;p.ScrollBarThickness=3;p.ScrollBarImageColor3=Color3.fromRGB(139,139,139)
        p.CanvasSize=UDim2.new(0,0,0,0);p.Visible=false;p.ZIndex=10;p.Parent=Host
        local ll=Instance.new("UIListLayout");ll.SortOrder=Enum.SortOrder.LayoutOrder;ll.Padding=UDim.new(0,4);ll.Parent=p
        local pd=Instance.new("UIPadding");pd.PaddingTop=UDim.new(0,6);pd.PaddingBottom=UDim.new(0,12);pd.PaddingRight=UDim.new(0,6);pd.Parent=p
        ll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() p.CanvasSize=UDim2.new(0,0,0,ll.AbsoluteContentSize.Y+18) end)
        return p
    end
    for _,t in ipairs(TABS) do pages[t.id]=newPage() end
    local function switchTab(id)
        for _,t in ipairs(TABS) do
            local a=(t.id==id);local d=TD[t.id];pages[t.id].Visible=a
            tw(d.ind,{BackgroundTransparency=a and 0 or 1})
            d.face.BackgroundColor3=a and Color3.fromRGB(100,100,160) or Color3.fromRGB(55,55,55)
            tw(d.lbl,{TextColor3=a and C.white or Color3.fromRGB(160,160,160)})
        end
    end
    for _,t in ipairs(TABS) do TD[t.id].btn.MouseButton1Click:Connect(function() switchTab(t.id) end) end
    switchTab("movement")
    local SBarOuter=fr(Win,UDim2.new(1,-8,0,24),UDim2.new(0,4,1,-28),Color3.fromRGB(25,25,25),10);SBarOuter.BorderSizePixel=0
    local SBarFace=fr(SBarOuter,UDim2.new(1,-4,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(55,55,55),11);SBarFace.BorderSizePixel=0
    fr(SBarOuter,UDim2.new(1,-4,0,2),UDim2.new(0,2,0,0),Color3.fromRGB(90,90,90),12).BorderSizePixel=0
    fr(SBarOuter,UDim2.new(0,2,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(90,90,90),12).BorderSizePixel=0
    fr(SBarOuter,UDim2.new(1,-4,0,2),UDim2.new(0,2,1,-2),Color3.fromRGB(20,20,20),12).BorderSizePixel=0
    fr(SBarOuter,UDim2.new(0,2,1,-4),UDim2.new(1,-2,0,2),Color3.fromRGB(20,20,20),12).BorderSizePixel=0
    local StLbl=lb(SBarFace,"F = Fly  ·  RMB = Aim  ·  RShift = Hide",UDim2.new(1,-10,1,0),UDim2.new(0,6,0,0),Color3.fromRGB(160,160,160),Enum.Font.SciFi,9,12,Enum.TextXAlignment.Left)
    local function recolor(newC,newL,newD)
        A.c=newC;A.l=newL;A.d=newD
        local map={c=newC,l=newL,d=newD}
        for _,e in ipairs(acReg) do
            pcall(function()
                if not e.obj or not e.obj.Parent then return end
                if e._isTog then e.obj.BackgroundColor3=e._getOn() and newC or C.input
                else e.obj[e.prop]=map[e.role] end
            end)
        end
        S.espCol=newC
        for _,d in pairs(espD) do
            if d.hl then d.hl.OutlineColor=newC end
            for _,v in pairs(d.bx or {}) do pcall(function() v.BackgroundColor3=newC end) end
            if d.ng then local nl=d.ng:FindFirstChildWhichIsA("TextLabel");if nl then nl.TextColor3=newC end end
        end
    end
    local function sec(pg,title,lo)
        local f=fr(pg,UDim2.new(1,0,0,22),nil,C.bg,10);f.BackgroundTransparency=1;f.LayoutOrder=lo
        local sh=Instance.new("TextLabel");sh.Text=title:upper();sh.Size=UDim2.new(0,80,1,0)
        sh.Position=UDim2.new(0,3,0,1);sh.BackgroundTransparency=1;sh.TextColor3=Color3.fromRGB(60,60,60)
        sh.Font=Enum.Font.SciFi;sh.TextSize=9;sh.ZIndex=10;sh.TextXAlignment=Enum.TextXAlignment.Left;sh.Parent=f
        lb(f,title:upper(),UDim2.new(0,80,1,0),UDim2.new(0,2,0,0),Color3.fromRGB(180,180,180),Enum.Font.SciFi,9,11,Enum.TextXAlignment.Left)
        fr(f,UDim2.new(1,-86,0,1),UDim2.new(86,0,0,10),Color3.fromRGB(80,80,80),11).BorderSizePixel=0
    end
    local function tog(pg,title,desc,def,lo,cb)
        local outer=fr(pg,UDim2.new(1,0,0,52),nil,Color3.fromRGB(25,25,25),10);outer.LayoutOrder=lo;outer.BorderSizePixel=0
        local card=fr(outer,UDim2.new(1,-4,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(68,68,68),11);card.BorderSizePixel=0
        fr(outer,UDim2.new(1,-4,0,2),UDim2.new(0,2,0,0),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
        fr(outer,UDim2.new(0,2,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
        fr(outer,UDim2.new(1,-4,0,2),UDim2.new(0,2,1,-2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
        fr(outer,UDim2.new(0,2,1,-4),UDim2.new(1,-2,0,2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
        mcLbl(card,title,UDim2.new(1,-80,0,18),UDim2.new(0,14,0,6),Color3.fromRGB(255,255,255),11,13,Enum.TextXAlignment.Left)
        mcLbl(card,desc,UDim2.new(1,-80,0,13),UDim2.new(0,14,0,26),Color3.fromRGB(160,160,160),9,12,Enum.TextXAlignment.Left)
        local track=fr(card,UDim2.new(0,44,0,22),UDim2.new(1,-58,.5,-11),def and A.c or C.input,5);rnd(track,11);bdr(track,def and A.c or C.border,.8)
        local knob=fr(track,UDim2.new(0,18,0,18),def and UDim2.new(1,-20,.5,-9) or UDim2.new(0,2,.5,-9),C.white,6);rnd(knob,9)
        local clk=bt(card,"",UDim2.new(1,0,1,0),nil,C.bg,C.white,Enum.Font.SciFi,13,7);clk.BackgroundTransparency=1
        local on=def
        acReg[#acReg+1]={obj=track,_isTog=true,_getOn=function() return on end}
        clk.MouseButton1Click:Connect(function()
            on=not on
            tw(track,{BackgroundColor3=on and A.c or C.input},.15)
            tw(knob,{Position=on and UDim2.new(1,-20,.5,-9) or UDim2.new(0,2,.5,-9)},.15,Enum.EasingStyle.Back)
            cb(on)
        end)
        card.MouseEnter:Connect(function() tw(card,{BackgroundColor3=C.cardHi},.12) end)
        card.MouseLeave:Connect(function() tw(card,{BackgroundColor3=C.card},.18) end)
    end
    local function sld(pg,title,mn,mx,dv,lo,cb)
        local outer=fr(pg,UDim2.new(1,0,0,60),nil,Color3.fromRGB(25,25,25),10);outer.LayoutOrder=lo;outer.BorderSizePixel=0
        local card=fr(outer,UDim2.new(1,-4,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(68,68,68),11);card.BorderSizePixel=0
        fr(outer,UDim2.new(1,-4,0,2),UDim2.new(0,2,0,0),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
        fr(outer,UDim2.new(0,2,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
        fr(outer,UDim2.new(1,-4,0,2),UDim2.new(0,2,1,-2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
        fr(outer,UDim2.new(0,2,1,-4),UDim2.new(1,-2,0,2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
        mcLbl(card,title,UDim2.new(.6,0,0,16),UDim2.new(0,14,0,5),Color3.fromRGB(255,255,255),11,13,Enum.TextXAlignment.Left)
        local vl=lb(card,tostring(dv),UDim2.new(.35,0,0,16),UDim2.new(.65,-16,0,6),A.l,Enum.Font.SciFi,12,4,Enum.TextXAlignment.Right)
        local trkBg=fr(card,UDim2.new(1,-32,0,4),UDim2.new(0,16,0,38),C.input,4);rnd(trkBg,3)
        local trkFill=fr(trkBg,UDim2.new((dv-mn)/(mx-mn),0,1,0),nil,A.c,5);rnd(trkFill,3);grd(trkFill,A.d,A.c,0)
        local knob=bt(trkBg,"",UDim2.new(0,14,0,14),UDim2.new((dv-mn)/(mx-mn),0,.5,0),C.white,C.white,Enum.Font.SciFi,1,6)
        acReg[#acReg+1]={obj=trkFill,prop="BackgroundColor3",role="c"}
        acReg[#acReg+1]={obj=vl,prop="TextColor3",role="l"}
        knob.AnchorPoint=Vector2.new(.5,.5);rnd(knob,7);local drag=false
        knob.MouseButton1Down:Connect(function() drag=true end)
        UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end end)
        pcall(function()
                UIS.InputChanged:Connect(function(i)
            if not drag or i.UserInputType~=Enum.UserInputType.MouseMovement then return end
            local r=math.clamp((i.Position.X-trkBg.AbsolutePosition.X)/trkBg.AbsoluteSize.X,0,1)
            local v=math.floor(mn+(mx-mn)*r);trkFill.Size=UDim2.new(r,0,1,0);knob.Position=UDim2.new(r,0,.5,0);vl.Text=tostring(v);cb(v)
        end)
        end)
        card.MouseEnter:Connect(function() card.BackgroundColor3=Color3.fromRGB(90,90,90) end)
        card.MouseLeave:Connect(function() card.BackgroundColor3=Color3.fromRGB(68,68,68) end)
    end
    local function ml(col) local f=fr(BG,UDim2.new(0,2,0,2),nil,col,10);f.BorderSizePixel=0;return f end
    local function mkBox() return {h1=ml(S.espCol),h2=ml(S.espCol),h3=ml(S.espCol),h4=ml(S.espCol),v1=ml(S.espCol),v2=ml(S.espCol),v3=ml(S.espCol),v4=ml(S.espCol),fi=ml(S.espCol)} end
    local function hideBox(bx) if not bx then return end;for _,v in pairs(bx) do v.Visible=false end end
    local function colBox(bx,col) if not bx then return end;for _,v in pairs(bx) do v.BackgroundColor3=col end end
    local function setBoxF(f,fx,fy,fw,fh,vis) f.Position=UDim2.new(0,fx,0,fy);f.Size=UDim2.new(0,fw,0,fh);f.Visible=vis end
    local function setBox(bx,x1,y1,x2,y2)
        local th=2;local w=x2-x1;local h=y2-y1
        if S.boxType=="Corner" then
            local cl=math.max(6,math.floor(math.min(w,h)*0.22))
            setBoxF(bx.h1,x1,y1,cl,th,true);setBoxF(bx.h2,x2-cl,y1,cl,th,true)
            setBoxF(bx.h3,x1,y2,cl,th,true);setBoxF(bx.h4,x2-cl,y2,cl,th,true)
            setBoxF(bx.v1,x1,y1,th,cl,true);setBoxF(bx.v2,x2-th,y1,th,cl,true)
            setBoxF(bx.v3,x1,y2-cl,th,cl,true);setBoxF(bx.v4,x2-th,y2-cl,th,cl,true)
        else
            setBoxF(bx.h1,x1,y1,w,th,true);setBoxF(bx.h2,x1,y2,w,th,true)
            setBoxF(bx.v1,x1,y1,th,h,true);setBoxF(bx.v2,x2-th,y1,th,h,true)
            setBoxF(bx.h3,0,0,0,0,false);setBoxF(bx.h4,0,0,0,0,false);setBoxF(bx.v3,0,0,0,0,false);setBoxF(bx.v4,0,0,0,0,false)
        end
        bx.fi.BackgroundTransparency=0.75
        if S.boxFill then setBoxF(bx.fi,x1+th,y1+th,w-th*2,h-th*2,true) else bx.fi.Visible=false end
    end
    local vcP=RaycastParams.new();vcP.FilterType=Enum.RaycastFilterType.Exclude
    local function isVis(pt,ch) vcP.FilterDescendantsInstances={LP.Character or workspace,ch};return workspace:Raycast(Cam.CFrame.Position,pt.Position-Cam.CFrame.Position,vcP)==nil end
    local function rmvESP(p)
        local d=espD[p];if not d then return end
        pcall(function() if d.hl then d.hl:Destroy() end end);pcall(function() if d.ng then d.ng:Destroy() end end)
        if d.bx then hideBox(d.bx) end;espD[p]=nil
    end
    local function applyESP(plr,char)
        if plr==LP or not char then return end;rmvESP(plr);local d={}
        local hl=Instance.new("Highlight");hl.OutlineColor=S.espCol;hl.FillColor=Color3.fromRGB(14,10,30)
        hl.FillTransparency=.76;hl.OutlineTransparency=0;hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop;hl.Adornee=char;hl.Parent=char;d.hl=hl
        local bg=Instance.new("BillboardGui");bg.Size=UDim2.new(0,120,0,20);bg.StudsOffset=Vector3.new(0,3.5,0)
        bg.AlwaysOnTop=true;bg.Adornee=char:FindFirstChild("Head") or char.PrimaryPart;bg.Parent=char
        local nl=lb(bg,plr.Name,UDim2.new(1,0,1,0),nil,S.espCol,Enum.Font.SciFi,13,2)
        nl.TextStrokeTransparency=0;nl.TextStrokeColor3=C.bg;d.ng=bg
        d.bx=mkBox();hideBox(d.bx);espD[plr]=d
    end
    local function hookPlr(plr)
        if plr==LP then return end
        if plr.Character then task.wait(.1);applyESP(plr,plr.Character) end
        plr.CharacterAdded:Connect(function(ch) task.wait(.1);applyESP(plr,ch) end)
    end
    local mp=pages["movement"];sec(mp,"Movement",1)
    tog(mp,"Speed Boost","Override walk speed",true,2,function(on) S.speedOn=on
        if not on then local c=LP.Character;if c then local h=c:FindFirstChildOfClass("Humanoid");if h then h.WalkSpeed=16 end end end end)
    sld(mp,"Walk Speed",1,500,16,3,function(v) S.speedVal=v end)
    sec(mp,"Physics & Air",10)
    tog(mp,"Noclip","Phase through walls",false,11,function(on) S.noclipOn=on
        if not on then local c=LP.Character;if c then for _,pp in ipairs(c:GetDescendants()) do if pp:IsA("BasePart") then pp.CanCollide=true end end end end end)
    tog(mp,"Fly  (F key)","Toggle flight",true,12,function(on) S.flyOn=on
        if not on and flying then flying=false
            if fBV then fBV:Destroy();fBV=nil end;if fBG then fBG:Destroy();fBG=nil end;if fCn then fCn:Disconnect();fCn=nil end end end)
    sld(mp,"Fly Speed",1,300,80,13,function(v) S.flyVal=v end)
    tog(mp,"Infinite Jump","Jump again mid-air",true,14,function(on) S.jumpOn=on end)
    tog(mp,"Bhop","Auto-jump on land",true,15,function(on) S.bhopOn=on end)
    tog(mp,"Anti-Fling","Block velocity throws",false,16,function(on) S.antiFlingOn=on end)
    sec(mp,"Undetected",20)
    tog(mp,"Undetected Fly  (F)","CFrame-based, no BodyVelocity",true,21,function(on) S.flyOn=on;if not on then flying=false;flyActive=false end end)
    sld(mp,"Fly Speed",1,300,80,22,function(v) S.flyVal=v end)
    tog(mp,"Velocity Boost","Boost speed while holding WASD",false,23,function(on) S.uVelOn=on
        if not on then
            local c2=LP.Character
            if c2 then local hm=c2:FindFirstChildOfClass("Humanoid");if hm then hm.WalkSpeed=S.speedOn and S.speedVal or 16 end end
        end
    end)
    sld(mp,"Velocity Amount",1,200,60,24,function(v) S.uVelAmt=v end)
    local cp=pages["combat"];sec(cp,"ESP",1)
    tog(cp,"ESP Highlight","Glow through walls",true,2,function(on) S.espOn=on
        if on then for _,pl in ipairs(Pl:GetPlayers()) do hookPlr(pl) end
        else for pl,_ in pairs(espD) do rmvESP(pl) end end end)
    tog(cp,"Visual Check","Only show visible targets",false,3,function(on) S.visCheck=on end)
    tog(cp,"ESP Box","2D bounding box",true,4,function(on) S.espBoxOn=on
        if not on then for _,d in pairs(espD) do hideBox(d.bx) end end end)
    local btCard=fr(cp,UDim2.new(1,0,0,44),nil,C.card,3);btCard.LayoutOrder=5;rnd(btCard,10);bdr(btCard,C.border,.8)
    lb(btCard,"Box Style",UDim2.new(1,-130,0,14),UDim2.new(0,16,0,6),C.txt,Enum.Font.SciFi,11,4,Enum.TextXAlignment.Left)
    lb(btCard,"Full lines or corner brackets",UDim2.new(1,-130,0,12),UDim2.new(0,16,0,22),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
    local fBtn=bt(btCard,"Full",UDim2.new(0,52,0,22),UDim2.new(1,-112,.5,-11),A.c,C.bg,Enum.Font.SciFi,10,5);rnd(fBtn,6)
    local cBtn=bt(btCard,"Corner",UDim2.new(0,52,0,22),UDim2.new(1,-56,.5,-11),C.input,C.sub,Enum.Font.SciFi,10,5);rnd(cBtn,6);bdr(cBtn,C.border,.8)
    acReg[#acReg+1]={obj=fBtn,prop="BackgroundColor3",role="c"}
    fBtn.MouseButton1Click:Connect(function() S.boxType="Full";tw(fBtn,{BackgroundColor3=A.c,TextColor3=C.bg});tw(cBtn,{BackgroundColor3=C.input,TextColor3=C.sub}) end)
    cBtn.MouseButton1Click:Connect(function() S.boxType="Corner";tw(cBtn,{BackgroundColor3=A.c,TextColor3=C.bg});tw(fBtn,{BackgroundColor3=C.input,TextColor3=C.sub}) end)
    btCard.MouseEnter:Connect(function() tw(btCard,{BackgroundColor3=C.cardHi}) end);btCard.MouseLeave:Connect(function() tw(btCard,{BackgroundColor3=C.card}) end)
    tog(cp,"Box Fill","Semi-transparent fill",false,6,function(on) S.boxFill=on end)
    tog(cp,"ESP Names","Name labels",true,7,function(on) S.espNameOn=on
        for _,d in pairs(espD) do if d.ng then d.ng.Enabled=on end end end)
    sld(cp,"Max Distance",50,1000,500,8,function(v) S.maxDist=v end)
    local espCC=fr(cp,UDim2.new(1,0,0,50),nil,C.card,3);espCC.LayoutOrder=9;rnd(espCC,10);bdr(espCC,C.border,.8)
    lb(espCC,"ESP Color",UDim2.new(1,0,0,14),UDim2.new(0,16,0,5),C.txt,Enum.Font.SciFi,11,4,Enum.TextXAlignment.Left)
    lb(espCC,"Applies to boxes and highlights",UDim2.new(1,0,0,12),UDim2.new(0,16,0,20),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
    local espCRow=fr(espCC,UDim2.new(1,-32,0,16),UDim2.new(0,16,0,30),C.bg,4);espCRow.BackgroundTransparency=1
    local espCLL=Instance.new("UIListLayout");espCLL.FillDirection=Enum.FillDirection.Horizontal;espCLL.Padding=UDim.new(0,5);espCLL.Parent=espCRow
    for _,col in ipairs({Color3.fromRGB(108,92,255),Color3.fromRGB(45,205,115),Color3.fromRGB(232,55,55),Color3.fromRGB(255,195,50),Color3.fromRGB(236,236,252),Color3.fromRGB(170,60,255),Color3.fromRGB(40,200,230),Color3.fromRGB(255,95,160)}) do
        local sw=bt(espCRow,"",UDim2.new(0,20,0,16),nil,col,C.white,Enum.Font.SciFi,11,5);rnd(sw,5)
        sw.MouseEnter:Connect(function() tw(sw,{Size=UDim2.new(0,24,0,18)}) end);sw.MouseLeave:Connect(function() tw(sw,{Size=UDim2.new(0,20,0,16)}) end)
        local cap=col;sw.MouseButton1Click:Connect(function() S.espCol=cap;for _,d in pairs(espD) do if d.hl then d.hl.OutlineColor=cap end;colBox(d.bx,cap) end end)
    end
    sec(cp,"Aimbot",20)
    tog(cp,"Aimbot","Hold RMB to lock onto nearest head",true,21,function(on) S.aimbotOn=on end)
    sld(cp,"Switch Delay (x0.1s)",0,20,3,22,function(v) S.switchDelay=v end)
    local smoothCard=fr(cp,UDim2.new(1,0,0,60),nil,C.card,3);smoothCard.LayoutOrder=23;rnd(smoothCard,12);bdr(smoothCard,Color3.fromRGB(50,50,60),.8)
    lb(smoothCard,"Aim Smoothness",UDim2.new(.6,0,0,16),UDim2.new(0,16,0,6),C.txt,Enum.Font.GothamBold,12,4,Enum.TextXAlignment.Left)
    local smoothVal=lb(smoothCard,"15",UDim2.new(.35,0,0,16),UDim2.new(.65,-16,0,6),A.l,Enum.Font.GothamBold,12,4,Enum.TextXAlignment.Right)
    local smoothBg=fr(smoothCard,UDim2.new(1,-32,0,4),UDim2.new(0,16,0,38),C.input,4);rnd(smoothBg,3)
    local smoothFill=fr(smoothBg,UDim2.new(0.15,0,1,0),nil,A.c,5);rnd(smoothFill,3)
    local smoothKnob=bt(smoothBg,"",UDim2.new(0,14,0,14),UDim2.new(0.15,0,.5,0),C.white,C.white,Enum.Font.GothamBold,1,6)
    acReg[#acReg+1]={obj=smoothFill,prop="BackgroundColor3",role="c"}
    acReg[#acReg+1]={obj=smoothVal,prop="TextColor3",role="l"}
    smoothKnob.AnchorPoint=Vector2.new(.5,.5);rnd(smoothKnob,7);local smoothDrag=false
    smoothKnob.MouseButton1Down:Connect(function() smoothDrag=true end)
    UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then smoothDrag=false end end)
        pcall(function()
            UIS.InputChanged:Connect(function(i)
        if not smoothDrag or i.UserInputType~=Enum.UserInputType.MouseMovement then return end
        local r=math.clamp((i.Position.X-smoothBg.AbsolutePosition.X)/smoothBg.AbsoluteSize.X,0,1)
        local v=math.floor(r*100)
        S.aimbotSmooth=1-(v/100)*0.98
        smoothFill.Size=UDim2.new(r,0,1,0);smoothKnob.Position=UDim2.new(r,0,.5,0);smoothVal.Text=tostring(v)
        end)
    end)
    smoothCard.MouseEnter:Connect(function() tw(smoothCard,{BackgroundColor3=C.cardHi,.12}) end)
    smoothCard.MouseLeave:Connect(function() tw(smoothCard,{BackgroundColor3=C.card,.18}) end)
    tog(cp,"Jitter","Humanized random aim deviation",false,24,function(on) S.jitterOn=on end)
    sld(cp,"Jitter Amount",0,10,2,25,function(v) S.jitterVal=v end)
    tog(cp,"Multipoint","Aim at random body parts",false,26,function(on) S.multipointOn=on end)
    sec(cp,"Fake Lag",27)
    tog(cp,"Fake Lag","Makes you appear laggy to others",false,28,function(on)
        S.fakeLagOn=on
    end)
    sld(cp,"Lag Amount (ms)",50,500,200,29,function(v)
        S.fakeLagMs=v
    end)
    sec(cp,"Silent Aim",30)
    local silentSize=MODE=="Rage" and SILENT_SIZE_RAGE or SILENT_SIZE_LEGIT
    local silentInfo=fr(cp,UDim2.new(1,0,0,44),nil,C.card,3);silentInfo.LayoutOrder=31;rnd(silentInfo,10);bdr(silentInfo,C.border,.8)
    lb(silentInfo,"Silent Aim Method",UDim2.new(1,-16,0,16),UDim2.new(0,16,0,6),C.txt,Enum.Font.SciFi,11,4,Enum.TextXAlignment.Left)
    lb(silentInfo,"Expands head hitbox client-side. "..(MODE=="Rage" and "RAGE: very large instant HS." or "Legit: subtle size."),UDim2.new(1,-16,0,14),UDim2.new(0,16,0,24),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
    tog(cp,"Silent Aim","Expand enemy head hitbox for easy HS",false,32,function(on) S.silentAimOn=on
        if not on then
            for plr,orig in pairs(silentOrigSizes) do pcall(function()
                if plr.Character then
                    local h=plr.Character:FindFirstChild("Head")
                    if h then
                        h.Size=orig
                        local origT=silentOrigTrans[plr]
                        if origT~=nil then h.LocalTransparencyModifier=origT end
                        for _,dec in ipairs(h:GetDescendants()) do
                            if dec:IsA("BasePart") or dec:IsA("SpecialMesh") then
                                pcall(function() if origT~=nil then dec.LocalTransparencyModifier=origT end end)
                            end
                        end
                    end
                end end) end
            silentOrigSizes={}
            silentOrigTrans={}
        end
    end)
    sec(cp,"Spinbot",40)
    tog(cp,"Spinbot","Rapid Y-axis spin",false,41,function(on) S.spinOn=on end)
    sld(cp,"Spin Speed",1,5000,5000,42,function(v) S.spinVal=v end)
    if MODE=="Rage" then
        sec(cp,"Triggerbot",50)
        tog(cp,"Triggerbot","Auto-fire when crosshair on target",true,51,function(on) S.triggerbotOn=on end)
        sld(cp,"Trigger FOV",5,120,30,52,function(v) S.triggerbotFov=v end)
    end
    for _,pl in ipairs(Pl:GetPlayers()) do hookPlr(pl) end
    Pl.PlayerAdded:Connect(hookPlr)
    Pl.PlayerRemoving:Connect(function(p) task.delay(.2,function() rmvESP(p) end) end)
    local tpPg=pages["teleport"];sec(tpPg,"Players",1)
    local rB=bt(tpPg,"↻  Refresh List",UDim2.new(1,0,0,28),nil,C.card,C.sub,Enum.Font.SciFi,10,4)
    rB.LayoutOrder=999;rnd(rB,8);bdr(rB,C.border,.8)
    rB.MouseEnter:Connect(function() tw(rB,{BackgroundColor3=C.cardHi,TextColor3=C.txt}) end)
    rB.MouseLeave:Connect(function() tw(rB,{BackgroundColor3=C.card,TextColor3=C.sub}) end)
    local function rTP()
        for _,c in ipairs(tpPg:GetChildren()) do
            if (c:IsA("Frame") or (c:IsA("TextButton") and c~=rB)) and c.LayoutOrder>=10 then c:Destroy() end
        end
        local i=0
        for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP then
            local card=fr(tpPg,UDim2.new(1,0,0,50),nil,C.card,3);card.LayoutOrder=10+i;rnd(card,10);bdr(card,C.border,.8)
            local av=fr(card,UDim2.new(0,30,0,30),UDim2.new(0,12,.5,-15),A.d,4);rnd(av,9)
            lb(av,plr.Name:sub(1,1):upper(),UDim2.new(1,0,1,0),nil,A.c,Enum.Font.SciFi,13,5)
            lb(card,plr.Name,UDim2.new(1,-106,0,18),UDim2.new(0,50,0,7),C.txt,Enum.Font.SciFi,12,4,Enum.TextXAlignment.Left)
            local hm3=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
            lb(card,hm3 and math.floor(hm3.Health).." HP" or "loading...",UDim2.new(1,-106,0,14),UDim2.new(0,50,0,26),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
            local tpb=bt(card,"Teleport",UDim2.new(0,68,0,26),UDim2.new(1,-78,.5,-13),A.d,A.c,Enum.Font.SciFi,10,5);rnd(tpb,7);bdr(tpb,A.d,.8)
            tpb.MouseEnter:Connect(function() tw(tpb,{BackgroundColor3=A.c,TextColor3=C.bg}) end)
            tpb.MouseLeave:Connect(function() tw(tpb,{BackgroundColor3=A.d,TextColor3=A.c}) end)
            local cap=plr;tpb.MouseButton1Click:Connect(function()
                local mc=LP.Character;local tc=cap.Character
                if mc and tc then local h=mc:FindFirstChild("HumanoidRootPart");local t2=tc:FindFirstChild("HumanoidRootPart")
                    if h and t2 then h.CFrame=t2.CFrame+Vector3.new(3,2,0);tpb.Text="Done!"
                        task.delay(1.5,function() if tpb and tpb.Parent then tpb.Text="Teleport" end end) end end end)
            card.MouseEnter:Connect(function() tw(card,{BackgroundColor3=C.cardHi}) end)
            card.MouseLeave:Connect(function() tw(card,{BackgroundColor3=C.card}) end)
            i=i+1
        end end
    end
    rB.MouseButton1Click:Connect(rTP)
    rTP();Pl.PlayerAdded:Connect(function() task.delay(.5,rTP) end);Pl.PlayerRemoving:Connect(function() task.delay(.3,rTP) end)
    local plPg=pages["players"];sec(plPg,"Server Players",1)
    local rBl=bt(plPg,"↻  Refresh",UDim2.new(1,0,0,28),nil,C.card,C.sub,Enum.Font.SciFi,10,4)
    rBl.LayoutOrder=999;rnd(rBl,8);bdr(rBl,C.border,.8)
    rBl.MouseEnter:Connect(function() tw(rBl,{BackgroundColor3=C.cardHi,TextColor3=C.txt}) end)
    rBl.MouseLeave:Connect(function() tw(rBl,{BackgroundColor3=C.card,TextColor3=C.sub}) end)
    local openPreview
    sec(plPg,"Client Visuals",2)
    local auraEnabled=false;local angelEnabled=false
    local auraObjs={};local angelObjs={}
    local function clearAura(plr)
        for _,v in ipairs(auraObjs[plr] or {}) do pcall(function() v:Destroy() end) end;auraObjs[plr]=nil
    end
    local function clearAngel(plr)
        for _,v in ipairs(angelObjs[plr] or {}) do pcall(function() v:Destroy() end) end;angelObjs[plr]=nil
    end
    local function applyAura(plr)
        if plr==LP then return end;clearAura(plr)
        local ch=plr.Character;if not ch then return end
        local hrp=ch:FindFirstChild("HumanoidRootPart");if not hrp then return end
        local ring=Instance.new("Part");ring.Name="MeowlAura";ring.Size=Vector3.new(6,0.3,6)
        ring.Shape=Enum.PartType.Cylinder;ring.CFrame=hrp.CFrame*CFrame.Angles(0,0,math.pi/2)
        ring.Anchored=false;ring.CanCollide=false;ring.CastShadow=false
        ring.BrickColor=BrickColor.new("Cyan");ring.Material=Enum.Material.Neon;ring.Transparency=0.2
        local weld=Instance.new("WeldConstraint");weld.Part0=hrp;weld.Part1=ring;weld.Parent=ring
        ring.Parent=ch;auraObjs[plr]={ring}
    end
    local function applyAngel(plr)
        if plr==LP then return end;clearAngel(plr)
        local ch=plr.Character;if not ch then return end
        local head=ch:FindFirstChild("Head");if not head then return end
        local halo=Instance.new("Part");halo.Name="MeowlHalo";halo.Size=Vector3.new(2.5,0.25,2.5)
        halo.Shape=Enum.PartType.Cylinder;halo.CFrame=head.CFrame*CFrame.new(0,1.4,0)*CFrame.Angles(0,0,math.pi/2)
        halo.Anchored=false;halo.CanCollide=false;halo.CastShadow=false
        halo.BrickColor=BrickColor.new("Bright yellow");halo.Material=Enum.Material.Neon;halo.Transparency=0.1
        local weldH=Instance.new("WeldConstraint");weldH.Part0=head;weldH.Part1=halo;weldH.Parent=halo
        local function mkWing(side)
            local w=Instance.new("Part");w.Name="MeowlWing";w.Size=Vector3.new(0.2,2,3)
            w.CFrame=head.CFrame*CFrame.new(side*1.6,-0.5,0)*CFrame.Angles(0,side*0.3,side*0.5)
            w.Anchored=false;w.CanCollide=false;w.CastShadow=false
            w.BrickColor=BrickColor.new("White");w.Material=Enum.Material.Neon;w.Transparency=0.3
            local ww=Instance.new("WeldConstraint");ww.Part0=head;ww.Part1=w;ww.Parent=w;w.Parent=ch;return w
        end
        local wL=mkWing(-1);local wR=mkWing(1)
        halo.Parent=ch;angelObjs[plr]={halo,wL,wR}
    end
    tog(plPg,"Aura","Glowing ring under players",false,3,function(on) auraEnabled=on
        if on then for _,pl in ipairs(Pl:GetPlayers()) do applyAura(pl) end
        else for _,pl in ipairs(Pl:GetPlayers()) do clearAura(pl) end end end)
    tog(plPg,"Angel","Halo + wings above players",false,4,function(on) angelEnabled=on
        if on then for _,pl in ipairs(Pl:GetPlayers()) do applyAngel(pl) end
        else for _,pl in ipairs(Pl:GetPlayers()) do clearAngel(pl) end end end)
    sec(plPg,"Fling",10)
    local isFlingging=false
    local function flingPlayer(plr)
        if isFlingging then return end
        local ch=plr.Character;if not ch then return end
        local tHRP=ch:FindFirstChild("HumanoidRootPart");if not tHRP then return end
        local myC=LP.Character;if not myC then return end
        local myHRP=myC:FindFirstChild("HumanoidRootPart");if not myHRP then return end
        isFlingging=true
        task.spawn(function()
            local myH=myC:FindFirstChildOfClass("Humanoid");if myH then myH.PlatformStand=true end
            for _,pp in ipairs(myC:GetDescendants()) do if pp:IsA("BasePart") then pp.CanCollide=true end end
            local bv,bg2
            pcall(function()
                bv=Instance.new("BodyVelocity");bv.MaxForce=Vector3.new(1e9,1e9,1e9);bv.P=1e9;bv.Velocity=Vector3.zero;bv.Parent=myHRP
                bg2=Instance.new("BodyGyro");bg2.MaxTorque=Vector3.new(1e9,1e9,1e9);bg2.P=1e9;bg2.D=0;bg2.Parent=myHRP
            end)
            for i=1,40 do
                if not tHRP.Parent then break end
                local ang=(i/40)*math.pi*4
                pcall(function()
                    myHRP.CFrame=CFrame.new(tHRP.Position+Vector3.new(math.cos(ang)*1.2,0.5,math.sin(ang)*1.2))
                    bv.Velocity=Vector3.new(math.cos(ang+1.57)*2500,200,math.sin(ang+1.57)*2500)
                end);task.wait()
            end
            for i=1,10 do
                pcall(function()
                    myHRP.CFrame=tHRP.CFrame
                    bv.Velocity=Vector3.new(math.random(-3000,3000),4000,math.random(-3000,3000))
                end);task.wait()
            end
            bv:Destroy();bg2:Destroy()
            if myH then myH.PlatformStand=false end
            isFlingging=false
        end)
    end
    local function rPL()
        for _,c in ipairs(plPg:GetChildren()) do
            if (c:IsA("Frame") or (c:IsA("TextButton") and c~=rBl)) and c.LayoutOrder>=20 then c:Destroy() end
        end
        local i=0
        for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP then
            local card=fr(plPg,UDim2.new(1,0,0,54),nil,C.card,3);card.LayoutOrder=20+i;rnd(card,10);bdr(card,C.border,.8)
            local av=fr(card,UDim2.new(0,34,0,34),UDim2.new(0,10,.5,-17),A.d,4);rnd(av,10)
            lb(av,plr.Name:sub(1,1):upper(),UDim2.new(1,0,1,0),nil,A.c,Enum.Font.SciFi,16,5)
            lb(card,plr.Name,UDim2.new(1,-150,0,18),UDim2.new(0,52,0,6),C.txt,Enum.Font.SciFi,12,4,Enum.TextXAlignment.Left)
            local hm4=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
            local hpP=hm4 and math.clamp(hm4.Health/math.max(hm4.MaxHealth,1),0,1) or 1
            local hpBg=fr(card,UDim2.new(1,-154,0,5),UDim2.new(0,52,0,30),C.input,4);rnd(hpBg,3)
            local hpFill=fr(hpBg,UDim2.new(hpP,0,1,0),nil,hpP>0.6 and C.legit or hpP>0.3 and C.gold or C.rage,5);rnd(hpFill,3)
            lb(card,hm4 and math.floor(hm4.Health).." HP" or "?",UDim2.new(0,80,0,12),UDim2.new(0,52,0,38),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
            local pvb=bt(card,"Preview",UDim2.new(0,58,0,22),UDim2.new(1,-130,.5,-11),A.d,A.c,Enum.Font.SciFi,10,5);rnd(pvb,7);bdr(pvb,A.d,.8)
            pvb.MouseEnter:Connect(function() tw(pvb,{BackgroundColor3=A.c,TextColor3=C.bg}) end)
            pvb.MouseLeave:Connect(function() tw(pvb,{BackgroundColor3=A.d,TextColor3=A.c}) end)
            local flb=bt(card,"Fling",UDim2.new(0,48,0,22),UDim2.new(1,-68,.5,-11),C.rageDim,C.rageLt,Enum.Font.SciFi,10,5);rnd(flb,7)
            flb.MouseEnter:Connect(function() tw(flb,{BackgroundColor3=C.rage,TextColor3=C.white}) end)
            flb.MouseLeave:Connect(function() tw(flb,{BackgroundColor3=C.rageDim,TextColor3=C.rageLt}) end)
            card.MouseEnter:Connect(function() tw(card,{BackgroundColor3=C.cardHi}) end)
            card.MouseLeave:Connect(function() tw(card,{BackgroundColor3=C.card}) end)
            local cap=plr
            pvb.MouseButton1Click:Connect(function() if openPreview then openPreview(cap) end end)
            flb.MouseButton1Click:Connect(function() flingPlayer(cap) end)
            i=i+1
        end end
    end
    rBl.MouseButton1Click:Connect(rPL)
    local wdPg=pages["world"]
    sec(wdPg,"Skybox",1)
    local origLighting={}
    local function saveLighting()
        origLighting.Sky=Lighting:FindFirstChildOfClass("Sky")
        origLighting.Ambient=Lighting.Ambient
        origLighting.OutdoorAmbient=Lighting.OutdoorAmbient
        origLighting.Brightness=Lighting.Brightness
        origLighting.ClockTime=Lighting.ClockTime
        origLighting.FogEnd=Lighting.FogEnd
    end
    saveLighting()
    local function clearSkyFX()
        for _,v in ipairs(Lighting:GetChildren()) do
            if v:IsA("Sky") or v:IsA("Atmosphere") then v:Destroy() end
        end
        local ch=LP.Character;if ch then
            for _,v in ipairs(ch:GetDescendants()) do if v.Name=="MeowlWeather" then v:Destroy() end end
        end
    end
    local currentSky="none"
    local function applySkybox(name)
        currentSky=name;clearSkyFX()
        if name=="night" then
            Lighting.ClockTime=0;Lighting.Brightness=2;Lighting.Ambient=Color3.fromRGB(128,128,128);Lighting.OutdoorAmbient=Color3.fromRGB(128,128,128)
            local sky=Instance.new("Sky")
            sky.SkyboxBk="rbxassetid://1012511";sky.SkyboxDn="rbxassetid://1012511"
            sky.SkyboxFt="rbxassetid://1012511";sky.SkyboxLf="rbxassetid://1012511"
            sky.SkyboxRt="rbxassetid://1012511";sky.SkyboxUp="rbxassetid://1012511"
            sky.StarCount=3000;sky.Parent=Lighting
        elseif name=="polar" then
            Lighting.ClockTime=1;Lighting.Brightness=0.05;Lighting.Ambient=Color3.fromRGB(10,20,40);Lighting.OutdoorAmbient=Color3.fromRGB(15,30,60)
            local sky=Instance.new("Sky")
            sky.SkyboxBk="rbxassetid://1012511";sky.SkyboxDn="rbxassetid://1012511"
            sky.SkyboxFt="rbxassetid://1012511";sky.SkyboxLf="rbxassetid://1012511"
            sky.SkyboxRt="rbxassetid://1012511";sky.SkyboxUp="rbxassetid://1012511"
            sky.StarCount=5000;sky.Parent=Lighting
            local atm=Instance.new("Atmosphere");atm.Density=0.2;atm.Offset=0.8
            atm.Color=Color3.fromRGB(0,180,120);atm.Glare=0.5;atm.Haze=0.5;atm.Parent=Lighting
        elseif name=="default" then
            Lighting.ClockTime=origLighting.ClockTime or 14;Lighting.Brightness=origLighting.Brightness or 2
            Lighting.Ambient=origLighting.Ambient or Color3.fromRGB(70,70,70);Lighting.OutdoorAmbient=origLighting.OutdoorAmbient or Color3.fromRGB(128,128,128)
        end
    end
    local skyboxes={
        {id="night",  label="Night Sky",   desc="Black sky with stars",        col=Color3.fromRGB(60,80,255)},
        {id="polar",  label="Polar Star",  desc="Northern lights atmosphere",   col=Color3.fromRGB(0,200,130)},
        {id="default",label="Default",     desc="Restore original skybox",      col=C.mut},
    }
    for i,sb in ipairs(skyboxes) do
        local card=fr(wdPg,UDim2.new(1,0,0,52),nil,C.card,3);card.LayoutOrder=i+1;rnd(card,10);bdr(card,C.border,.8)
        local dot=fr(card,UDim2.new(0,10,0,10),UDim2.new(0,14,.5,-5),sb.col,5);rnd(dot,5)
        lb(card,sb.label,UDim2.new(1,-120,0,18),UDim2.new(0,34,0,7),C.txt,Enum.Font.SciFi,12,4,Enum.TextXAlignment.Left)
        lb(card,sb.desc,UDim2.new(1,-120,0,13),UDim2.new(0,34,0,27),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
        local applyBtn=bt(card,"Apply",UDim2.new(0,58,0,26),UDim2.new(1,-70,.5,-13),C.card,sb.col,Enum.Font.SciFi,10,5);rnd(applyBtn,8);bdr(applyBtn,sb.col,.8)
        applyBtn.MouseEnter:Connect(function() tw(applyBtn,{BackgroundColor3=sb.col,TextColor3=C.bg}) end)
        applyBtn.MouseLeave:Connect(function() tw(applyBtn,{BackgroundColor3=C.card,TextColor3=sb.col}) end)
        card.MouseEnter:Connect(function() tw(card,{BackgroundColor3=C.cardHi}) end)
        card.MouseLeave:Connect(function() tw(card,{BackgroundColor3=C.card}) end)
        local capSb=sb;applyBtn.MouseButton1Click:Connect(function() applySkybox(capSb.id) end)
    end
    sec(wdPg,"Weather",10)
    local weatherActive=nil
    local weatherParts={}
    local function clearWeather()
        for _,v in ipairs(weatherParts) do pcall(function() v:Destroy() end) end;weatherParts={}
        weatherActive=nil
    end
    local function applyWeather(wtype)
        clearWeather();weatherActive=wtype
        local cam=Cam
        task.spawn(function()
            while weatherActive==wtype do
                local count=wtype=="heavyrain" and 40 or 15
                for _=1,count do
                    if weatherActive~=wtype then break end
                    local p=Instance.new("Part");p.Name="MeowlWeather"
                    p.Size=wtype=="heavyrain" and Vector3.new(0.05,1.5,0.05) or Vector3.new(0.3,0.3,0.3)
                    p.Anchored=true;p.CanCollide=false;p.CastShadow=false
                    p.Material=wtype=="heavyrain" and Enum.Material.Neon or Enum.Material.SmoothPlastic
                    p.BrickColor=wtype=="heavyrain" and BrickColor.new("Cyan") or BrickColor.new("White")
                    p.Transparency=wtype=="heavyrain" and 0.3 or 0.1
                    local camPos=cam.CFrame.Position
                    p.CFrame=CFrame.new(camPos+Vector3.new(math.random(-30,30),math.random(10,25),math.random(-30,30)))
                    p.Parent=workspace;weatherParts[#weatherParts+1]=p
                    task.spawn(function()
                        local speed=wtype=="heavyrain" and 0.03 or 0.06
                        for _=1,80 do
                            if not p.Parent then return end
                            p.CFrame=p.CFrame*CFrame.new(0,-speed*10,0)
                            task.wait(speed)
                        end
                        pcall(function() p:Destroy() end)
                        for idx,v in ipairs(weatherParts) do if v==p then table.remove(weatherParts,idx);break end end
                    end)
                end
                task.wait(0.1)
            end
        end)
    end
    local weathers={
        {id="snow",      label="Snow",       desc="Gentle snowfall",      col=Color3.fromRGB(200,230,255)},
        {id="heavyrain", label="Heavy Rain",  desc="Intense downpour",     col=Color3.fromRGB(60,120,255)},
        {id="clear",     label="Clear",       desc="Remove weather",       col=C.mut},
    }
    for i,wb in ipairs(weathers) do
        local card=fr(wdPg,UDim2.new(1,0,0,52),nil,C.card,3);card.LayoutOrder=10+i;rnd(card,10);bdr(card,C.border,.8)
        local dot=fr(card,UDim2.new(0,10,0,10),UDim2.new(0,14,.5,-5),wb.col,5);rnd(dot,5)
        lb(card,wb.label,UDim2.new(1,-120,0,18),UDim2.new(0,34,0,7),C.txt,Enum.Font.SciFi,12,4,Enum.TextXAlignment.Left)
        lb(card,wb.desc,UDim2.new(1,-120,0,13),UDim2.new(0,34,0,27),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
        local applyBtn=bt(card,"Apply",UDim2.new(0,58,0,26),UDim2.new(1,-70,.5,-13),C.card,wb.col,Enum.Font.SciFi,10,5);rnd(applyBtn,8);bdr(applyBtn,wb.col,.8)
        applyBtn.MouseEnter:Connect(function() tw(applyBtn,{BackgroundColor3=wb.col,TextColor3=C.bg}) end)
        applyBtn.MouseLeave:Connect(function() tw(applyBtn,{BackgroundColor3=C.card,TextColor3=wb.col}) end)
        card.MouseEnter:Connect(function() tw(card,{BackgroundColor3=C.cardHi}) end)
        card.MouseLeave:Connect(function() tw(card,{BackgroundColor3=C.card}) end)
        local capWb=wb;applyBtn.MouseButton1Click:Connect(function()
            if capWb.id=="clear" then clearWeather()
            else applyWeather(capWb.id) end
        end)
    end
    local muPg=pages["music"]
    sec(muPg,"Now Playing",1)
    local nowPlayingCard=fr(muPg,UDim2.new(1,0,0,56),nil,C.card,3);nowPlayingCard.LayoutOrder=2;rnd(nowPlayingCard,10);bdr(nowPlayingCard,C.border,.8)
    lb(nowPlayingCard,"🎵  No track playing",UDim2.new(1,-16,0,18),UDim2.new(0,12,0,8),C.txt,Enum.Font.SciFi,12,4,Enum.TextXAlignment.Left)
    local nowPlayingLbl=lb(nowPlayingCard,"Select a track below to start",UDim2.new(1,-16,0,14),UDim2.new(0,12,0,28),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
    local progBg=fr(nowPlayingCard,UDim2.new(1,-16,0,3),UDim2.new(0,8,0,46),C.input,4);rnd(progBg,2)
    local progFill=fr(progBg,UDim2.new(0,0,1,0),nil,A.c,5);rnd(progFill,2)
    acReg[#acReg+1]={obj=progFill,prop="BackgroundColor3",role="c"}
    sec(muPg,"Tracks",10)
    local currentSound=nil;local currentSoundId=""
    local TRACKS={
        {label="Its Raining Tacos",  artist="Parry Gripp",id="rbxassetid://142376088"},
        {label="Astronomia",         artist="Vicetone",  id="rbxassetid://1837333298"},
    }
    for i,tr in ipairs(TRACKS) do
        local card=fr(muPg,UDim2.new(1,0,0,58),nil,C.card,3);card.LayoutOrder=10+i;rnd(card,10);bdr(card,C.border,.8)
        local art=fr(card,UDim2.new(0,40,0,40),UDim2.new(0,10,.5,-20),C.accDim,4);rnd(art,8)
        lb(art,"♪",UDim2.new(1,0,1,0),nil,A.c,Enum.Font.SciFi,16,5)
        lb(card,tr.label,UDim2.new(1,-120,0,18),UDim2.new(0,60,0,8),C.txt,Enum.Font.SciFi,12,4,Enum.TextXAlignment.Left)
        lb(card,tr.artist,UDim2.new(1,-120,0,14),UDim2.new(0,60,0,28),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
        local playBtn=bt(card,"▶",UDim2.new(0,34,0,34),UDim2.new(1,-48,.5,-17),A.d,A.c,Enum.Font.SciFi,14,5);rnd(playBtn,17);bdr(playBtn,A.c,.8)
        acReg[#acReg+1]={obj=playBtn,prop="BackgroundColor3",role="d"}
        acReg[#acReg+1]={obj=playBtn,prop="TextColor3",role="c"}
        playBtn.MouseEnter:Connect(function() tw(playBtn,{BackgroundColor3=A.c,TextColor3=C.bg}) end)
        playBtn.MouseLeave:Connect(function() tw(playBtn,{BackgroundColor3=A.d,TextColor3=A.c}) end)
        card.MouseEnter:Connect(function() tw(card,{BackgroundColor3=C.cardHi}) end)
        card.MouseLeave:Connect(function() tw(card,{BackgroundColor3=C.card}) end)
        local capTr=tr
        playBtn.MouseButton1Click:Connect(function()
            if currentSoundId==capTr.id and currentSound and currentSound.IsPlaying then
                currentSound:Stop();currentSound:Destroy();currentSound=nil;currentSoundId=""
                playBtn.Text="▶";nowPlayingLbl.Text="Select a track below to start"
                progFill.Size=UDim2.new(0,0,1,0)
            else
                if currentSound then pcall(function() currentSound:Stop();currentSound:Destroy() end);currentSound=nil end
                for _,c2 in ipairs(muPg:GetChildren()) do
                    if c2:IsA("Frame") and c2.LayoutOrder>=11 then
                        local pb=c2:FindFirstChildWhichIsA("TextButton")
                        if pb then pb.Text="▶" end
                    end
                end
                local snd=Instance.new("Sound");snd.SoundId=capTr.id;snd.Volume=0.7;snd.Looped=true
                snd.RollOffMaxDistance=1e6;snd.RollOffMinDistance=1e6
                local ok2,err2=pcall(function() snd.Parent=SoundService end)
                if not ok2 then snd.Parent=workspace end
                task.delay(0.1,function() pcall(function() snd:Play() end) end)
                currentSound=snd;currentSoundId=capTr.id
                playBtn.Text="■"
                nowPlayingLbl.Text=capTr.label.." — "..capTr.artist
            end
        end)
    end
    RS.Heartbeat:Connect(function()
        if currentSound and currentSound.IsPlaying and currentSound.TimeLength>0 then
            local pct=math.clamp(currentSound.TimePosition/currentSound.TimeLength,0,1)
            progFill.Size=UDim2.new(pct,0,1,0)
        end
    end)
    local ivPg=pages["invisible"];sec(ivPg,"Underground Mode",1)
    local ivInfo=fr(ivPg,UDim2.new(1,0,0,50),nil,C.card,3);ivInfo.LayoutOrder=2;rnd(ivInfo,10);bdr(ivInfo,C.border,.8)
    lb(ivInfo,"About Underground",UDim2.new(1,-16,0,16),UDim2.new(0,16,0,6),C.txt,Enum.Font.SciFi,11,4,Enum.TextXAlignment.Left)
    lb(ivInfo,"Raycasts floor and pushes you underground.\nNoclip active. WASD still works.",UDim2.new(1,-16,0,28),UDim2.new(0,16,0,22),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
    tog(ivPg,"Underground","Go below the map and move freely",false,3,function(on)
        invOn=on
        if on then
            local c=LP.Character;if not c then invOn=false;return end
            local hrp=c:FindFirstChild("HumanoidRootPart");if not hrp then invOn=false;return end
            local hm=c:FindFirstChildOfClass("Humanoid");if hm then pcall(function() hm.PlatformStand=true end) end
            for _,pp in ipairs(c:GetDescendants()) do if pp:IsA("BasePart") then pp.CanCollide=false end end
            local rp=RaycastParams.new();rp.FilterType=Enum.RaycastFilterType.Exclude;rp.FilterDescendantsInstances={c}
            local res=workspace:Raycast(hrp.Position,Vector3.new(0,-500,0),rp)
            invFloorY=res and res.Position.Y or (hrp.Position.Y-15)
            local targetY=invFloorY-8;hrp.CFrame=CFrame.new(hrp.Position.X,targetY,hrp.Position.Z)
            if invBP then invBP:Destroy() end
            pcall(function()
                local bp=Instance.new("BodyPosition")
                bp.MaxForce=Vector3.new(0,1e6,0)
                bp.P=5000;bp.D=1000
                bp.Position=Vector3.new(hrp.Position.X,targetY,hrp.Position.Z)
                bp.Parent=hrp;invBP=bp
            end)
        else
            if invBP then invBP:Destroy();invBP=nil end
            local c=LP.Character;if c then
                local hrp=c:FindFirstChild("HumanoidRootPart")
                if hrp and invFloorY then hrp.CFrame=CFrame.new(hrp.Position.X,invFloorY+5,hrp.Position.Z) end
                local hm=c:FindFirstChildOfClass("Humanoid");if hm then pcall(function() hm.PlatformStand=false end) end
                for _,pp in ipairs(c:GetDescendants()) do if pp:IsA("BasePart") then pp.CanCollide=true end end
            end;invFloorY=nil
        end
    end)
    local chatPg=pages["chat"]
    sec(chatPg,"Chat Spammer",1)
    local spamMessages={
        "MeowlSense Owns U",
        ".gg/CWtD5thj",
    }
    local spamOn=false
    local spamInterval=10
    local spamThread=nil
    local spamInfoCard=fr(chatPg,UDim2.new(1,0,0,44),nil,C.card,3);spamInfoCard.LayoutOrder=2;rnd(spamInfoCard,12);bdr(spamInfoCard,Color3.fromRGB(50,50,60),.8)
    lb(spamInfoCard,"Sends all messages every 10 seconds",UDim2.new(1,-16,0,16),UDim2.new(0,12,0,6),C.txt,Enum.Font.GothamBold,11,4,Enum.TextXAlignment.Left)
    lb(spamInfoCard,"Uses Roblox chat — must have chat enabled",UDim2.new(1,-16,0,14),UDim2.new(0,12,0,24),C.mut,Enum.Font.Gotham,9,4,Enum.TextXAlignment.Left)
    local msgListFrame=fr(chatPg,UDim2.new(1,0,0,10),nil,C.bg,3);msgListFrame.BackgroundTransparency=1;msgListFrame.LayoutOrder=3
    local msgLL=Instance.new("UIListLayout");msgLL.Padding=UDim.new(0,4);msgLL.Parent=msgListFrame
    msgLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() msgListFrame.Size=UDim2.new(1,0,0,msgLL.AbsoluteContentSize.Y) end)
    local function rebuildMsgList()
        for _,c in ipairs(msgListFrame:GetChildren()) do if not c:IsA("UIListLayout") then c:Destroy() end end
        for idx,msg in ipairs(spamMessages) do
            local row=fr(msgListFrame,UDim2.new(1,0,0,36),nil,C.card,4);rnd(row,10);bdr(row,Color3.fromRGB(50,50,60),.8)
            lb(row,msg,UDim2.new(1,-44,1,0),UDim2.new(0,10,0,0),C.txt,Enum.Font.Gotham,11,5,Enum.TextXAlignment.Left)
            local delBtn=bt(row,"✕",UDim2.new(0,28,0,28),UDim2.new(1,-36,.5,-14),Color3.fromRGB(80,20,20),C.red,Enum.Font.GothamBold,11,6)
            rnd(delBtn,8)
            delBtn.MouseEnter:Connect(function() tw(delBtn,{BackgroundColor3=C.rage,.12}) end)
            delBtn.MouseLeave:Connect(function() tw(delBtn,{BackgroundColor3=Color3.fromRGB(80,20,20),.18}) end)
            local capIdx=idx
            delBtn.MouseButton1Click:Connect(function()
                table.remove(spamMessages,capIdx)
                rebuildMsgList()
            end)
        end
    end
    rebuildMsgList()
    sec(chatPg,"Add Message",10)
    local addCard=fr(chatPg,UDim2.new(1,0,0,42),nil,C.card,3);addCard.LayoutOrder=11;rnd(addCard,12);bdr(addCard,Color3.fromRGB(50,50,60),.8)
    local msgBox=Instance.new("TextBox")
    msgBox.Size=UDim2.new(1,-52,0,28);msgBox.Position=UDim2.new(0,8,.5,-14)
    msgBox.BackgroundColor3=Color3.fromRGB(22,22,26);msgBox.TextColor3=C.txt
    msgBox.PlaceholderColor3=C.mut;msgBox.PlaceholderText="Type a message..."
    msgBox.Text="";msgBox.Font=Enum.Font.Gotham;msgBox.TextSize=12
    msgBox.ClearTextOnFocus=false;msgBox.BorderSizePixel=0;msgBox.ZIndex=5
    msgBox.TextXAlignment=Enum.TextXAlignment.Left;msgBox.Parent=addCard
    rnd(msgBox,8);bdr(msgBox,Color3.fromRGB(60,60,70),.8)
    local msgBoxPad=Instance.new("UIPadding");msgBoxPad.PaddingLeft=UDim.new(0,8);msgBoxPad.Parent=msgBox
    local addBtn=bt(addCard,"+",UDim2.new(0,34,0,28),UDim2.new(1,-42,.5,-14),A.c,C.bg,Enum.Font.GothamBold,14,6)
    rnd(addBtn,8)
    acReg[#acReg+1]={obj=addBtn,prop="BackgroundColor3",role="c"}
    addBtn.MouseEnter:Connect(function() tw(addBtn,{BackgroundColor3=A.l,.12}) end)
    addBtn.MouseLeave:Connect(function() tw(addBtn,{BackgroundColor3=A.c,.18}) end)
    local function addMessage()
        local txt=msgBox.Text:match("^%s*(.-)%s*$")
        if txt~="" then
            table.insert(spamMessages,txt)
            msgBox.Text=""
            rebuildMsgList()
        end
    end
    addBtn.MouseButton1Click:Connect(addMessage)
    msgBox.FocusLost:Connect(function(enter) if enter then addMessage() end end)
    sec(chatPg,"Spammer",20)
    local function sendChat(msg)
        local ok1=pcall(function()
            local tcs=game:GetService("TextChatService")
            local ch=tcs:FindFirstChild("TextChannels") and tcs.TextChannels:FindFirstChildWhichIsA("TextChannel")
            if ch then ch:SendAsync(msg) end
        end)
        if ok1 then return end
        local ok2=pcall(function()
            local re=game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
            if re then
                local say=re:FindFirstChild("SayMessageRequest")
                if say then say:FireServer(msg,"All") end
            end
        end)
        if ok2 then return end
        local ok3=pcall(function()
            local re=game:GetService("ReplicatedStorage"):FindFirstChild("Chat")
            if re then re:FireServer(LP.Character and LP.Character:FindFirstChild("Head"),msg) end
        end)
        if ok3 then return end
        pcall(function()
            for _,v in ipairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                if v:IsA("RemoteEvent") and (v.Name:lower():find("chat") or v.Name:lower():find("say") or v.Name:lower():find("message")) then
                    pcall(function() v:FireServer(msg) end)
                    pcall(function() v:FireServer(msg,"All") end)
                end
            end
        end)
    end
    local function startSpam()
        spamThread=task.spawn(function()
            while spamOn do
                for _,msg in ipairs(spamMessages) do
                    if not spamOn then break end
                    sendChat(msg)
                    task.wait(0.8)
                end
                task.wait(spamInterval)
            end
        end)
    end
    tog(chatPg,"Enable Spam","Sends messages every 10 seconds",false,21,function(on)
        spamOn=on
        if on then startSpam() end
    end)
    local rbPg=pages["ragebot"]
    local RB={
        autoFireOn=false, bonePriority="Head", predOn=false, predAmount=0.12,
        fovOn=true, fovSize=120,
        resolverOn=false,
        dtOn=false, dtCD=false,
        btOn=false, btMs=150,
        edgeBugOn=false, strafeOn=false, autoCrouchOn=false, fakeDuckOn=false,
        spreadCircleOn=false, hitMarkerOn=false, damageIndOn=false, chamsOn=false,
        antiAimOn=false, antiAimMode="Spin", fakeLagBurstOn=false, flbHeld=false,
        velChangeOn=false, velAmt=80,
        autoKnifeOn=false, knifeDist=8,
    }
    local fovCircle=Instance.new("SelectionBox")
    local fovGui=gui("MS_FovCircle")
    local fovImg=Instance.new("ImageLabel");fovImg.Size=UDim2.new(0,RB.fovSize*2,0,RB.fovSize*2)
    fovImg.Position=UDim2.new(0.5,-RB.fovSize,0.5,-RB.fovSize)
    fovImg.BackgroundTransparency=1;fovImg.Image="rbxassetid://3570695787"
    fovImg.ImageColor3=Color3.fromRGB(255,60,60);fovImg.ImageTransparency=0.5;fovImg.ZIndex=10
    fovImg.Visible=false;fovImg.Parent=fovGui
    local hmGui=gui("MS_HitMarker")
    local hmLines={}
    for i=1,4 do
        local l=fr(hmGui,UDim2.new(0,10,0,2),UDim2.new(0.5,0,0.5,0),Color3.fromRGB(255,255,255),10)
        l.AnchorPoint=Vector2.new(0.5,0.5);l.BackgroundTransparency=1;l.BorderSizePixel=0
        hmLines[i]=l
    end
    local function showHitMarker(dmg)
        local offsets={{0,-14,10,2},{0,12,10,2},{-14,0,2,10},{12,0,2,10}}
        for i,l in ipairs(hmLines) do
            l.Position=UDim2.new(0.5,offsets[i][1],0.5,offsets[i][2])
            l.Size=UDim2.new(0,offsets[i][3],0,offsets[i][4])
            l.BackgroundTransparency=0;l.BackgroundColor3=Color3.fromRGB(255,60,60)
        end
        if RB.damageIndOn and dmg then
            local dl=Instance.new("TextLabel");dl.Text="-"..tostring(math.floor(dmg))
            dl.Size=UDim2.new(0,60,0,20);dl.Position=UDim2.new(0.5,-10,0.5,-30)
            dl.BackgroundTransparency=1;dl.TextColor3=Color3.fromRGB(255,80,80)
            dl.Font=Enum.Font.SciFi;dl.TextSize=14;dl.ZIndex=11;dl.Parent=hmGui
            tw(dl,{TextTransparency=1,Position=UDim2.new(0.5,-10,0.5,-50)},0.6)
            game:GetService("Debris"):AddItem(dl,0.7)
        end
        task.delay(0.12,function()
            for _,l in ipairs(hmLines) do tw(l,{BackgroundTransparency=1},0.1) end
        end)
    end
    local chamD={}
    local function applyChams(plr,char)
        if plr==LP or not char then return end
        local d={}
        local hl=Instance.new("Highlight");hl.FillColor=Color3.fromRGB(255,40,40)
        hl.OutlineColor=Color3.fromRGB(255,120,120);hl.FillTransparency=0.3
        hl.OutlineTransparency=0;hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
        hl.Adornee=char;hl.Parent=char;d.hl=hl;chamD[plr]=d
    end
    local function removeChams(plr)
        local d=chamD[plr];if not d then return end
        pcall(function() if d.hl then d.hl:Destroy() end end);chamD[plr]=nil
    end
    local spreadGui=gui("MS_Spread")
    local spreadCirc=Instance.new("ImageLabel");spreadCirc.Size=UDim2.new(0,20,0,20)
    spreadCirc.Position=UDim2.new(0.5,-10,0.5,-10)
    spreadCirc.BackgroundTransparency=1;spreadCirc.Image="rbxassetid://3570695787"
    spreadCirc.ImageColor3=Color3.fromRGB(255,255,255);spreadCirc.ImageTransparency=0.4
    spreadCirc.Visible=false;spreadCirc.ZIndex=10;spreadCirc.Parent=spreadGui
    local btHistory={}
    RS.Heartbeat:Connect(function()
        for _,plr in ipairs(Pl:GetPlayers()) do
            if plr~=LP and plr.Character then
                local hrp=plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    if not btHistory[plr] then btHistory[plr]={} end
                    table.insert(btHistory[plr],1,{cf=hrp.CFrame,t=tick()})
                    while #btHistory[plr]>0 and tick()-btHistory[plr][#btHistory[plr]].t>0.5 do
                        table.remove(btHistory[plr])
                    end
                end
            end
        end
    end)
    local aaAngle=0
    local aaFakeDuckT=0
    RS.Heartbeat:Connect(function(dt)
        if RB.antiAimOn then
            local c=LP.Character;if c then
                local hrp=c:FindFirstChild("HumanoidRootPart")
                if hrp then
                    if RB.antiAimMode=="Spin" then
                        aaAngle=(aaAngle+720*dt)%360
                        hrp.CFrame=CFrame.new(hrp.Position)*CFrame.Angles(0,math.rad(aaAngle),0)
                    elseif RB.antiAimMode=="Jitter" then
                        aaAngle=aaAngle==90 and -90 or 90
                        hrp.CFrame=CFrame.new(hrp.Position)*CFrame.Angles(0,math.rad(aaAngle+Cam.CFrame:ToEulerAnglesYXZ()*0+0),0)
                    elseif RB.antiAimMode=="Static" then
                        local _,cy,_=Cam.CFrame:ToEulerAnglesYXZ()
                        hrp.CFrame=CFrame.new(hrp.Position)*CFrame.Angles(0,cy+math.rad(180),0)
                    end
                end end end
        if RB.fakeDuckOn then
            local c=LP.Character;if c then
                local hm=c:FindFirstChildOfClass("Humanoid");if hm then
                    aaFakeDuckT=aaFakeDuckT+dt
                    if aaFakeDuckT>0.05 then aaFakeDuckT=0
                        hm.CameraOffset=Vector3.new(0,hm.CameraOffset.Y==-1.5 and 0 or -1.5,0) end end end end
        if RB.strafeOn then
            local c=LP.Character;if c then
                local hm=c:FindFirstChildOfClass("Humanoid")
                if hm and hm:GetState()==Enum.HumanoidStateType.Freefall then
                    local t=tick()*3;local dir=math.sin(t)>0 and Enum.KeyCode.D or Enum.KeyCode.A
                    if not UIS:IsKeyDown(Enum.KeyCode.A) and not UIS:IsKeyDown(Enum.KeyCode.D) then
                        hm:Move(dir==Enum.KeyCode.D and Vector3.new(1,0,0) or Vector3.new(-1,0,0),true) end end end end
        if RB.autoCrouchOn and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            local c=LP.Character;if c then local hm=c:FindFirstChildOfClass("Humanoid")
                if hm then hm.CameraOffset=Vector3.new(0,-1.5,0) end end
        elseif RB.autoCrouchOn then
            local c=LP.Character;if c then local hm=c:FindFirstChildOfClass("Humanoid")
                if hm then hm.CameraOffset=Vector3.new(0,0,0) end end end
        if RB.autoKnifeOn then
            local c=LP.Character;if c then
                local myHRP=c:FindFirstChild("HumanoidRootPart")
                if myHRP then
                    for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP and plr.Character then
                        local tHRP=plr.Character:FindFirstChild("HumanoidRootPart")
                        if tHRP and (myHRP.Position-tHRP.Position).Magnitude<=RB.knifeDist then
                            task.spawn(function() mouse1click() end) end end end end end end
        if RB.velChangeOn then
            local c=LP.Character;if c then
                local hrp=c:FindFirstChild("HumanoidRootPart")
                local hm=c:FindFirstChildOfClass("Humanoid")
                if hrp and hm then
                    local cf=Cam.CFrame;local dir=Vector3.zero
                    if UIS:IsKeyDown(Enum.KeyCode.W) then dir=dir+Vector3.new(cf.LookVector.X,0,cf.LookVector.Z) end
                    if UIS:IsKeyDown(Enum.KeyCode.S) then dir=dir-Vector3.new(cf.LookVector.X,0,cf.LookVector.Z) end
                    if UIS:IsKeyDown(Enum.KeyCode.A) then dir=dir-Vector3.new(cf.RightVector.X,0,cf.RightVector.Z) end
                    if UIS:IsKeyDown(Enum.KeyCode.D) then dir=dir+Vector3.new(cf.RightVector.X,0,cf.RightVector.Z) end
                    if dir.Magnitude>0 then
                        hrp.CFrame=hrp.CFrame+dir.Unit*(RB.velAmt*0.016)
                    end
                end end end
        if RB.fovOn then
            fovImg.Visible=true
            fovImg.Size=UDim2.new(0,RB.fovSize*2,0,RB.fovSize*2)
            fovImg.Position=UDim2.new(0.5,-RB.fovSize,0.5,-RB.fovSize)
        else fovImg.Visible=false end
        spreadCirc.Visible=RB.spreadCircleOn
    end)
    RS.RenderStepped:Connect(function(dt)
        if RB.dtOn and not RB.dtCD and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            RB.dtCD=true
            task.spawn(function()
                mouse1click()
                task.wait(0.05)
                mouse1click()
            end)
            task.delay(0.15,function() RB.dtCD=false end)
        end
        if RB.edgeBugOn then
            local c=LP.Character;if c then
                local hm=c:FindFirstChildOfClass("Humanoid")
                if hm and UIS:IsKeyDown(Enum.KeyCode.Space) and hm:GetState()==Enum.HumanoidStateType.Running then
                    hm:ChangeState(Enum.HumanoidStateType.Jumping)
                    task.spawn(function() task.wait(0.04);hm:ChangeState(Enum.HumanoidStateType.Running) end) end end end
        if RB.resolverOn then
            for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP and plr.Character then
                local hrp=plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp then pcall(function()
                    hrp.CFrame=CFrame.new(hrp.Position)*CFrame.Angles(0,hrp.CFrame:ToEulerAnglesYXZ()+math.pi,0) end) end end end end
    end)
    Pl.PlayerAdded:Connect(function() end)
    for _,plr in ipairs(Pl:GetPlayers()) do
        if plr~=LP and plr.Character then
            local hm=plr.Character:FindFirstChildOfClass("Humanoid")
            if hm then
                local lastHp=hm.Health
                hm:GetPropertyChangedSignal("Health"):Connect(function()
                    local dmg=lastHp-hm.Health
                    if dmg>0 and RB.hitMarkerOn then showHitMarker(dmg) end
                    lastHp=hm.Health
                end)
            end
            plr.CharacterAdded:Connect(function(ch)
                task.wait(.1);local hm2=ch:FindFirstChildOfClass("Humanoid");if not hm2 then return end
                local lastHp2=hm2.Health
                hm2:GetPropertyChangedSignal("Health"):Connect(function()
                    local dmg=lastHp2-hm2.Health
                    if dmg>0 and RB.hitMarkerOn then showHitMarker(dmg) end
                    lastHp2=hm2.Health
                end)
            end)
        end
    end
    sec(rbPg,"Aimbot",1)
    tog(rbPg,"Auto Fire","Fires automatically when locked on",false,2,function(on) RB.autoFireOn=on end)
    tog(rbPg,"Prediction","Lead moving targets",false,3,function(on) RB.predOn=on end)
    sld(rbPg,"Prediction Amount",1,30,12,4,function(v) RB.predAmount=v/100 end)
    tog(rbPg,"FOV Circle","Show aimbot range circle",true,5,function(on) RB.fovOn=on;fovImg.Visible=on end)
    sld(rbPg,"FOV Size",20,400,120,6,function(v) RB.fovSize=v end)
    local bpCard=fr(rbPg,UDim2.new(1,0,0,50),nil,Color3.fromRGB(25,25,25),10);bpCard.LayoutOrder=7;bpCard.BorderSizePixel=0
    local bpFace=fr(bpCard,UDim2.new(1,-4,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(68,68,68),11);bpFace.BorderSizePixel=0
    fr(bpCard,UDim2.new(1,-4,0,2),UDim2.new(0,2,0,0),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
    fr(bpCard,UDim2.new(0,2,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
    fr(bpCard,UDim2.new(1,-4,0,2),UDim2.new(0,2,1,-2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
    fr(bpCard,UDim2.new(0,2,1,-4),UDim2.new(1,-2,0,2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
    mcLbl(bpFace,"Bone Priority",UDim2.new(1,-160,0,14),UDim2.new(0,12,0,5),Color3.fromRGB(255,255,255),10,13,Enum.TextXAlignment.Left)
    mcLbl(bpFace,"Target hitbox priority",UDim2.new(1,-160,0,12),UDim2.new(0,12,0,22),Color3.fromRGB(160,160,160),9,12,Enum.TextXAlignment.Left)
    local bones={"Head","Neck","Chest"}
    local bpBtns={}
    for bi,bn in ipairs(bones) do
        local _bb,_bbf,_bbo=mcBtn(bpFace,bn,UDim2.new(0,52,0,22),UDim2.new(1,-170+(bi-1)*56,.5,-11),13)
        _bbf.BackgroundColor3=bn=="Head" and Color3.fromRGB(100,40,40) or Color3.fromRGB(80,80,80)
        bpBtns[bn]=_bbf
        local capBn=bn;_bb.MouseButton1Click:Connect(function()
            RB.bonePriority=capBn
            for _,bf in pairs(bpBtns) do bf.BackgroundColor3=Color3.fromRGB(80,80,80) end
            bpBtns[capBn].BackgroundColor3=Color3.fromRGB(100,40,40)
        end)
    end
    sec(rbPg,"Combat",20)
    tog(rbPg,"Resolver","Counter enemy anti-aim",false,21,function(on) RB.resolverOn=on end)
    tog(rbPg,"Double Tap","Rapid double shot on click",false,22,function(on) RB.dtOn=on end)
    tog(rbPg,"Backtrack","Aim at recent past positions",false,23,function(on) RB.btOn=on end)
    sld(rbPg,"Backtrack Ms",50,300,150,24,function(v) RB.btMs=v end)
    sec(rbPg,"Movement",30)
    tog(rbPg,"Edge Bug","Fast jump timing exploit",false,31,function(on) RB.edgeBugOn=on end)
    tog(rbPg,"Air Strafe","Auto A/D strafe mid-air",false,32,function(on) RB.strafeOn=on end)
    tog(rbPg,"Auto Crouch","Crouch when shooting",false,33,function(on) RB.autoCrouchOn=on end)
    tog(rbPg,"Fake Duck","Spam crouch to confuse hitbox",false,34,function(on) RB.fakeDuckOn=on
        if not on then local c=LP.Character;if c then local hm=c:FindFirstChildOfClass("Humanoid");if hm then hm.CameraOffset=Vector3.zero end end end end)
    sec(rbPg,"Visuals",40)
    tog(rbPg,"Spread Circle","Shows spread ring on crosshair",false,41,function(on) RB.spreadCircleOn=on;spreadCirc.Visible=on end)
    tog(rbPg,"Hit Marker","Flash when you hit someone",false,42,function(on) RB.hitMarkerOn=on end)
    tog(rbPg,"Damage Indicator","Show damage numbers",false,43,function(on) RB.damageIndOn=on end)
    tog(rbPg,"Chams","Solid color glow through walls",false,44,function(on) RB.chamsOn=on
        if on then for _,pl in ipairs(Pl:GetPlayers()) do if pl~=LP and pl.Character then applyChams(pl,pl.Character) end end
        else for pl,_ in pairs(chamD) do removeChams(pl) end end end)
    sec(rbPg,"Anti-Aim",50)
    tog(rbPg,"Anti-Aim","Rotate body to confuse enemies",false,51,function(on) RB.antiAimOn=on
        if not on then local c=LP.Character;if c then local hrp=c:FindFirstChild("HumanoidRootPart")
            if hrp then pcall(function() hrp.CFrame=CFrame.new(hrp.Position)*CFrame.Angles(0,Cam.CFrame:ToEulerAnglesYXZ(),0) end) end end end end)
    local aaCard=fr(rbPg,UDim2.new(1,0,0,50),nil,Color3.fromRGB(25,25,25),10);aaCard.LayoutOrder=52;aaCard.BorderSizePixel=0
    local aaFace=fr(aaCard,UDim2.new(1,-4,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(68,68,68),11);aaFace.BorderSizePixel=0
    fr(aaCard,UDim2.new(1,-4,0,2),UDim2.new(0,2,0,0),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
    fr(aaCard,UDim2.new(0,2,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
    fr(aaCard,UDim2.new(1,-4,0,2),UDim2.new(0,2,1,-2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
    fr(aaCard,UDim2.new(0,2,1,-4),UDim2.new(1,-2,0,2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
    mcLbl(aaFace,"Anti-Aim Mode",UDim2.new(1,-180,0,14),UDim2.new(0,12,0,5),Color3.fromRGB(255,255,255),10,13,Enum.TextXAlignment.Left)
    local aaModes={"Spin","Jitter","Static"}
    local aaBtns={}
    for ai,am in ipairs(aaModes) do
        local _ab,_abf,_abo=mcBtn(aaFace,am,UDim2.new(0,54,0,22),UDim2.new(1,-174+(ai-1)*58,.5,-11),13)
        _abf.BackgroundColor3=am=="Spin" and Color3.fromRGB(100,40,40) or Color3.fromRGB(80,80,80)
        aaBtns[am]=_abf
        local capAm=am;_ab.MouseButton1Click:Connect(function()
            RB.antiAimMode=capAm
            for _,af in pairs(aaBtns) do af.BackgroundColor3=Color3.fromRGB(80,80,80) end
            aaBtns[capAm].BackgroundColor3=Color3.fromRGB(100,40,40)
        end)
    end
    sec(rbPg,"Misc",60)
    tog(rbPg,"Fake Lag Burst","Hold lag then release all at once",false,61,function(on) RB.fakeLagBurstOn=on end)
    local flbCard=fr(rbPg,UDim2.new(1,0,0,40),nil,Color3.fromRGB(25,25,25),10);flbCard.LayoutOrder=62;flbCard.BorderSizePixel=0
    local flbFace=fr(flbCard,UDim2.new(1,-4,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(68,68,68),11);flbFace.BorderSizePixel=0
    fr(flbCard,UDim2.new(1,-4,0,2),UDim2.new(0,2,0,0),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
    fr(flbCard,UDim2.new(0,2,1,-4),UDim2.new(0,2,0,2),Color3.fromRGB(110,110,110),12).BorderSizePixel=0
    fr(flbCard,UDim2.new(1,-4,0,2),UDim2.new(0,2,1,-2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
    fr(flbCard,UDim2.new(0,2,1,-4),UDim2.new(1,-2,0,2),Color3.fromRGB(30,30,30),12).BorderSizePixel=0
    mcLbl(flbFace,"Hold to Burst",UDim2.new(1,-100,1,0),UDim2.new(0,12,0,0),Color3.fromRGB(160,160,160),9,13,Enum.TextXAlignment.Left)
    local _flbBtn,_flbBtnF,_=mcBtn(flbFace,"HOLD",UDim2.new(0,70,0,28),UDim2.new(1,-80,.5,-14),13)
    _flbBtn.MouseButton1Down:Connect(function() if RB.fakeLagBurstOn then RB.flbHeld=true;_flbBtnF.BackgroundColor3=Color3.fromRGB(200,60,60) end end)
    _flbBtn.MouseButton1Up:Connect(function() RB.flbHeld=false;_flbBtnF.BackgroundColor3=Color3.fromRGB(139,139,139) end)
    tog(rbPg,"Velocity Change","Boost movement speed via CFrame",false,63,function(on) RB.velChangeOn=on end)
    sld(rbPg,"Velocity Amount",10,200,80,64,function(v) RB.velAmt=v end)
    tog(rbPg,"Auto Knife","Auto-melee when enemy is close",false,65,function(on) RB.autoKnifeOn=on end)
    sld(rbPg,"Knife Distance",3,20,8,66,function(v) RB.knifeDist=v end)
    Pl.PlayerAdded:Connect(function(plr)
        if not RB.chamsOn then return end
        if plr.Character then applyChams(plr,plr.Character) end
        plr.CharacterAdded:Connect(function(ch) task.wait(.1);if RB.chamsOn then applyChams(plr,ch) end end)
    end)
    Pl.PlayerRemoving:Connect(function(plr) removeChams(plr) end)
    RS.RenderStepped:Connect(function()
        if RB.autoFireOn and S.aimbotOn and aimbotLast and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            task.spawn(function() mouse1click() end)
        end
        if RB.btOn and aimbotLast then
            local plrOfTarget=nil
            for _,plr in ipairs(Pl:GetPlayers()) do
                if plr~=LP and plr.Character and plr.Character:FindFirstChild("Head")==aimbotLast then
                    plrOfTarget=plr;break end end
            if plrOfTarget and btHistory[plrOfTarget] then
                local btDelay=RB.btMs/1000
                for _,rec in ipairs(btHistory[plrOfTarget]) do
                    if tick()-rec.t>=btDelay then
                        local tgtPos=rec.cf.Position+Vector3.new(0,1.5,0)
                        local alpha=math.clamp(S.aimbotSmooth,0.02,1.0)
                        Cam.CFrame=Cam.CFrame:Lerp(CFrame.new(Cam.CFrame.Position,tgtPos),alpha)
                        break
                    end
                end
            end
        end
        if RB.predOn and aimbotLast and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local hrp=aimbotLast.Parent and aimbotLast.Parent:FindFirstChild("HumanoidRootPart")
            if hrp then
                local _ok,vel=pcall(function() return hrp.AssemblyLinearVelocity end);vel=_ok and vel or Vector3.zero
                local predPos=aimbotLast.Position+vel*RB.predAmount
                local alpha=math.clamp(S.aimbotSmooth,0.02,1.0)
                Cam.CFrame=Cam.CFrame:Lerp(CFrame.new(Cam.CFrame.Position,predPos),alpha)
            end
        end
    end)
    local stPg=pages["settings"]
    sec(stPg,"GUI Accent Color",1)
    local ccCard=fr(stPg,UDim2.new(1,0,0,60),nil,C.card,3);ccCard.LayoutOrder=2;rnd(ccCard,10);bdr(ccCard,C.border,.8)
    lb(ccCard,"GUI Accent Color",UDim2.new(1,0,0,16),UDim2.new(0,16,0,7),C.txt,Enum.Font.SciFi,11,4,Enum.TextXAlignment.Left)
    lb(ccCard,"Changes highlights, toggles and indicators",UDim2.new(1,0,0,12),UDim2.new(0,16,0,24),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
    local ccRow=fr(ccCard,UDim2.new(1,-32,0,18),UDim2.new(0,16,0,38),C.bg,4);ccRow.BackgroundTransparency=1
    local ccLL=Instance.new("UIListLayout");ccLL.FillDirection=Enum.FillDirection.Horizontal;ccLL.Padding=UDim.new(0,6);ccLL.Parent=ccRow
    for _,p in ipairs({
        {Color3.fromRGB(108,92,255),Color3.fromRGB(155,143,255),Color3.fromRGB(22,18,68)},
        {Color3.fromRGB(45,205,115),Color3.fromRGB(90,240,155),Color3.fromRGB(11,52,28)},
        {Color3.fromRGB(232,55,55),Color3.fromRGB(255,95,95),Color3.fromRGB(60,14,14)},
        {Color3.fromRGB(255,155,30),Color3.fromRGB(255,200,100),Color3.fromRGB(60,35,8)},
        {Color3.fromRGB(180,60,255),Color3.fromRGB(220,130,255),Color3.fromRGB(42,12,62)},
        {Color3.fromRGB(30,200,230),Color3.fromRGB(110,240,255),Color3.fromRGB(8,44,55)},
        {Color3.fromRGB(255,85,155),Color3.fromRGB(255,155,200),Color3.fromRGB(58,12,32)},
        {Color3.fromRGB(180,180,200),Color3.fromRGB(220,220,240),Color3.fromRGB(38,38,55)}}) do
        local sw=bt(ccRow,"",UDim2.new(0,20,0,18),nil,p[1],C.white,Enum.Font.SciFi,11,5);rnd(sw,6)
        sw.MouseEnter:Connect(function() tw(sw,{Size=UDim2.new(0,24,0,20)}) end)
        sw.MouseLeave:Connect(function() tw(sw,{Size=UDim2.new(0,20,0,18)}) end)
        local cap=p;sw.MouseButton1Click:Connect(function() recolor(cap[1],cap[2],cap[3]) end)
    end
    sec(stPg,"Hide Keybind",10)
    local kbCard=fr(stPg,UDim2.new(1,0,0,52),nil,C.card,3);kbCard.LayoutOrder=11;rnd(kbCard,10);bdr(kbCard,C.border,.8)
    lb(kbCard,"Toggle GUI Visibility",UDim2.new(1,-120,0,16),UDim2.new(0,16,0,7),C.txt,Enum.Font.SciFi,11,4,Enum.TextXAlignment.Left)
    lb(kbCard,"Click the button then press any key",UDim2.new(1,-16,0,12),UDim2.new(0,16,0,25),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
    local hideKey={kc=Enum.KeyCode.RightShift,name="RShift"}
    local kbBtn=bt(kbCard,"[ RShift ]",UDim2.new(0,84,0,22),UDim2.new(1,-92,.5,-11),A.d,A.c,Enum.Font.SciFi,9,5);rnd(kbBtn,7)
    acReg[#acReg+1]={obj=kbBtn,prop="BackgroundColor3",role="d"}
    acReg[#acReg+1]={obj=kbBtn,prop="TextColor3",role="c"}
    local listening=false
    kbBtn.MouseButton1Click:Connect(function()
        if listening then return end;listening=true;kbBtn.Text="· · ·";kbBtn.TextColor3=C.mut
        local cn;cn=UIS.InputBegan:Connect(function(inp,gp)
            if gp or inp.UserInputType~=Enum.UserInputType.Keyboard then return end
            hideKey.kc=inp.KeyCode;hideKey.name=tostring(inp.KeyCode):gsub("Enum.KeyCode.","")
            kbBtn.Text="[ "..hideKey.name.." ]";kbBtn.TextColor3=A.c
            StLbl.Text="F = Fly  ·  RMB = Aim  ·  "..hideKey.name.." = Hide"
            listening=false;cn:Disconnect()
        end)
    end)
    kbCard.MouseEnter:Connect(function() tw(kbCard,{BackgroundColor3=C.cardHi}) end)
    kbCard.MouseLeave:Connect(function() tw(kbCard,{BackgroundColor3=C.card}) end)
    local PrevUI=gui("MS_PreviewUI");PrevUI.Enabled=false
    local PrevWin=fr(PrevUI,UDim2.new(0,550,0,430),UDim2.new(.5,-275,.5,-215),C.panel,2)
    PrevWin.Active=true;PrevWin.Draggable=true;rnd(PrevWin,16);bdr(PrevWin,C.border,.8);grd(PrevWin,C.panel,C.bg,155)
    fr(PrevWin,UDim2.new(1,-20,0,1),UDim2.new(0,10,0,56),C.border,5)
    local pvHdr=fr(PrevWin,UDim2.new(1,0,0,56),nil,C.bg,4);pvHdr.BackgroundTransparency=1
    lb(pvHdr,"Player Preview",UDim2.new(1,-60,0,20),UDim2.new(0,18,0,10),C.txt,Enum.Font.SciFi,15,5,Enum.TextXAlignment.Left)
    lb(pvHdr,"Select a player to preview their avatar",UDim2.new(1,-60,0,14),UDim2.new(0,18,0,30),C.mut,Enum.Font.SciFi,9,5,Enum.TextXAlignment.Left)
    local pvX=bt(pvHdr,"✕",UDim2.new(0,28,0,28),UDim2.new(1,-38,0,14),C.card,C.sub,Enum.Font.SciFi,12,6);rnd(pvX,8);bdr(pvX,C.border,.8)
    pvX.MouseEnter:Connect(function() tw(pvX,{BackgroundColor3=C.rage,TextColor3=C.white}) end)
    pvX.MouseLeave:Connect(function() tw(pvX,{BackgroundColor3=C.card,TextColor3=C.sub}) end)
    pvX.MouseButton1Click:Connect(function() PrevUI.Enabled=false end)
    local pvList=fr(PrevWin,UDim2.new(0,166,1,-70),UDim2.new(0,10,0,62),C.surface,3);rnd(pvList,12);bdr(pvList,C.border,.8)
    local pvScroll=Instance.new("ScrollingFrame");pvScroll.Size=UDim2.new(1,0,1,0);pvScroll.BackgroundTransparency=1
    pvScroll.BorderSizePixel=0;pvScroll.ScrollBarThickness=2;pvScroll.ScrollBarImageColor3=A.d;pvScroll.CanvasSize=UDim2.new(0,0,0,0);pvScroll.Parent=pvList
    local pvLL=Instance.new("UIListLayout");pvLL.Padding=UDim.new(0,4);pvLL.Parent=pvScroll
    local pvPad=Instance.new("UIPadding");pvPad.PaddingTop=UDim.new(0,6);pvPad.PaddingLeft=UDim.new(0,6);pvPad.PaddingRight=UDim.new(0,6);pvPad.Parent=pvScroll
    pvLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() pvScroll.CanvasSize=UDim2.new(0,0,0,pvLL.AbsoluteContentSize.Y+12) end)
    local pvVPF=Instance.new("ViewportFrame")
    pvVPF.Size=UDim2.new(1,-192,1,-122);pvVPF.Position=UDim2.new(0,184,0,62)
    pvVPF.BackgroundColor3=Color3.fromRGB(8,8,14);pvVPF.BorderSizePixel=0;pvVPF.ZIndex=3
    pvVPF.LightColor=Color3.fromRGB(255,255,255);pvVPF.Ambient=Color3.fromRGB(170,165,230);pvVPF.Parent=PrevWin
    rnd(pvVPF,12);bdr(pvVPF,C.border,.8)
    local pvCam=Instance.new("Camera");pvCam.FieldOfView=50;pvCam.Parent=pvVPF;pvVPF.CurrentCamera=pvCam
    local pvTgtName=lb(PrevWin,"No player selected",UDim2.new(1,-192,0,18),UDim2.new(0,184,1,-120),C.txt,Enum.Font.SciFi,13,5,Enum.TextXAlignment.Center)
    local pvHpBg=fr(PrevWin,UDim2.new(1,-192,0,6),UDim2.new(0,184,1,-98),C.input,4);rnd(pvHpBg,4)
    local pvHpFill=fr(pvHpBg,UDim2.new(1,0,1,0),nil,C.legit,5);rnd(pvHpFill,4)
    local pvHpTxt=lb(PrevWin,"",UDim2.new(1,-192,0,14),UDim2.new(0,184,1,-88),C.mut,Enum.Font.SciFi,10,5,Enum.TextXAlignment.Center)
    local pvWM=nil;local pvRot=0;local pvSelBtn=nil
    local function loadPreviewPlayer(plr)
        pvTgtName.Text=plr.Name;if pvWM then pvWM:Destroy();pvWM=nil end
        local ch=plr.Character;if not ch then pvTgtName.Text=plr.Name.." (no character)";return end
        pvWM=Instance.new("WorldModel");pvWM.Parent=pvVPF
        local clone=ch:Clone()
        for _,s in ipairs(clone:GetDescendants()) do if s:IsA("Script") or s:IsA("LocalScript") or s:IsA("ModuleScript") then s:Destroy() end end
        for _,pp in ipairs(clone:GetDescendants()) do if pp:IsA("BasePart") then pcall(function() pp.Anchored=true;pp.CanCollide=false;pp.LocalTransparencyModifier=0 end) end end
        local hmc=clone:FindFirstChildOfClass("Humanoid");if hmc then hmc.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None end
        clone.Parent=pvWM
        local hm5=ch:FindFirstChildOfClass("Humanoid")
        if hm5 then local pct=math.clamp(hm5.Health/math.max(hm5.MaxHealth,1),0,1)
            pvHpFill.Size=UDim2.new(pct,0,1,0);pvHpFill.BackgroundColor3=pct>0.6 and C.legit or pct>0.3 and C.gold or C.rage
            pvHpTxt.Text=math.floor(hm5.Health).." / "..math.floor(hm5.MaxHealth).." HP" end
    end
    openPreview=function(plr)
        PrevUI.Enabled=true;loadPreviewPlayer(plr)
        for _,c in ipairs(pvScroll:GetChildren()) do if c:IsA("TextButton") then tw(c,{BackgroundColor3=C.card,TextColor3=C.txt}) end end
    end
    local function refreshPvList()
        for _,c in ipairs(pvScroll:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
        for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP then
            local btn=bt(pvScroll,"",UDim2.new(1,0,0,36),nil,C.card,C.txt,Enum.Font.SciFi,11,3);rnd(btn,8);bdr(btn,C.border,.8)
            local hm6=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
            lb(btn,plr.Name,UDim2.new(1,-8,0,18),UDim2.new(0,8,0,4),C.txt,Enum.Font.SciFi,10,4,Enum.TextXAlignment.Left)
            lb(btn,hm6 and math.floor(hm6.Health).." HP" or "",UDim2.new(1,-8,0,12),UDim2.new(0,8,0,22),C.mut,Enum.Font.SciFi,9,4,Enum.TextXAlignment.Left)
            btn.MouseEnter:Connect(function() if btn~=pvSelBtn then tw(btn,{BackgroundColor3=C.cardHi}) end end)
            btn.MouseLeave:Connect(function() if btn~=pvSelBtn then tw(btn,{BackgroundColor3=C.card}) end end)
            local cap=plr
            btn.MouseButton1Click:Connect(function()
                if pvSelBtn and pvSelBtn.Parent then tw(pvSelBtn,{BackgroundColor3=C.card}) end
                pvSelBtn=btn;tw(btn,{BackgroundColor3=A.d});loadPreviewPlayer(cap)
            end)
        end end
    end
    rPL();Pl.PlayerAdded:Connect(function() task.delay(.1,rPL) end);Pl.PlayerRemoving:Connect(function() task.delay(.3,rPL) end)
    refreshPvList()
    Pl.PlayerAdded:Connect(function() task.delay(.1,refreshPvList) end)
    Pl.PlayerRemoving:Connect(function() task.delay(.3,refreshPvList) end)
    RS.RenderStepped:Connect(function(dt)
        if PrevUI.Enabled and pvWM then
            local mdl=pvWM:FindFirstChildWhichIsA("Model")
            if mdl then local ref=mdl:FindFirstChild("HumanoidRootPart") or mdl:FindFirstChild("Head")
                if ref then pvRot=(pvRot+dt*0.5)%(math.pi*2);local ctr=ref.Position+Vector3.new(0,.8,0);local d=5.5
                    pvCam.CFrame=CFrame.new(Vector3.new(ctr.X+math.cos(pvRot)*d,ctr.Y,ctr.Z+math.sin(pvRot)*d),ctr) end end end
    end)
    prevTogBtn.MouseButton1Click:Connect(function()
        PrevUI.Enabled=not PrevUI.Enabled
        if PrevUI.Enabled then
            refreshPvList()
            if pvSelBtn==nil then
                local firstBtn=nil
                for _,c in ipairs(pvScroll:GetChildren()) do if c:IsA("TextButton") then firstBtn=c;break end end
                if firstBtn then firstBtn:GetPropertyChangedSignal("BackgroundColor3") end
                for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP then
                    loadPreviewPlayer(plr);break end end
            end
        end
    end)
    local mini=false
    MinB.MouseButton1Click:Connect(function() mini=not mini
        tw(Win,{Size=mini and UDim2.new(0,680,0,60) or UDim2.new(0,680,0,490)},.28,Enum.EasingStyle.Back);MinB.Text=mini and "+" or "—" end)
    UIS.InputBegan:Connect(function(i,gp) pcall(function() if gp then return end;if i.KeyCode==hideKey.kc then Win.Visible=not Win.Visible end end) end)
    if MODE=="Rage" then
        local tbCD=false
        local function isEnemy(inst)
            if not inst then return false end;local chr=inst.Parent;if not chr then return false end
            for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP and plr.Character==chr then
                local hm=chr:FindFirstChildOfClass("Humanoid");if hm and hm.Health>0 then return true end end end;return false
        end
        task.spawn(function()
            local prm=RaycastParams.new();prm.FilterType=Enum.RaycastFilterType.Exclude
            while task.wait(0.05) do if S.triggerbotOn and not tbCD then
                local mc=LP.Character;if mc then prm.FilterDescendantsInstances={mc} end
                local vp=Cam.ViewportSize;local cx,cy=vp.X/2,vp.Y/2
                local res=workspace:Raycast(Cam:ScreenPointToRay(cx,cy).Origin,Cam:ScreenPointToRay(cx,cy).Direction*500,prm)
                if res and res.Instance then
                    local sp2,on2=Cam:WorldToScreenPoint(res.Position)
                    local d2=math.sqrt((sp2.X-cx)^2+(sp2.Y-cy)^2)
                    if on2 and d2<=S.triggerbotFov and isEnemy(res.Instance) then tbCD=true;mouse1click();task.delay(0.09,function() tbCD=false end) end
                end
            end end
        end)
    end
    RS.Heartbeat:Connect(function()
        if S.speedOn then local c=LP.Character;if c then local h=c:FindFirstChildOfClass("Humanoid");if h then h.WalkSpeed=S.speedVal end end end
        if S.noclipOn then local c=LP.Character;if c then for _,pp in ipairs(c:GetDescendants()) do if pp:IsA("BasePart") then pp.CanCollide=false end end end end
        if S.bhopOn then local c=LP.Character;if c then local hm=c:FindFirstChildOfClass("Humanoid")
            if hm and UIS:IsKeyDown(Enum.KeyCode.Space) and hm:GetState()==Enum.HumanoidStateType.Landed then hm:ChangeState(Enum.HumanoidStateType.Jumping) end end end
        if S.silentAimOn then
            local sz=MODE=="Rage" and SILENT_SIZE_RAGE or SILENT_SIZE_LEGIT
            for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP and plr.Character then
                local h=plr.Character:FindFirstChild("Head")
                if h then
                    if not silentOrigSizes[plr] then silentOrigSizes[plr]=h.Size end
                    if silentOrigTrans[plr]==nil then silentOrigTrans[plr]=h.LocalTransparencyModifier end
                    pcall(function() h.Size=Vector3.new(sz,sz,sz) end)
                    pcall(function()
                        h.LocalTransparencyModifier=1
                        for _,dec in ipairs(h:GetDescendants()) do
                            if dec:IsA("BasePart") or dec:IsA("SpecialMesh") then
                                dec.LocalTransparencyModifier=1
                            end
                        end
                    end)
                end end end
        end
        if invOn then local c=LP.Character;if c then
            local hrp=c:FindFirstChild("HumanoidRootPart");local hm2=c:FindFirstChildOfClass("Humanoid")
            for _,pp in ipairs(c:GetDescendants()) do if pp:IsA("BasePart") then pp.CanCollide=false end end
            if hm2 then pcall(function() hm2.PlatformStand=true end) end
            if hrp and invFloorY then
                local tY=invFloorY-8
                if invBP then pcall(function() invBP.Position=Vector3.new(hrp.Position.X,tY,hrp.Position.Z) end) end
                if hrp.Position.Y>tY+2 then hrp.CFrame=CFrame.new(hrp.Position.X,tY,hrp.Position.Z) end
                local dir2=Vector3.zero;local cf2=Cam.CFrame
                if UIS:IsKeyDown(Enum.KeyCode.W) then dir2=dir2+Vector3.new(cf2.LookVector.X,0,cf2.LookVector.Z) end
                if UIS:IsKeyDown(Enum.KeyCode.S) then dir2=dir2-Vector3.new(cf2.LookVector.X,0,cf2.LookVector.Z) end
                if UIS:IsKeyDown(Enum.KeyCode.A) then dir2=dir2-Vector3.new(cf2.RightVector.X,0,cf2.RightVector.Z) end
                if UIS:IsKeyDown(Enum.KeyCode.D) then dir2=dir2+Vector3.new(cf2.RightVector.X,0,cf2.RightVector.Z) end
                if dir2.Magnitude>0 then hrp.CFrame=hrp.CFrame+dir2.Unit*0.5 end
            end
        end end
        if S.uVelOn then
            local c2=LP.Character;if c2 then
                local hm=c2:FindFirstChildOfClass("Humanoid");if hm then
                    local moving=UIS:IsKeyDown(Enum.KeyCode.W) or UIS:IsKeyDown(Enum.KeyCode.A)
                        or UIS:IsKeyDown(Enum.KeyCode.S) or UIS:IsKeyDown(Enum.KeyCode.D)
                    hm.WalkSpeed=moving and S.uVelAmt or (S.speedOn and S.speedVal or 16)
                end end end
                if S.antiFlingOn then pcall(function()
                    local c=LP.Character;if not c then return end
                    local h=c:FindFirstChild("HumanoidRootPart");if not h then return end
                    local ok,v=pcall(function() return h.AssemblyLinearVelocity end)
                    if ok and v and v.Magnitude>80 then
                        pcall(function() h.AssemblyLinearVelocity=Vector3.new(v.X*0.04,math.min(v.Y,25),v.Z*0.04) end)
                    end
                end) end
    end)
    UIS.JumpRequest:Connect(function()
        if not S.jumpOn then return end
        local c=LP.Character;if not c then return end
        local hm=c:FindFirstChildOfClass("Humanoid");if not hm then return end
        hm:ChangeState(Enum.HumanoidStateType.Jumping)
    end)
    RS.RenderStepped:Connect(function(dt)
        if S.aimbotOn and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local best,bd=nil,math.huge;local sc=Vector2.new(Cam.ViewportSize.X/2,Cam.ViewportSize.Y/2)
            local myHRP=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP and plr.Character then
                local hd=plr.Character:FindFirstChild("Head");local hm=plr.Character:FindFirstChildOfClass("Humanoid")
                local thHRP=plr.Character:FindFirstChild("HumanoidRootPart")
                if hd and hm and hm.Health>0 then
                    local dOk=not(myHRP and thHRP and (myHRP.Position-thHRP.Position).Magnitude>S.maxDist)
                    local vOk=not S.visCheck or isVis(hd,plr.Character)
                    if dOk and vOk then local ps,on=Cam:WorldToScreenPoint(hd.Position)
                        if on then local d=(Vector2.new(ps.X,ps.Y)-sc).Magnitude;if d<bd then bd=d;best=hd end end end end end end
            if best~=aimbotLast and tick()-aimbotTick>=S.switchDelay*0.1 then aimbotLast=best;aimbotTick=tick() end
            local tgt=aimbotLast
            if tgt then local aimPos=tgt.Position
                if S.multipointOn and tgt.Parent then local pts={}
                    for _,pn in ipairs(MPARTS) do local pp=tgt.Parent:FindFirstChild(pn);if pp then pts[#pts+1]=pp end end
                    if #pts>0 then aimPos=pts[math.random(1,#pts)].Position end end
                if S.jitterOn and S.jitterVal>0 then local jv=S.jitterVal*0.06
                    aimPos=aimPos+Vector3.new((math.random()-.5)*jv,(math.random()-.5)*jv,0) end
                local alpha=math.clamp(S.aimbotSmooth,0.02,1.0)
                local curCF=Cam.CFrame
                local targetCF=CFrame.new(curCF.Position,aimPos)
                Cam.CFrame=curCF:Lerp(targetCF,alpha)
            end end
        if S.spinOn then local c=LP.Character;if c then local hr=c:FindFirstChild("HumanoidRootPart")
            if hr then spinA=(spinA+S.spinVal*dt*50)%360;hr.CFrame=CFrame.new(hr.Position)*CFrame.Angles(0,math.rad(spinA),0) end end end
        if S.espOn and S.espBoxOn then local myHRP2=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            for plr,d in pairs(espD) do local ch=plr.Character
                if ch and d.bx then local hd=ch:FindFirstChild("Head");local hrp3=ch:FindFirstChild("HumanoidRootPart")
                    if hd and hrp3 then
                        local dOk2=not(myHRP2 and (myHRP2.Position-hrp3.Position).Magnitude>S.maxDist)
                        local vOk2=not S.visCheck or isVis(hd,ch)
                        if dOk2 and vOk2 then
                            local topWorld=hd.Position+Vector3.new(0,hd.Size.Y*0.5+0.15,0)
                            local botWorld=hrp3.Position-Vector3.new(0,hrp3.Size.Y*0.5+0.1,0)
                            local ts,ton=Cam:WorldToViewportPoint(topWorld);local bs,_=Cam:WorldToViewportPoint(botWorld)
                            if ton and ts.Z>0 then
                                local boxH=math.abs(bs.Y-ts.Y);local boxW=math.max(boxH*0.5,20);local cx2=(ts.X+bs.X)*0.5
                                setBox(d.bx,math.floor(cx2-boxW*0.5),math.floor(ts.Y),math.floor(cx2+boxW*0.5),math.floor(bs.Y))
                            else hideBox(d.bx) end
                        else hideBox(d.bx) end
                    else hideBox(d.bx) end
                else hideBox(d.bx) end end end
    end)
    local flyActive=false
    UIS.InputBegan:Connect(function(i,gp)
        if gp or i.KeyCode~=Enum.KeyCode.F or not S.flyOn then return end
        flying=not flying;flyActive=flying
        local c3=LP.Character;if not c3 then flying=false;flyActive=false;return end
        local hm3=c3:FindFirstChildOfClass("Humanoid")
        if flying then if hm3 then pcall(function() hm3.PlatformStand=true end) end
        else flyActive=false;if hm3 then pcall(function() hm3.PlatformStand=false end) end
            local h3=c3:FindFirstChild("HumanoidRootPart")
            if h3 then pcall(function() h3.AssemblyLinearVelocity=Vector3.zero end) end end
    end)
    RS.RenderStepped:Connect(function(dt)
        if flyActive and flying then
            local c3=LP.Character;if not c3 then return end
            local h3=c3:FindFirstChild("HumanoidRootPart");if not h3 then return end
            local hm3=c3:FindFirstChildOfClass("Humanoid");if hm3 then pcall(function() hm3.PlatformStand=true end) end
            local dir=Vector3.zero;local cf3=Cam.CFrame
            if UIS:IsKeyDown(Enum.KeyCode.W) then dir=dir+cf3.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then dir=dir-cf3.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then dir=dir-cf3.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then dir=dir+cf3.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then dir=dir+Vector3.new(0,1,0) end
            if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir=dir-Vector3.new(0,1,0) end
            if dir.Magnitude>0 then h3.CFrame=h3.CFrame+dir.Unit*S.flyVal*dt end
            pcall(function() h3.AssemblyLinearVelocity=Vector3.zero end)
        end
    end)
    LP.CharacterAdded:Connect(function()
        flying=false;fBV=nil;fBG=nil
        if fCn then fCn:Disconnect();fCn=nil end
        if invOn then invOn=false;invFloorY=nil end
        if auraEnabled then task.wait(.5);for _,pl in ipairs(Pl:GetPlayers()) do applyAura(pl) end end
        if angelEnabled then task.wait(.5);for _,pl in ipairs(Pl:GetPlayers()) do applyAngel(pl) end end
    end)
    local function markUser()
        local ch=LP.Character;if not ch then return end
        if not ch:FindFirstChild("_MeowlUser") then
            local tag=Instance.new("BoolValue");tag.Name="_MeowlUser";tag.Value=true;tag.Parent=ch end
    end
    markUser();LP.CharacterAdded:Connect(function() task.wait(.5);markUser() end)
    if isDev then
        sec(stPg,"Developer Tools",50)
        local devBadge=fr(stPg,UDim2.new(1,0,0,28),nil,C.card,3);devBadge.LayoutOrder=51;devBadge.BorderSizePixel=2
        mcLbl(devBadge,"Owner / Dev Access Active",UDim2.new(1,-16,0,20),UDim2.new(0,8,0,4),Color3.fromRGB(255,215,0),11,5,Enum.TextXAlignment.Left)
        sec(stPg,"FE Jerk",52)
        local jerkOn=false;local jerkIntensity=800
        local jerkCard=fr(stPg,UDim2.new(1,0,0,52),nil,C.card,3);jerkCard.LayoutOrder=53;jerkCard.BorderSizePixel=2
        mcLbl(jerkCard,"FE Jerk",UDim2.new(1,-80,0,18),UDim2.new(0,16,0,7),C.txt,11,5,Enum.TextXAlignment.Left)
        mcLbl(jerkCard,"Sends random BodyVelocity to all players",UDim2.new(1,-80,0,13),UDim2.new(0,16,0,27),C.mut,9,4,Enum.TextXAlignment.Left)
        local jkTrk=fr(jerkCard,UDim2.new(0,44,0,22),UDim2.new(1,-58,.5,-11),C.input,5)
        local jkKn=fr(jkTrk,UDim2.new(0,18,0,18),UDim2.new(0,2,.5,-9),C.white,6)
        local jkClk=bt(jerkCard,"",UDim2.new(1,0,1,0),nil,C.bg,C.white,Enum.Font.SciFi,1,7);jkClk.BackgroundTransparency=1
        jkClk.MouseButton1Click:Connect(function() jerkOn=not jerkOn
            tw(jkTrk,{BackgroundColor3=jerkOn and Color3.fromRGB(255,215,0) or C.input},.15)
            tw(jkKn,{Position=jerkOn and UDim2.new(1,-20,.5,-9) or UDim2.new(0,2,.5,-9)},.15,Enum.EasingStyle.Back) end)
        local jkSld=fr(stPg,UDim2.new(1,0,0,52),nil,C.card,3);jkSld.LayoutOrder=54;jkSld.BorderSizePixel=2
        mcLbl(jkSld,"Jerk Intensity",UDim2.new(.6,0,0,16),UDim2.new(0,16,0,6),C.txt,11,5,Enum.TextXAlignment.Left)
        local jkValLbl=lb(jkSld,"800",UDim2.new(.35,0,0,16),UDim2.new(.65,-16,0,6),Color3.fromRGB(255,215,0),Enum.Font.SciFi,11,5,Enum.TextXAlignment.Right)
        local jkTrkBg=fr(jkSld,UDim2.new(1,-32,0,4),UDim2.new(0,16,0,34),C.input,4)
        local jkFillBar=fr(jkTrkBg,UDim2.new(0.16,0,1,0),nil,Color3.fromRGB(255,215,0),5)
        local jkKnobBtn=bt(jkTrkBg,"",UDim2.new(0,12,0,12),UDim2.new(0.16,0,.5,0),C.white,C.white,Enum.Font.SciFi,1,6)
        jkKnobBtn.AnchorPoint=Vector2.new(.5,.5);local jkDrag=false
        jkKnobBtn.MouseButton1Down:Connect(function() jkDrag=true end)
        UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then jkDrag=false end end)
        UIS.InputChanged:Connect(function(i)
            if not jkDrag or i.UserInputType~=Enum.UserInputType.MouseMovement then return end
            local r=math.clamp((i.Position.X-jkTrkBg.AbsolutePosition.X)/jkTrkBg.AbsoluteSize.X,0,1)
            jerkIntensity=math.floor(100+r*4900);jkFillBar.Size=UDim2.new(r,0,1,0);jkKnobBtn.Position=UDim2.new(r,0,.5,0);jkValLbl.Text=tostring(jerkIntensity) end)
        task.spawn(function()
            while task.wait(0.07) do if jerkOn then
                for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP and plr.Character then
                    local h=plr.Character:FindFirstChild("HumanoidRootPart");if h then pcall(function()
                        local bv=Instance.new("BodyVelocity");bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge);bv.P=math.huge
                        bv.Velocity=Vector3.new(math.random(-jerkIntensity,jerkIntensity),math.random(200,jerkIntensity//2),math.random(-jerkIntensity,jerkIntensity))
                        bv.Parent=h;game:GetService("Debris"):AddItem(bv,0.07) end) end end end end end end)
        sec(stPg,"Dev Fling",60)
        local function devFlingPlayer(plr)
            if not plr.Character then return end
            local tHRP2=plr.Character:FindFirstChild("HumanoidRootPart");if not tHRP2 then return end
            task.spawn(function() for _=1,6 do pcall(function()
                local bv=Instance.new("BodyVelocity")
                bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge);bv.P=math.huge
                bv.Velocity=Vector3.new(math.random(-6000,6000),9000,math.random(-6000,6000))
                bv.Parent=tHRP2;game:GetService("Debris"):AddItem(bv,0.04) end);task.wait(0.04) end end)
        end
        local _frbo=fr(stPg,UDim2.new(1,0,0,32),nil,Color3.fromRGB(25,25,25),3);_frbo.LayoutOrder=61;_frbo.BorderSizePixel=0
        local _frb,_frbf,_=mcBtn(_frbo,"Refresh | Fling All",UDim2.new(1,0,1,0),nil,4)
        local flingRows={}
        local function buildFlingList()
            for _,r in ipairs(flingRows) do pcall(function() r:Destroy() end) end;flingRows={}
            local idx5=62
            for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP then
                local _fbo=fr(stPg,UDim2.new(1,0,0,28),nil,Color3.fromRGB(25,25,25),3);_fbo.LayoutOrder=idx5;_fbo.BorderSizePixel=0
                local _fb,_fbf,_=mcBtn(_fbo,plr.Name.."  [Fling]",UDim2.new(1,0,1,0),nil,4)
                _fbf.BackgroundColor3=Color3.fromRGB(110,70,70)
                local cap=plr;_fb.MouseButton1Click:Connect(function() devFlingPlayer(cap) end)
                flingRows[#flingRows+1]=_fbo;idx5=idx5+1 end end end
        _frb.MouseButton1Click:Connect(function() buildFlingList();for _,plr in ipairs(Pl:GetPlayers()) do if plr~=LP then devFlingPlayer(plr) end end end)
        buildFlingList();Pl.PlayerAdded:Connect(function() task.delay(.3,buildFlingList) end)
        Pl.PlayerRemoving:Connect(function() task.delay(.3,buildFlingList) end)
        sec(stPg,"Script Users",80)
        local _subo=fr(stPg,UDim2.new(1,0,0,32),nil,Color3.fromRGB(25,25,25),3);_subo.LayoutOrder=81;_subo.BorderSizePixel=0
        local _sub,_subf,_=mcBtn(_subo,"Scan Server",UDim2.new(1,0,1,0),nil,4)
        local userRows={}
        local function buildUsersList()
            for _,r in ipairs(userRows) do pcall(function() r:Destroy() end) end;userRows={}
            local found=0;local idx5=82
            for _,plr in ipairs(Pl:GetPlayers()) do
                local hasTag=plr.Character and plr.Character:FindFirstChild("_MeowlUser")
                local rowF=fr(stPg,UDim2.new(1,0,0,24),nil,Color3.fromRGB(40,40,40),3);rowF.LayoutOrder=idx5;rowF.BorderSizePixel=2
                fr(rowF,UDim2.new(0,8,0,8),UDim2.new(0,6,.5,-4),hasTag and C.legit or C.mut,5)
                mcLbl(rowF,(hasTag and "[MS] " or "      ")..plr.Name,UDim2.new(1,-20,0,16),UDim2.new(0,20,0,4),hasTag and Color3.fromRGB(255,215,0) or C.mut,9,5,Enum.TextXAlignment.Left)
                if hasTag then found=found+1 end;userRows[#userRows+1]=rowF;idx5=idx5+1 end
            local sumF=fr(stPg,UDim2.new(1,0,0,20),nil,C.card,3);sumF.LayoutOrder=idx5;sumF.BorderSizePixel=2
            mcLbl(sumF,found.." MeowlSense user(s) detected",UDim2.new(1,-16,0,16),UDim2.new(0,8,0,2),Color3.fromRGB(255,215,0),9,5,Enum.TextXAlignment.Left)
            userRows[#userRows+1]=sumF end
        _sub.MouseButton1Click:Connect(buildUsersList);buildUsersList()
        Pl.PlayerAdded:Connect(function() task.delay(.5,buildUsersList) end)
        Pl.PlayerRemoving:Connect(function() task.delay(.3,buildUsersList) end)
    end
    end
    do
        local ari=#TABS+1
        local arBtn=bt(SB,"",UDim2.new(1,-14,0,30),UDim2.new(0,7,0,68+(ari-1)*34),C.bg,C.white,Enum.Font.SciFi,10,4)
        arBtn.BackgroundTransparency=1
        local arInd=fr(arBtn,UDim2.new(0,2,0,16),UDim2.new(0,0,.5,-8),A.c,6);arInd.BackgroundTransparency=1
        local arIco=fr(arBtn,UDim2.new(0,22,0,22),UDim2.new(0,8,.5,-11),C.card,5)
        lb(arIco,"RC",UDim2.new(1,0,1,0),nil,Color3.fromRGB(255,80,50),Enum.Font.SciFi,7,6)
        local arLbl=lb(arBtn,"Recoil",UDim2.new(1,-38,1,0),UDim2.new(0,36,0,0),C.mut,Enum.Font.SciFi,9,5,Enum.TextXAlignment.Left)
        local arPage=newPage()
        TD["arsenal"]={btn=arBtn,lbl=arLbl,ind=arInd,ico=arIco}
        arBtn.MouseEnter:Connect(function() if not arPage.Visible then tw(arBtn,{BackgroundColor3=C.card,BackgroundTransparency=0}) end end)
        arBtn.MouseLeave:Connect(function() if not arPage.Visible then tw(arBtn,{BackgroundTransparency=1}) end end)
        arBtn.MouseButton1Click:Connect(function()
            for _,t in ipairs(TABS) do local d=TD[t.id];pages[t.id].Visible=false
                tw(d.ind,{BackgroundTransparency=1});tw(d.btn,{BackgroundTransparency=1,BackgroundColor3=C.bg})
                tw(d.lbl,{TextColor3=C.mut});tw(d.ico,{BackgroundColor3=C.card}) end
            arPage.Visible=true;tw(arInd,{BackgroundTransparency=0})
            tw(arBtn,{BackgroundColor3=C.card,BackgroundTransparency=0});tw(arLbl,{TextColor3=C.txt})
        end)
        local origSwitch=switchTab
        switchTab=function(id)
            origSwitch(id);arPage.Visible=false
            tw(TD["arsenal"].ind,{BackgroundTransparency=1});tw(TD["arsenal"].btn,{BackgroundTransparency=1,BackgroundColor3=C.bg});tw(TD["arsenal"].lbl,{TextColor3=C.mut})
        end
        local arPg=arPage
        local noRecoilOn=false;local noSpreadOn=false
        sec(arPg,"Weapon Mods",1)
        tog(arPg,"No Recoil","Camera locked, blocks upward kick",false,2,function(on) noRecoilOn=on end)
        tog(arPg,"No Spread","Stabilise exact aim each frame",false,3,function(on) noSpreadOn=on end)
        local savedPitch2=0;local lastNR2=false
        RS:BindToRenderStep("MeowlNoRecoil",Enum.RenderPriority.Camera.Value+1,function()
            if noRecoilOn then
                local cf4=Cam.CFrame;local p4,y4,r4=cf4:ToEulerAnglesYXZ()
                if lastNR2 then local delta=math.abs(p4-savedPitch2)
                    if delta>0.005 and delta<0.3 then
                        Cam.CFrame=CFrame.new(cf4.Position)*CFrame.fromEulerAnglesYXZ(savedPitch2,y4,r4);p4=savedPitch2 end
                end;savedPitch2=p4;lastNR2=true
            else lastNR2=false;savedPitch2=select(1,(Cam.CFrame:ToEulerAnglesYXZ())) end
            if noSpreadOn then local cf4=Cam.CFrame;local p4,y4,r4=cf4:ToEulerAnglesYXZ()
                Cam.CFrame=CFrame.new(cf4.Position)*CFrame.fromEulerAnglesYXZ(p4,y4,r4) end
        end)
    end
    if tostring(game.PlaceId)=="72258920367796" then
        local bIdx=#TABS+2
        local bBtn=bt(SB,"",UDim2.new(1,-14,0,30),UDim2.new(0,7,0,68+(bIdx-1)*34),C.bg,C.white,Enum.Font.SciFi,10,4)
        bBtn.BackgroundTransparency=1
        local bInd=fr(bBtn,UDim2.new(0,2,0,16),UDim2.new(0,0,.5,-8),A.c,6);bInd.BackgroundTransparency=1
        local bIco=fr(bBtn,UDim2.new(0,22,0,22),UDim2.new(0,8,.5,-11),C.card,5)
        lb(bIco,"BE",UDim2.new(1,0,1,0),nil,Color3.fromRGB(255,80,50),Enum.Font.SciFi,7,6)
        local bLbl=lb(bBtn,"Bot ESP",UDim2.new(1,-38,1,0),UDim2.new(0,36,0,0),C.mut,Enum.Font.SciFi,9,5,Enum.TextXAlignment.Left)
        local bPage=newPage()
        TD["botesp"]={btn=bBtn,lbl=bLbl,ind=bInd,ico=bIco}
        bBtn.MouseEnter:Connect(function() if not bPage.Visible then tw(bBtn,{BackgroundColor3=C.card,BackgroundTransparency=0}) end end)
        bBtn.MouseLeave:Connect(function() if not bPage.Visible then tw(bBtn,{BackgroundTransparency=1}) end end)
        bBtn.MouseButton1Click:Connect(function()
            for _,t in ipairs(TABS) do local d=TD[t.id];pages[t.id].Visible=false
                tw(d.ind,{BackgroundTransparency=1});tw(d.btn,{BackgroundTransparency=1,BackgroundColor3=C.bg})
                tw(d.lbl,{TextColor3=C.mut});tw(d.ico,{BackgroundColor3=C.card}) end
            bPage.Visible=true;tw(bInd,{BackgroundTransparency=0})
            tw(bBtn,{BackgroundColor3=C.card,BackgroundTransparency=0});tw(bLbl,{TextColor3=C.txt})
        end)
        local origSwitch2=switchTab
        switchTab=function(id)
            origSwitch2(id);bPage.Visible=false
            tw(TD["botesp"].ind,{BackgroundTransparency=1});tw(TD["botesp"].btn,{BackgroundTransparency=1,BackgroundColor3=C.bg});tw(TD["botesp"].lbl,{TextColor3=C.mut})
        end
        local botEspOn=false;local botEspD={}
        local function applyBotESP(plr,char)
            if plr==LP or not char then return end
            local d={}
            local hl=Instance.new("Highlight");hl.OutlineColor=Color3.fromRGB(255,80,50)
            hl.FillColor=Color3.fromRGB(60,10,10);hl.FillTransparency=0.6
            hl.OutlineTransparency=0;hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
            hl.Adornee=char;hl.Parent=char;d.hl=hl
            local bg2=Instance.new("BillboardGui");bg2.Size=UDim2.new(0,120,0,20)
            bg2.StudsOffset=Vector3.new(0,3.5,0);bg2.AlwaysOnTop=true
            bg2.Adornee=char:FindFirstChild("Head") or char.PrimaryPart;bg2.Parent=char
            local nl2=lb(bg2,plr.Name,UDim2.new(1,0,1,0),nil,Color3.fromRGB(255,80,50),Enum.Font.SciFi,13,2)
            nl2.TextStrokeTransparency=0;nl2.TextStrokeColor3=C.bg;d.ng=bg2
            botEspD[plr]=d
        end
        local function removeBotESP(plr)
            local d=botEspD[plr];if not d then return end
            pcall(function() if d.hl then d.hl:Destroy() end end)
            pcall(function() if d.ng then d.ng:Destroy() end end)
            botEspD[plr]=nil
        end
        sec(bPage,"Bot ESP",1)
        tog(bPage,"Bot ESP","Red highlight on all bots",false,2,function(on)
            botEspOn=on
            if on then
                for _,pl in ipairs(Pl:GetPlayers()) do if pl~=LP and pl.Character then applyBotESP(pl,pl.Character) end end
            else
                for pl,_ in pairs(botEspD) do removeBotESP(pl) end
            end
        end)
        Pl.PlayerAdded:Connect(function(plr)
            if not botEspOn then return end
            if plr.Character then task.wait(.1);applyBotESP(plr,plr.Character) end
            plr.CharacterAdded:Connect(function(ch) task.wait(.1);if botEspOn then applyBotESP(plr,ch) end end)
        end)
        Pl.PlayerRemoving:Connect(function(plr) removeBotESP(plr) end)
    end
    if tostring(game.PlaceId)=="17625359962" then
        local rIdx=#TABS+3
        local rvBtn=bt(SB,"",UDim2.new(1,-14,0,30),UDim2.new(0,7,0,68+(rIdx-1)*34),C.bg,C.white,Enum.Font.SciFi,10,4)
        rvBtn.BackgroundTransparency=1
        local rvInd=fr(rvBtn,UDim2.new(0,2,0,16),UDim2.new(0,0,.5,-8),A.c,6);rvInd.BackgroundTransparency=1
        local rvIco=fr(rvBtn,UDim2.new(0,22,0,22),UDim2.new(0,8,.5,-11),C.card,5)
        lb(rvIco,"RV",UDim2.new(1,0,1,0),nil,Color3.fromRGB(80,180,255),Enum.Font.SciFi,7,6)
        local rvLbl=lb(rvBtn,"Rivals",UDim2.new(1,-38,1,0),UDim2.new(0,36,0,0),C.mut,Enum.Font.SciFi,9,5,Enum.TextXAlignment.Left)
        local rvPage=newPage()
        TD["rivals"]={btn=rvBtn,lbl=rvLbl,ind=rvInd,ico=rvIco}
        rvBtn.MouseEnter:Connect(function() if not rvPage.Visible then tw(rvBtn,{BackgroundColor3=C.card,BackgroundTransparency=0}) end end)
        rvBtn.MouseLeave:Connect(function() if not rvPage.Visible then tw(rvBtn,{BackgroundTransparency=1}) end end)
        rvBtn.MouseButton1Click:Connect(function()
            for _,t in ipairs(TABS) do local d=TD[t.id];pages[t.id].Visible=false
                tw(d.ind,{BackgroundTransparency=1});tw(d.btn,{BackgroundTransparency=1,BackgroundColor3=C.bg})
                tw(d.lbl,{TextColor3=C.mut});tw(d.ico,{BackgroundColor3=C.card}) end
            rvPage.Visible=true;tw(rvInd,{BackgroundTransparency=0})
            tw(rvBtn,{BackgroundColor3=C.card,BackgroundTransparency=0});tw(rvLbl,{TextColor3=C.txt})
        end)
        local origSwitchRV=switchTab
        switchTab=function(id)
            origSwitchRV(id);rvPage.Visible=false
            tw(TD["rivals"].ind,{BackgroundTransparency=1});tw(TD["rivals"].btn,{BackgroundTransparency=1,BackgroundColor3=C.bg});tw(TD["rivals"].lbl,{TextColor3=C.mut})
        end
        local rvNoRecoilOn=false;local rvNoSpreadOn=false
        sec(rvPage,"Rivals Mods",1)
        tog(rvPage,"No Recoil","Zeroes out all camera recoil",false,2,function(on) rvNoRecoilOn=on end)
        tog(rvPage,"No Spread","Stabilise exact aim each frame",false,3,function(on) rvNoSpreadOn=on end)
        local rvSavedPitch=0;local rvLastNR=false
        RS:BindToRenderStep("MeowlRivalsNoRecoil",Enum.RenderPriority.Camera.Value+2,function()
            if rvNoRecoilOn then
                local cf=Cam.CFrame;local p,y,r=cf:ToEulerAnglesYXZ()
                if rvLastNR then
                    local delta=p-rvSavedPitch
                    if delta>0.003 then
                        Cam.CFrame=CFrame.new(cf.Position)*CFrame.fromEulerAnglesYXZ(rvSavedPitch,y,r)
                        p=rvSavedPitch
                    end
                end
                rvSavedPitch=p;rvLastNR=true
            else
                rvLastNR=false
                rvSavedPitch=select(1,(Cam.CFrame:ToEulerAnglesYXZ()))
            end
            if rvNoSpreadOn then
                local cf=Cam.CFrame;local p,y,r=cf:ToEulerAnglesYXZ()
                Cam.CFrame=CFrame.new(cf.Position)*CFrame.fromEulerAnglesYXZ(p,y,r)
            end
        end)
    end
    print("[MeowlSense v14] Loaded - "..MODE.." | "..TIER.." | "..gameName.."")
    local KB_G=gui("MS_Keybinds")
    local KB_Win=fr(KB_G,UDim2.new(0,220,0,310),UDim2.new(1,-230,.5,-155),Color3.fromRGB(20,20,20),2)
    KB_Win.Active=true;KB_Win.Draggable=true;KB_Win.Visible=false;KB_Win.BorderSizePixel=0
    fr(KB_Win,UDim2.new(1,0,0,3),nil,Color3.fromRGB(100,100,100),3).BorderSizePixel=0
    fr(KB_Win,UDim2.new(1,0,0,3),UDim2.new(0,0,1,-3),Color3.fromRGB(20,20,20),3).BorderSizePixel=0
    fr(KB_Win,UDim2.new(0,3,1,0),nil,Color3.fromRGB(100,100,100),3).BorderSizePixel=0
    fr(KB_Win,UDim2.new(0,3,1,0),UDim2.new(1,-3,0,0),Color3.fromRGB(20,20,20),3).BorderSizePixel=0
    local kbHdrF=fr(KB_Win,UDim2.new(1,0,0,28),nil,Color3.fromRGB(15,15,15),4);kbHdrF.BorderSizePixel=0
    fr(KB_Win,UDim2.new(1,0,0,2),UDim2.new(0,0,0,28),Color3.fromRGB(0,0,0),4).BorderSizePixel=0
    fr(KB_Win,UDim2.new(1,0,0,1),UDim2.new(0,0,0,30),Color3.fromRGB(80,80,80),4).BorderSizePixel=0
    mcLbl(kbHdrF,"KEYBINDS",UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),Color3.fromRGB(255,215,0),11,5)
    local kbScroll=Instance.new("ScrollingFrame");kbScroll.Size=UDim2.new(1,0,1,-36);kbScroll.Position=UDim2.new(0,0,0,32)
    kbScroll.BackgroundTransparency=1;kbScroll.BorderSizePixel=0;kbScroll.ScrollBarThickness=3
    kbScroll.ScrollBarImageColor3=Color3.fromRGB(139,139,139);kbScroll.CanvasSize=UDim2.new(0,0,0,0);kbScroll.Parent=KB_Win
    local kbLL=Instance.new("UIListLayout");kbLL.Padding=UDim.new(0,3);kbLL.Parent=kbScroll
    local kbPad2=Instance.new("UIPadding");kbPad2.PaddingLeft=UDim.new(0,6);kbPad2.PaddingRight=UDim.new(0,6);kbPad2.PaddingTop=UDim.new(0,4);kbPad2.Parent=kbScroll
    kbLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() kbScroll.CanvasSize=UDim2.new(0,0,0,kbLL.AbsoluteContentSize.Y+8) end)
    local KB={
        fly={name="Fly",kc=Enum.KeyCode.F,kcName="F"},
        hideGui={name="Hide GUI",kc=Enum.KeyCode.RightShift,kcName="RShift"},
        infJump={name="Inf Jump",kc=Enum.KeyCode.Space,kcName="Space"},
        bhop={name="Bhop",kc=Enum.KeyCode.Space,kcName="Space"},
        noclip={name="Noclip",kc=Enum.KeyCode.N,kcName="N"},
        velocity={name="Velocity",kc=Enum.KeyCode.V,kcName="V"},
        aimbot={name="Aimbot",kc=nil,kcName="RMB"},
        spinbot={name="Spinbot",kc=nil,kcName="Auto"},
        triggerbot={name="Triggerbot",kc=nil,kcName="Auto"},
    }
    local kbListeningFor=nil
    local kbOrder={"fly","hideGui","infJump","bhop","noclip","velocity","aimbot","spinbot","triggerbot"}
    for _,id in ipairs(kbOrder) do
        local kb2=KB[id]
        local row=fr(kbScroll,UDim2.new(1,0,0,26),nil,Color3.fromRGB(40,40,40),3);row.BorderSizePixel=2
        fr(row,UDim2.new(1,0,0,2),nil,Color3.fromRGB(80,80,80),4).BorderSizePixel=0
        fr(row,UDim2.new(1,0,0,2),UDim2.new(0,0,1,-2),Color3.fromRGB(15,15,15),4).BorderSizePixel=0
        mcLbl(row,kb2.name,UDim2.new(.5,0,1,0),UDim2.new(0,4,0,0),Color3.fromRGB(200,200,200),9,5,Enum.TextXAlignment.Left)
        local canBind=(kb2.kc~=nil)
        local chipOuter=fr(row,UDim2.new(.46,0,0,18),UDim2.new(.52,0,.5,-9),Color3.fromRGB(25,25,25),5);chipOuter.BorderSizePixel=0
        local chipFace=fr(chipOuter,UDim2.new(1,-4,1,-4),UDim2.new(0,2,0,2),canBind and Color3.fromRGB(130,130,130) or Color3.fromRGB(80,80,80),6);chipFace.BorderSizePixel=0
        local chipLbl=lb(chipFace,kb2.kcName,UDim2.new(1,0,1,0),nil,canBind and Color3.fromRGB(255,255,255) or Color3.fromRGB(160,160,160),Enum.Font.SciFi,8,7)
        if canBind then
            local chipBtn=bt(row,"",UDim2.new(.46,0,0,18),UDim2.new(.52,0,.5,-9),Color3.fromRGB(0,0,0),Color3.fromRGB(255,255,255),Enum.Font.SciFi,1,8)
            chipBtn.BackgroundTransparency=1
            chipBtn.MouseButton1Click:Connect(function()
                if kbListeningFor then return end;kbListeningFor=id
                chipLbl.Text="...";chipFace.BackgroundColor3=Color3.fromRGB(160,160,255)
                local cn;cn=UIS.InputBegan:Connect(function(inp,gp2)
                    if gp2 or inp.UserInputType~=Enum.UserInputType.Keyboard then return end
                    KB[id].kc=inp.KeyCode
                    KB[id].kcName=tostring(inp.KeyCode):gsub("Enum.KeyCode.","")
                    chipLbl.Text=KB[id].kcName;chipFace.BackgroundColor3=Color3.fromRGB(130,130,130)
                    if id=="hideGui" then hideKey.kc=inp.KeyCode end
                    kbListeningFor=nil;cn:Disconnect()
                end)
            end)
        end
    end
    local _kpb,_kpf,_kpo=mcBtn(Hdr,"Keys",UDim2.new(0,42,0,24),UDim2.new(1,-156,.5,-12),7)
    _kpb.MouseButton1Click:Connect(function() KB_Win.Visible=not KB_Win.Visible end)
    UIS.InputBegan:Connect(function(i,gp)
        pcall(function()
            if gp or kbListeningFor then return end
            if KB.fly.kc and i.KeyCode==KB.fly.kc and S.flyOn then
                flying=not flying;flyActive=flying
                local c3=LP.Character;if not c3 then flying=false;flyActive=false;return end
                local hm3=c3:FindFirstChildOfClass("Humanoid")
                if flying then pcall(function() if hm3 then hm3.PlatformStand=true end end)
                else flyActive=false;pcall(function() if hm3 then hm3.PlatformStand=false end end) end
            end
            if KB.hideGui.kc and i.KeyCode==KB.hideGui.kc then Win.Visible=not Win.Visible end
            if KB.noclip.kc and i.KeyCode==KB.noclip.kc then S.noclipOn=not S.noclipOn end
            if KB.velocity.kc and i.KeyCode==KB.velocity.kc then S.uVelOn=not S.uVelOn end
        end)
    end)
