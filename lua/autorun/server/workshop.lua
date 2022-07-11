-- ---------------
-- SCRIPT SETTINGS
-- ---------------
showConsoleOutput = true
autoMode = true
collectionBans = {}

-- ------------
-- SCRIPT START
-- ------------
collectionData = {}

hook.Add("Initialize", "WSAddons::DynamicRegister",
	function()
		if (autoMode) then
			-- Automatic Mode
			for k, v in pairs( engine.GetAddons() ) do
				wsid = ""
				if (type(v.wsid) == "string") then
					wsid = v.wsid
				else
					wsid = string.gsub(tostring(v.file), "%D", "")
				end
				
				table.insert(collectionData, wsid)
			end
		else
			-- Manual Declaration Mode
			-- Determine current gamemode
			if( engine.ActiveGamemode() == "terrortown" ) then
				-- TTT Collection
				collectionData = {}
			elseif ( engine.ActiveGamemode() == "prophunters" ) then
				-- Prop Hunters Collection
				collectionData = {}
			elseif ( engine.ActiveGamemode() == "deathrun" ) then
				-- Deathrun Collection
				collectionData = {}
			elseif ( engine.ActiveGamemode() == "murder" ) then
				-- Murder Collection
				collectionData = {}
			end
		end
		
		
		WSAddonsRegister()
		SetHostname()
	end
)

function WSAddonsRegister()
	print("Registering a total of " .. #collectionData .. " workshop items.")
	print("Registering Workshop IDs...")
	for i=1, #collectionData do
		resource.AddWorkshop(collectionData[i])
	end
	print(table.concat(collectionData, ", "))
end

function SetHostname()
	-- Determine current gamemode
	if( engine.ActiveGamemode() == "terrortown" ) then
		RunConsoleCommand('hostname', 'The Den | FastDL | TTT2')
	elseif ( engine.ActiveGamemode() == "prophunters" ) then
		RunConsoleCommand('hostname', 'The Den | FastDL | PH')
	elseif ( engine.ActiveGamemode() == "deathrun" ) then
		RunConsoleCommand('hostname', 'The Den | FastDL | DR')
	elseif ( engine.ActiveGamemode() == "murder" ) then
		RunConsoleCommand('hostname', 'The Den | FastDL | MU')
	end
end
