
		local language = {
	
		charMenu = 'Criar Personagem',
		back = 'Voltar',
		
		gender = "Género",
			male = "Masculino",
			female = "Feminino",
			
		heritage = "Genética",
			mother = "Mãe",
			father = "Pai",
			motherFace = "Cara da mãe",
			fatherFace = "Cara do pai",
			motherSkin = "Cor de pele da mãe",
			fatherSkin = "Cor de pele do pai",
		face = "Cara",
		faceStuff = {
			"Largura do nariz",
			"Posição do nariz",
			"Ponta do nariz",
			"Osso do nariz",
			"Posição da ponta do nariz",
			"Posição do osso do nariz",
			"Sobrancelha",
			"Profundidade da testa",
			"bochechas",
			"Osso das bochechas",
			"Pele das bochechas",
			"Olhos",
			"Labios",
			"Largura do maxilar",
			"Altura do maxilar",
			"Tamanho do queixo",
			"Segundo queixo",
			"Gordura do queixo",
			"Tipo de queixo",
			"Pescoço"
			
			},
			
			--[[
				noseWidth="Largura do nariz",
				noseHeight="Posição do nariz",
				noseTip="Ponta do nariz",
				noseBone="Osso do nariz",
				noseTipPos="Posição da ponta do nariz",
				noseBonePos="Posição do osso do nariz",
				eyeBrow="Sobrancelha",
				eyeBrowDepth="Profundidade da testa",
				cheeks="bochechas",
				cheekBone="Osso das bochechas",
				cheekSkin="Pele das bochechas",
				eyes="Olhos",
				lips="Labios",
				jawLine="Largura do maxilar",
				jawHeight="Altura do maxilar",
				chinSize="Tamanho do queixo",
				chinSencond="Segundo queixo",
				chinFat="Gordura do quixo",
				chinType="Tipo de quixo",
				neck="Pescosso",
			
			]]
			
		appearance = "Aparência",
			hair = "Cabelo",
			hairColor = "Cor do cabelo",
			hairColor2 = "Realce do cabelo",
			eyeColor = "Cor dos olhos",
			opacity = "Opacidade",
			color = "Cor",
		
		
		appearanceStuff = {
			"Manchas na cara",
			"Barba",
			"Sobrancelhas",
			"Rugas",
			"Maquilhagem dos olhos",
			"Blush",
			"Tipo de pele",
			"Dano de pele",
			"Baton",
			"Sinais e sardas",
			"Pelo no peito",
			"Manchas no corpo"
		},
		
		
		--[[
			faceBlamishes = "Manchas na cara",
			beard = "Barba",
			eyebrows = "sobrancelhas",
			wrinkles = "Rugas",
			eyeMakeup = "Maquilhagem dos olhos",
			blush = "Maquilhagem das bochechas",
			skinType = "Tipo de pele",			
			skinDamage = "Dano de pele",
			lipstick= "Baton",
			freckles = "Sinais e sardas",
			chestHair = "Pelo no peito",
			skinBlamishes = "Manchas na pele",
			
			
			]]
			
			
			
		skills="Habilidades",
			endurance ="resistência",
			aim = "Pontaria",
			strenght = "Força",
			sneak = "Sigilo",
			pilot = "Piloto",
			driver = "Condutor",
			lung_capacity = "Capacidade pulmonar",
			finish = "Finalizar"
	}
	
	local temp = "ayy"
	--iniciação da combobox do genero
	local gender = {
		name = language.gender,
		items = {language.male,language.female},
		index = 1
	}
	
	local mother = {
		name = language.mother,
		items = {'Misty','Natalie','Ashley','Ava','Camila','Olivia','Audrey','Sophia','Giselle','Charlotte','Evelyn','Amelia','Violet','Brianna','Nicole','Hannah','Elizabeth','Grace','Zoe','Jasmine','Emma','Isabella'},
		index = 1
	}
	
	local father = {
		name = language.father,
		items = {'Andrew','Gabriel','Kevin','Claude','Vincent','Alex','Anthony','Angel','Joshua','Evan','Benjamin','Samuel','Ethan','Juan','Adrian','Michael','Diego','John','Isaac','Daniel','Santiago','Noah','Niko','Louis'},
		index = 1
	}
	

	local headMix = {
		name1 = language.motherFace,
		name2 = language.fatherFace,
		tick = 50.0
	}
	
	
	local skinMix = {
		name1 =language.motherSkin,
		name2 =language.fatherSkin,
		tick = 50.0
	
	}


	

	local featuresList={}
	
	for i=1,20 do

	
		featuresList[i]={name=language.faceStuff[i+1],index=50.0 }
	end
	
	local eyeColors = {}
	
	for i=1, 32 do
	
		eyeColors[i]=tostring(i)
	
	end
	
	featuresList[0]={name=language.eyeColor,items = eyeColors,index= 1}
	
	
	local hairOptions = {}
	
	local hairList = {}
	
	for i=1,39 do
	
		hairList[i] =tostring(i)

	
	end
	
	
	local hairColors = {}
	
	for i=1,GetNumHairColors() do
	
		hairColors[i]=tostring(i)
	
	end
	
	hairOptions={
		name=language.hair,
		items=hairList,
		index=1,
		nameColor=language.hairColor,
		nameColor2=language.hairColor2,
		itemsColor=hairColors,
		indexColor=1,
		indexColor2=1
		
	}
	
	
	local overLays = {}
	

	
	overLays[1]={indexMax=25}
	overLays[2]={indexMax=30}
	overLays[3]={indexMax=35}
	overLays[4]={indexMax=16}
	overLays[5]={indexMax=73}
	overLays[6]={indexMax=8}
	overLays[7]={indexMax=13}
	overLays[8]={indexMax=12}
	overLays[9]={indexMax=11}
	overLays[10]={indexMax=19}
	overLays[11]={indexMax=18}
	overLays[12]={indexMax=13}
	
	
	
	
	local colorNum={}

	for i=1,64 do
	
		colorNum[i]=tostring(i)
	
	
	end
	
	local colorNum2={}

	for i=1,255 do
	
		colorNum2[i]=tostring(i)
	
	
	end
	
	for i=1,12 do
	
		local item = {}
	
		for k=1, overLays[i].indexMax do
		
			item[k]=tostring(k)
			
		
		end
		
		overLays[i]={name=language.appearanceStuff[i],
		items=item,
		index=1,
		opacity=100.0,
		color1=1,
		itemsColor=colorNum,
		overlayType=0
		
		}
		
	
	end
	
	

	overLays[2].overlayType=1
	overLays[3].overlayType=1
	overLays[6].overlayType=2
	overLays[9].overlayType=2
	overLays[11].overlayType=1

	
	
	
	
	GetMenuChange = 1
	
	
	

	local IsBlendFace = false
	
	local cam = nil
	
	--criar menu
    WarMenu.CreateMenu('mainMenu', language.charMenu)
	WarMenu.SetSubTitle('mainMenu', '')
	WarMenu.SetTitleColor('mainMenu', 0, 204, 204, 255)
	WarMenu.SetTitleBackgroundColor('mainMenu', 0, 0, 0, 255)
	WarMenu.SetMenuBackgroundColor('mainMenu', 0, 0, 0, 255)

	WarMenu.CreateSubMenu('menuHeritage','mainMenu',language.heritage)
	WarMenu.CreateSubMenu('menuFeatures','mainMenu',language.face)
	WarMenu.CreateSubMenu('menuAppearance','mainMenu',language.appearance)
	WarMenu.CreateSubMenu('menuChange','menuAppearance','')
	
	local canClose = true

	

	--muda o modelo 
	function changempmodel(model)
		local modelhashed = GetHashKey(model)
		RequestModel(modelhashed)
		while not HasModelLoaded(modelhashed) do 
			RequestModel(modelhashed)
			Citizen.Wait(0)
		end
		SetPlayerModel(PlayerId(), modelhashed)
		SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 1)
		if model == 'mp_f_freemode_01' then
			SetPedComponentVariation(GetPlayerPed(-1), 0, 34, 0, 1)
			SetPedComponentVariation(GetPlayerPed(-1), 6, 1, 1, 1)
		end
		SetModelAsNoLongerNeeded(modelhashed)
	end
	
	function setCamera(flag)
	
		if flag then
	
			if cam==nil then
			
				cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
			end

			SetCamActive(cam,  true)
			
			
			
			RenderScriptCams(true,  false,  0,  true,  true)
			
			local pos = GetEntityCoords(GetPlayerPed(-1))
			
			SetCamCoord(cam,  pos.x+0.3,  pos.y+0.3,  pos.z+0.7)
			
			PointCamAtCoord(cam,pos.x,pos.y,pos.z+0.7)
			
			
	
			TaskTurnPedToFaceCoord(GetPlayerPed(-1),pos.x+0.3,  pos.y+0.3,  pos.z+0.75,-1)
			

			
		elseif flag==false then
		
			SetCamActive(cam,  false)
			RenderScriptCams(false,  false,  0,  true,  true)
			
			ClearPedTasks(GetPlayerPed(-1))
			
		
		end
		
	
	end
	
	function blendface(shapeFirstID, shapeSecondID, shapeMix, skinMix)
		SetPedHeadBlendData(GetPlayerPed(-1),shapeFirstID,shapeSecondID,0,shapeFirstID,shapeSecondID,0,shapeMix,skinMix,0.0,false)	
		
	end
	 
	local polarAngleDeg   = 0;
	local azimuthAngleDeg = 90;
	local radius          = -3.5;
	 
	
	function polar3DToWorld3D(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
    
		-- convert degrees to radians
		
		local polarAngleRad   = polarAngleDeg   * math.pi / 180.0
		local azimuthAngleRad = azimuthAngleDeg * math.pi / 180.0

		local pos = {
		  x = entityPosition.x + radius * (math.sin(azimuthAngleRad) * math.cos(polarAngleRad)),
		  y = entityPosition.y - radius * (math.sin(azimuthAngleRad) * math.sin(polarAngleRad)),
		  z = entityPosition.z - radius * math.cos(azimuthAngleRad)
		}

		return pos
	end
	
	

	function rotateCamera()
	
	
		
	
		local coords = GetPedBoneCoords(GetPlayerPed(-1),0x796e,0,0,0)
		
		
		


		if IsControlPressed(2, 241) then
		radius = radius + 0.25;
		end

		if IsControlPressed(2, 242) then
		radius = radius - 0.25;
		end

		if radius > -0.35 then
			radius = -0.35
		end
		
		

		HideHudComponentThisFrame(19)
		HideHudComponentThisFrame(20)
		local xMagnitude = GetDisabledControlNormal(0,  1)
		local yMagnitude = GetDisabledControlNormal(0,  2)

		polarAngleDeg = polarAngleDeg + xMagnitude * 10

		if polarAngleDeg >= 360 then
		polarAngleDeg = 0
		end

		azimuthAngleDeg = azimuthAngleDeg + yMagnitude * 10

		if azimuthAngleDeg >= 360 then
		azimuthAngleDeg = 0;
		end

		
		
		local nextCamLocation = polar3DToWorld3D(coords, radius, polarAngleDeg, azimuthAngleDeg)

		
		
		SetCamCoord(cam,  nextCamLocation.x,  nextCamLocation.y,  nextCamLocation.z)
	
	
	end
	

	
	
	function updateCharacter()
	
	
		if gender.index==1 then
		
		
		
			if GetEntityModel(GetPlayerPed(-1))~=GetHashKey('mp_m_freemode_01') then
				changempmodel('mp_m_freemode_01')
			end
			SetPedComponentVariation(GetPlayerPed(-1), 2, 36+hairOptions.index-1, 0, 1)
			SetPedComponentVariation(GetPlayerPed(-1),3,15,0,0)
			SetPedComponentVariation(GetPlayerPed(-1),4,21,0,0)
			SetPedComponentVariation(GetPlayerPed(-1),6,34,0,0)
			SetPedComponentVariation(GetPlayerPed(-1),8,15,0,0)
			SetPedComponentVariation(GetPlayerPed(-1),11,15,0,0)
			
			
		
		elseif gender.index==2 then
		
			
			
			if GetEntityModel(GetPlayerPed(-1))~=GetHashKey('mp_f_freemode_01') then
				changempmodel('mp_f_freemode_01')
				SetEntityHealth(GetPlayerPed(-1),200)
			end
			SetPedComponentVariation(GetPlayerPed(-1), 2, 38+hairOptions.index-1, 0, 1)
			SetPedComponentVariation(GetPlayerPed(-1),3,15,0,0) -- change acordingly with 11
			SetPedComponentVariation(GetPlayerPed(-1),4,15,0,0)
			SetPedComponentVariation(GetPlayerPed(-1),6,35,0,0)
			SetPedComponentVariation(GetPlayerPed(-1),8,2,0,0)
			SetPedComponentVariation(GetPlayerPed(-1),11,15,0,0) --every clothes is here
			
			
		end
		
	
		
		local tick = 0.0
		if headMix.tick~=0 then
		
			
			tick = (headMix.tick)/100
			
			
		
		end
		local tickSkin = 0.0
		if skinMix.tick~=0 then
		
			tickSkin = (skinMix.tick)/100
		
		end
		
			temp = tickSkin
		
		local face1 = 0
		local face2 = 0
		
		
		
		if mother.index==23 then
			face1=45
		else
			face1=mother.index+19
		end
		
		
		
		
		
		if (father.index>21) then
			
			face2=20+father.index
		else
			
			face2=father.index-1
		end
		
		face2=father.index
		
	
	
		blendface(face1,face2,tick,tickSkin)
			

		
		
		
	
		
		SetPedEyeColor(GetPlayerPed(-1),featuresList[0].index-1)
		
		
		
		for i=1,19 do
		
			local scale = featuresList[i].index - 50
									
			scale = scale/50
			
			
			
			
				--sao 20
			SetPedFaceFeature(GetPlayerPed(-1),i,scale)
		
		end
		
		
		SetPedHairColor(GetPlayerPed(-1),hairOptions.indexColor,hairOptions.indexColor2)
		
		
		
		for i=1,12 do
		
			if  (not (((i==2)or(i==11)) and (gender.index==2))) then
			
				scale = overLays[i].opacity
							
				scale = scale/100
				
				SetPedHeadOverlay(GetPlayerPed(-1),i-1,overLays[i].index-2,scale)
				
				
				
				if (overLays[i].overlayType~=0) then
					
					SetPedHeadOverlayColor(GetPlayerPed(-1),i-1,overLays[i].overlayType,overLays[i].color1-1,overLays[i].color1-1)
					
				
					
				end
				
				
			
			end
			
			
		
		end
		

	end
	
	
	


	
	function saveCharData()
	
	
	
		
	
		local superString = ""
		
		local charData = {}
		
		local listfeatures = {}
		local listOpacity = {}
		local listColor = {}
		
		
		
		for i = 0,19 do
		
			listfeatures[i]=featuresList[i].index
		
		end
		
		for i=1 ,12 do
		
			listOpacity[i]=overLays[i].opacity
			listColor[i]=overLays[i].color1
		
		end
		
		
		
		charData = {
				gender.index,  --1
				mother.index,--2
				father.index,--3
				headMix.tick,--4
				skinMix.tick,--5
				listfeatures, --6 26
				hairOptions.index, --27
				hairOptions.indexColor, --28
				hairOptions.indexColor2, --29
				listOpacity,--30 42
				listColor --55
				
			}

		
		
		for i = 1, 11 do
		
			if (i==6) or (i==10) or (i==11) then
				
				for k=1,#charData[i] do
					
					
					superString = superString..tostring(charData[i][k])..","
					
					
				
				end
			
			else
				superString = superString..tostring(charData[i])..","
			end
		
		
		end
		
		
			
	
			TriggerServerEvent('saveCharacter',superString)

		
		
	
	end
	
	
	function stringsplit(inputstr, sep)
		if sep == nil then
			sep = "%s"
		end
		local t={} ; i=1
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			t[i] = str
			i = i + 1
		end
		return t
	end
	
	
	
	
	RegisterNetEvent('loadCharacter')
	
	AddEventHandler('loadCharacter', function(superString)
	
		
	
		
		local charData=stringsplit(superString,",")

		
		
		
		
		gender.index=tonumber(charData[1])
		
		
		
		
		mother.index=tonumber(charData[2])
		father.index=tonumber(charData[3])
		
		headMix.tick=tonumber(charData[4])
		skinMix.tick=tonumber(charData[5])
		
		
		
		for i=6, 26 do
		
			featuresList[i-6].index=tonumber(charData[i])
		
		
		end
		
		
		
		hairOptions.index=tonumber(charData[27])
		hairOptions.indexColor=tonumber(charData[28])
		hairOptions.indexColor2=tonumber(charData[29])
		
		for i=1,12 do
			overLays[i].opacity=tonumber(charData[29+i])
			overLays[i].color1=tonumber(charData[41+i])
		
		end
		
	
		
		IsBlendFace=true
		
		
		
		
		
		
		
		


	end)
	

	
	
	function WriteCoords(txt, x, y)
		SetTextFont(0)
		SetTextProportional(0)
		SetTextScale(0.4, 0.4)
		SetTextColour(255, 255, 255, 255)
		SetTextEntry("STRING")
		AddTextComponentString(txt)
		DrawText(x, y)
	end

	
	
	local firstSpawn = true
	
	RegisterNetEvent('createCharacter')
	AddEventHandler('createCharacter',function ()
	
		
		updateCharacter()
		canClose = false
		--setCamera(true)
	
	end)
	
	
	
	AddEventHandler('playerSpawned',function(spawn)
	
	
	
		if firstSpawn then
			TriggerServerEvent('selectCharacter')
			firstSpawn = false
			
		else
			updateCharacter()
		end
	
		
	
	end)
	
	local camera = nil
	
	function testCam()
	
		
			if camera==nil then
				CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
			end
		
			SetCamActive(camera,  true)
			
			
			
			RenderScriptCams(true,  false,  0,  true,  true)
			
			local pos = GetEntityCoords(GetPlayerPed(-1))
			
			SetCamCoord(camera,  pos.x+0.3,  pos.y+0.3,  pos.z+0.7)
		
	
	
	end
	

	
	
Citizen.CreateThread(function()

    while true do
	
		
        
        if WarMenu.IsMenuOpened('mainMenu') then
            
			--combobox do genero
			
            if WarMenu.ComboBox(gender.name, gender.items, gender.index, gender.index, function(currentIndex, selectedIndex)
				
				
				if gender.index~=currentIndex then
				
					
				
					IsBlendFace=true
					
				end
				
				gender.index = currentIndex
				
				
				
            end) then
			
			
			
			elseif WarMenu.MenuButton(language.heritage,'menuHeritage') then	
			
			elseif WarMenu.MenuButton(language.face,'menuFeatures') then
			
			elseif WarMenu.MenuButton(language.appearance,'menuAppearance') then
			
			
				
			
            elseif WarMenu.Button(language.finish) then
				canClose=true
				--setCamera(false)
				
				saveCharData()
				WarMenu.CloseMenu()
				
				
            end

            WarMenu.Display()
			
			

		elseif WarMenu.IsMenuOpened('menuHeritage') then
		
			if WarMenu.ComboBox(mother.name, mother.items, mother.index, mother.index, function(currentIndex, selectedIndex)
				
			
				
				if mother.index~=currentIndex then
					IsBlendFace = true
					
					
				end
				
				mother.index = currentIndex
				
				
				
				
            end) then
			
			elseif WarMenu.ComboBox(father.name, father.items, father.index, father.index, function(currentIndex, selectedIndex)
				
			
				
				if father.index~=currentIndex then
					IsBlendFace = true
					
					
					
				end
				
				father.index = currentIndex
				
				
				
				
            end) then
			
			
			
			elseif WarMenu.TickBar(headMix.name1,headMix.name2,headMix.tick,0,function(currentIndex)
			
			
				if headMix.tick ~= currentIndex then
				
					IsBlendFace=true
				end
			
			
				headMix.tick = currentIndex
			
				
			
			end)then
			
			elseif WarMenu.TickBar(skinMix.name1,skinMix.name2,skinMix.tick,0,function(currentIndex)
			
			
				if skinMix.tick ~= currentIndex then
				
					IsBlendFace=true
				end
						
				skinMix.tick = currentIndex

			end)then
			
			elseif WarMenu.MenuButton(language.back,'mainMenu') then
			
			end
			
			WarMenu.Display()
		
		elseif WarMenu.IsMenuOpened('menuFeatures') then
		
		
			if WarMenu.ComboBox(featuresList[0].name, featuresList[0].items, featuresList[0].index, featuresList[0].index, function(currentIndex, selectedIndex)
				
			
				
				if featuresList[0].index~=currentIndex then
					
					IsBlendFace=true
				
				end
				
				
				featuresList[0].index = currentIndex
				
				
				
				
				
				
            end) then
			
			
			end
			
			for i=1,19 do
				
				if WarMenu.TickBar(featuresList[i].name,'',featuresList[i].index,0.06,function(currentIndex)
				
				
					if featuresList[i].index~=currentIndex then
					
						
					

							IsBlendFace=true
						
						
					
					end
				
					featuresList[i].index=currentIndex
					
					
				
				end) then
				
					break
					
				end
			end
			
			
			
			
			if WarMenu.MenuButton(language.back,'mainMenu') then
			
			end
			WarMenu.Display()
			
			
			
		elseif WarMenu.IsMenuOpened('menuAppearance') then
		
			--cabelo

			
			if (WarMenu.MenuButton(hairOptions.name,'menuChange')) then
			
			
				GetMenuChange=0
			
			end
			
			
			for i=1,12 do
				
				if (not (((i==2)or(i==11)) and (gender.index==2))) then
			
					if (WarMenu.MenuButton(overLays[i].name,'menuChange')) then
						GetMenuChange=i
					
					
					end
				
				end

			end
			
			
			
			if WarMenu.MenuButton(language.back,'mainMenu') then
			
			end
			

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('menuChange') then
		
				
				if GetMenuChange==0 then
					if WarMenu.ComboBox(hairOptions.name, hairOptions.items, hairOptions.index, hairOptions.index, function(currentIndex, selectedIndex)
				
				
						if gender.index==1 then
								
								if (currentIndex==36) and (hairOptions.index==35) then
									
									currentIndex=1
									
								elseif(currentIndex==39) and (hairOptions.index==1) then
									
									currentIndex=35
								end
								
								
							
						elseif gender.index==2 then
							
								if (currentIndex==38) and (hairOptions.index==37) then
									
									currentIndex=1
									
								elseif(currentIndex==39) and (hairOptions.index==1) then
									
									currentIndex=37
								end
							
								
							
						end
						
						IsBlendFace=true
						
						hairOptions.index = currentIndex
						
						
						
						
					end) then
					
					
					--cor de cabelo
					
					elseif WarMenu.ComboBox(hairOptions.nameColor, hairOptions.itemsColor, hairOptions.indexColor, hairOptions.indexColor, function(currentIndex, selectedIndex)
						
						
						
						
						hairOptions.indexColor = currentIndex
						
						IsBlendFace=true
						
						
					end) then
					
					elseif WarMenu.ComboBox(hairOptions.nameColor2, hairOptions.itemsColor, hairOptions.indexColor2, hairOptions.indexColor2, function(currentIndex, selectedIndex)
						
						
						
						
						hairOptions.indexColor2 = currentIndex
						
						IsBlendFace=true
						
					end) then
					
					elseif WarMenu.MenuButton(language.back,'menuAppearance') then
							
							
					end
				
				
				else
		
			
					for i=1,12 do	

						if (not (((i==2)or(i==11)) and (gender.index==2))) and (GetMenuChange==i) then
							
							if WarMenu.ComboBox(overLays[i].name,overLays[i].items,overLays[i].index,overLays[i].index,function(currentIndex,selectedIndex)
							
								
								
								if overLays[i].index~=currentIndex then
		
									IsBlendFace = true
								
								end
								
								
							
								overLays[i].index=currentIndex
							
							end) then
							
							
							
							elseif WarMenu.TickBar('',language.opacity,overLays[i].opacity,0.04,function(currentIndex)
									
									
									
										if overLays[i].opacity~=currentIndex then
											IsBlendFace = true
										end
									
									
										overLays[i].opacity=currentIndex
									
										
									
									
							end) then
							
							end
							
								if overLays[i].overlayType~=0 then
							
									if WarMenu.ComboBox(language.color,overLays[i].itemsColor,overLays[i].color1,overLays[i].color1,function(currentIndex,selectedIndex)
									
										
										if overLays[i].color1~=currentIndex then
										
										
											IsBlendFace = true
									
										end
									
										overLays[i].color1=currentIndex
									
									end) then
									
									end						
									
								end
							if WarMenu.MenuButton(language.back,'menuAppearance') then
							
							
							end
							
							
							
							
						end
					
					end	
				end
				
				WarMenu.Display()
			
			
			
        elseif not canClose then 
            WarMenu.OpenMenu('mainMenu')
			
        end
		
		
		if IsBlendFace then
			
			updateCharacter()
			
			

			IsBlendFace = false
		end
		
		if WarMenu.CurrentMenu() ~= nil  then
		
			
			setCamera(true)
			rotateCamera()

		
		end
		
		
			
		
		
		
        Citizen.Wait(0)
    end
end)