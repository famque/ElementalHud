include("autorun/sh_elementalhud.lua")

hook.Add("HUDPaint", "ElementalHUD", function()

	LocalPlayer().DarkRPVars = LocalPlayer().DarkRPVars or {}

	local scrw,scrh = ScrW(), ScrH()
	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local money = ply.DarkRPVars.money
	if not money then money = "" end
	local salary = ply.DarkRPVars.salary
	if not salary then salary = "" end
	local job = ply.DarkRPVars.job
	if not job then job = "" end
	local hunger = ply.DarkRPVars.Energy
	if not hunger then hunger = "" end
	local props = ply:GetCount("props")
	local time = os.date( "%H:%M:%S")

if !ply:Alive() then
    return
end

--topbar??
--surface.SetDrawColor(10,10,10,50)
--surface.DrawRect(scrw /2000, scrh / 2000, scrw * 4, scrh * .03) -- blackbox

-- famq.gg box
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw / 1.03, scrh / 300, scrw * .0285, scrh * .025) -- blackbox
surface.SetDrawColor(70,70,70,255)
surface.DrawRect(scrw / 1.029, scrh / 245, scrw * .027, scrh * .023) -- greybox
draw.SimpleText("famq.gg", "boxfont", scrw / 1.025, scrh / 245, color_white, 0 ) -- text

-- timebox
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw / 1.071, scrh / 300, scrw * .0355, scrh * .025) -- blackbox
surface.SetDrawColor(127,159,255,255)
surface.DrawRect(scrw / 1.07, scrh / 245, scrw * .0338, scrh * .023) -- timebox
draw.SimpleText( "Time:", "boxfont", scrw / 1.068, scrh / 245, color_white, 0 ) -- text
draw.DrawText( time, "boxfont", scrw / 1.057, scrh / 75, color_white, 0  ) -- time


-- propbox
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw / 1.115, scrh / 300, scrw * .0355, scrh * .025) -- blackbox
surface.SetDrawColor(63,79,127,255)
surface.DrawRect(scrw / 1.1141, scrh / 245, scrw * .0338, scrh * .023) -- propbox
draw.DrawText( "Props: " .. props, "boxfont", scrw / 1.113, scrh / 250, color_white, 0  )
--draw.SimpleText("/ 50", "boxfont", scrw / 1.087, scrh / 70, color_white, 0 ) -- text - show limit

--job box
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw /500, scrh / 300, scrw * .04, scrh * .025) -- blackbox
surface.SetDrawColor(team.GetColor( LocalPlayer():Team() ):Unpack())
surface.DrawRect(scrw /350, scrh / 245, scrw * .0385, scrh * .023) -- playerjobbox
draw.SimpleText(job, "boxfont", scrw / 250, scrh / 245, color_white, 0 ) -- text

--health box
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw /23, scrh / 300, scrw * .04, scrh * .025) -- blackbox
surface.SetDrawColor(100,0,0,50)
surface.DrawRect(scrw /22.5, scrh / 245, scrw * .0385, scrh * .023) -- healthshadowbox
surface.SetDrawColor(200,0,0,100)
surface.DrawRect(scrw /22.5, scrh / 245, scrw * .0385 * (hp / maxhp), scrh * .023) --playerhealthbox
draw.SimpleText( "HP: " .. hp, "boxfont", scrw / 22, scrh / 245, color_white, 0 ) -- text

--armor box
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw /11.75, scrh / 300, scrw * .04, scrh * .025) --blackbox
surface.SetDrawColor(0,0,100,50)
surface.DrawRect(scrw /11.65, scrh / 245, scrw * .0385, scrh * .023) --armorshadowbox
surface.SetDrawColor(0,0,200,200)
surface.DrawRect(scrw /11.65, scrh / 245, scrw * .0385 * (armor / maxarmor), scrh * .023) --armorshadowbox
draw.SimpleText( "AP: " .. armor, "boxfont", scrw / 11.5, scrh / 245, color_white, 0 ) -- text

--hunger box
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw /7.92, scrh / 300, scrw * .04, scrh * .025) --blackbox
surface.SetDrawColor(127,111,63,200)
surface.DrawRect(scrw /7.86, scrh / 245, scrw * .0385, scrh * .023) --hungerbox
draw.SimpleText( "Hunger: " .. hunger, "boxfont", scrw / 7.78, scrh / 245, color_white, 0 )

--cash box
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw /5.94, scrh / 300, scrw * .04, scrh * .025) --blackbox
surface.SetDrawColor(95,127,63,200)
surface.DrawRect(scrw /5.92, scrh / 245, scrw * .0385, scrh * .023) --cashbox
draw.SimpleText( "$" .. string.Comma(money, ","), "boxfont", scrw / 5.85, scrh / 245, color_white, 0 )
draw.SimpleText( "+" .. salary, "boxfont", scrw / 5.1, scrh / 75, color_white, 0 )

--ammobox
if (ply:GetActiveWeapon():IsValid()) then --checks if valid wep
	if (ply:GetActiveWeapon():GetPrimaryAmmoType()) >= 0 then --no display ammobox on non weapons
		if(IsValid(ply) and IsValid(ply:GetActiveWeapon())) then
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw / 1.054, scrh / 1.039, scrw * .05, scrh * .035) --blackbox
surface.SetDrawColor(0,0,0,255)
surface.DrawRect(scrw / 1.053, scrh / 1.038, scrw * .048, scrh * .032) --insidebox
	if (ply:GetActiveWeapon():GetPrintName() != nil) then
draw.SimpleText(ply:GetActiveWeapon():GetPrintName(), "boxfont", scrw / 1.051, scrh / 1.037, color_white, 0)
    if (ply:GetActiveWeapon():Clip1() != -1) then
draw.SimpleText("Ammo: " .. ply:GetActiveWeapon():Clip1() .. "/" .. ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "boxfont", scrw / 1.051, scrh / 1.023, color_white, 0)
	else
draw.SimpleText ("Ammo: " .. ply:GetAmmoCount (ply:GetActiveWeapon():GetPrimaryAmmoType()), "boxfont", scrw / 1.051, scrh / 1.023, color_white, 0) 
				end
			end
		end
	end
end

--surface.SetTexture(surface.GetTextureID("icon16/monkey.png")) -- figure out why icons 
--surface.DrawTexturedRect(25 + 10,ScrH() - 160,16,16)            -- not loading correctly

---------------------------------------------------------------

-- SCOREBOARD --

---------------------------------------------------------------

---------------------------------------------------------------

--- WEAPON SELECTOR --

---------------------------------------------------------------

-- death notice disable
if CLIENT then
	RunConsoleCommand('hud_deathnotice_time', '0')
end

---------------------------------------------------------------
-- disable default ammo
end)
function HideAmmo(name)
    for k, v in pairs({"CHudAmmo", "CHudSecondaryAmmo"}) do
        if name == v then
            return false
        end
    end
end
hook.Add("HUDShouldDraw", "HideDefaultHud", HideAmmo)
---------------------------------------------------------------

-- fonts
surface.CreateFont( "boxfont", {
	font = "Roboto", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 15,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = true,
	outline = true,
} )

surface.CreateFont( "sbfont", {
	font = "Roboto", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 45,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = true,
	outline = true,
} )

surface.CreateFont( "sbcfont", {
	font = "Roboto", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = true,
	outline = true,
} )