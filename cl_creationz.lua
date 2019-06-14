



local setCamera = false




function camera()
	Citizen.CreateThread(function()



		local cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

		SetCamActive(cam,  true)



		RenderScriptCams(true,  false,  0,  true,  true)
		
		local pos = GetEntityCoords(GetPlayerPed(-1))

		local camPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 2.0, 0.0)
		
		SetCamCoord(cam, camPos.x, camPos.y, camPos.z+0.7)
		
		PointCamAtCoord(cam,pos.x,pos.y,pos.z+0.7)
		
		
		local pedHeading = GetEntityHeading(PlayerPedId())

		



		local setCam = GetFollowPedCamViewMode()

		SetFollowPedCamViewMode(0)
		
		while setCamera do

			SetEntityLocallyVisible(PlayerPedId())
			
			Citizen.Wait(0)

				DisableAllControlActions(0)


				coords = GetEntityCoords(GetPlayerPed(-1),true)


				if (IsDisabledControlPressed(0, 32) and (GetCamFov(cam)>=9.0)) then
	
					SetCamFov(cam, GetCamFov(cam)- 2.0)
				end

				if (IsDisabledControlPressed(0, 33) and (GetCamFov(cam)<=91.0)) then
		
					SetCamFov(cam, GetCamFov(cam)+ 2.0)
				end

				if (IsDisabledControlPressed(0, 34)) then

					pedHeading=pedHeading-1.5

					SetEntityHeading(PlayerPedId(), pedHeading)

				end
				if (IsDisabledControlPressed(0, 35)) then

					pedHeading=pedHeading+1.5

					SetEntityHeading(PlayerPedId(), pedHeading)

				end

				

				HideHudComponentThisFrame(19)
				HideHudComponentThisFrame(20)

		
		end

		SetCamActive(cam,  false)
		RenderScriptCams(false,  false,  0,  true,  true)

		SetFollowPedCamViewMode(setCam)


	end)
	
end

function setModel(model)



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
		SetEntityMaxHealth(PlayerPedId(), 200)
		SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
		
	end


	SetModelAsNoLongerNeeded(modelhashed)
end



function refreshChar() --refresh the char



	if character.gender==1 then
		setModel('mp_m_freemode_01')
	else
		setModel('mp_f_freemode_01')

	end

	dressChar()

	blendface(character.face.mother,character.face.father,character.face.headMix,character.face.skinMix)

	for i,v in ipairs(character.features) do
		SetPedFaceFeature(GetPlayerPed(-1), i-1, (v/50)-1)
	end







	for i,v in ipairs(character.overlays.order) do
		
		


			



				
				SetPedHeadOverlay(GetPlayerPed(-1), i-1, character.overlays[v].Index, character.overlays[v].Opacity/100)

				


				if character.overlays[v].colorType~=0 then

					local color = 0

					if i-1==6 then

						color = character.overlays[v].color2

					end

					SetPedHeadOverlayColor(GetPlayerPed(-1), i-1, character.overlays[v].colorType, character.overlays[v].color1, color)

	

		

		end

	end

	SetPedComponentVariation(GetPlayerPed(-1), 2, character.hair.drawable, 0, 0)



	SetPedHairColor(GetPlayerPed(-1), character.hair.color1, character.hair.color2)

	
	SetPedEyeColor(GetPlayerPed(-1), character.Eyes)

	

end


function dressChar()

	if character.gender==1 then
		SetPedComponentVariation(GetPlayerPed(-1),3,15,0,0)
		SetPedComponentVariation(GetPlayerPed(-1),4,21,0,0)
		SetPedComponentVariation(GetPlayerPed(-1),6,34,0,0)
		SetPedComponentVariation(GetPlayerPed(-1),8,15,0,0)
		SetPedComponentVariation(GetPlayerPed(-1),11,15,0,0)
	
	else
		SetPedComponentVariation(GetPlayerPed(-1),3,15,0,0) 
		SetPedComponentVariation(GetPlayerPed(-1),4,15,0,0)
		SetPedComponentVariation(GetPlayerPed(-1),6,35,0,0)
		SetPedComponentVariation(GetPlayerPed(-1),8,2,0,0)
		SetPedComponentVariation(GetPlayerPed(-1),11,15,0,0) 
	end

end


function chooseGender()



		local items = { "Masculino", "Feminino" }
		local currentItemIndex = character.gender
	

		WarMenu.CreateMenu('gender', 'Genero')
		WarMenu.SetSubTitle('gender', '')
		WarMenu.OpenMenu('gender')
		WarMenu.SetTitleBackgroundColor('gender', 255, 255, 255, 255)

		while WarMenu.IsMenuOpened('gender') do
			Citizen.Wait(0)

            if WarMenu.ComboBox('Genero', items, currentItemIndex, currentItemIndex, function(currentIndex)
                    
            		if currentItemIndex ~= currentIndex then

    					local model = 'mp_f_freemode_01'

    					character.gender = 2

						if currentItemIndex == 2 then
							model = 'mp_m_freemode_01'
							character.gender = 1
						end

						setModel(model)

						refreshChar()
            		end

                    currentItemIndex = currentIndex
 
                end) then

            elseif (WarMenu.Button("OK"))  or (IsControlJustPressed(0, 177)) or (IsDisabledControlJustPressed(0, 177)) then

            	WarMenu.CloseMenu()

            end


            WarMenu.Display()

		end

end


function blendface(shapeFirstID, shapeSecondID, shapeMix, skinMix)
	
	shapeFirstID = shapeFirstID -1

	shapeSecondID = shapeSecondID -1

	shapeMix = shapeMix/100
	skinMix = skinMix/100

	if shapeFirstID == 21 then
		shapeFirstID = 45
	else
		shapeFirstID = shapeFirstID + 21
	end

	if shapeSecondID > 20 then

		shapeSecondID = shapeSecondID + 21
 
	end



	SetPedHeadBlendData(GetPlayerPed(-1),shapeFirstID,shapeSecondID,0,shapeFirstID,shapeSecondID,0,shapeMix,skinMix,0.0,false)	
	
end







function chooseFace()

	local mother = {'Misty','Natalie','Ashley','Ava','Camila','Olivia','Audrey','Sophia','Giselle','Charlotte','Evelyn','Amelia','Violet','Brianna','Nicole','Hannah','Elizabeth','Grace','Zoe','Jasmine','Emma','Isabella'}
	local motherIndex = character.face.mother

	local father = {'Andrew','Gabriel','Kevin','Claude','Vincent','Alex','Anthony','Angel','Joshua','Evan','Benjamin','Samuel','Ethan','Juan','Adrian','Michael','Diego','John','Isaac','Daniel','Santiago','Noah','Niko','Louis'}
	local fatherIndex = character.face.father

	local headMix = character.face.headMix

	local skinMix = character.face.skinMix

	local blend = false
	local refresh = false

	WarMenu.CreateMenu('face', 'Cara')
	WarMenu.SetSubTitle('face', '')
	WarMenu.OpenMenu('face')

	WarMenu.SetTitleBackgroundColor('face', 255, 255, 255, 255)


	while  WarMenu.IsMenuOpened('face') do
		Citizen.Wait(0)


		if WarMenu.ComboBox('Mae', mother, motherIndex, motherIndex, function(currentIndex) 

			if motherIndex ~= currentIndex then

				blend = true
				
			end
			motherIndex = currentIndex
		end) then

		elseif WarMenu.ComboBox('Pai', father, fatherIndex, fatherIndex, function(currentIndex) 
			if fatherIndex ~= currentIndex then

				blend = true
				
			end
			
			fatherIndex = currentIndex
		end) then

		elseif WarMenu.TickBar('Lado da mae','Lado do pai',headMix,0,function(currentIndex)

			if headMix ~= currentIndex then
				blend = true
			end

			headMix = currentIndex


		end) then

		elseif WarMenu.TickBar('Pele da mae ','Pelo do pai',skinMix,0,function(currentIndex)

			if skinMix ~= currentIndex then
				blend = true
			end

			skinMix = currentIndex


		end) then


		elseif (WarMenu.Button("OK")) or (IsControlJustPressed(0, 177)) or (IsDisabledControlJustPressed(0, 177)) then

        	WarMenu.CloseMenu()

        end

        if blend then

        

    		character.face.mother = motherIndex

			character.face.father = fatherIndex

			

			character.face.headMix = headMix

			character.face.skinMix = skinMix

			blendface(character.face.mother,character.face.father,character.face.headMix,character.face.skinMix)
			
        	

        	blend = false

        	
    	end




        WarMenu.Display()



	end




	
end


function features()





	local _Features = {'Nariz','Perfil nasal','Ponta do nariz','Sobrancelha','Maçãs do rosto','Bochechas','Olhos','Labios','Maxilar','Perfil queixo','Forma queixo','Pescoço'}

	local _FeaturesDesc = {
							{					
								{'Estreito','Largo',character.features.NoseWidth},
								{'Cima','Baixo',character.features.NoseHight}
							},
							{					
								{'Longo','Pequeno',character.features.NoseLenght},
								{'Curvado','Torto',character.features.NoseHigh}
							},
							{					
								{'Cima','Baixo',character.features.NoseLowering},
								{'Direita','Esquerda',character.features.NoseTwist}
							},
							{					
								{'Cima','Baixo',character.features.EyeBrownHigh},
								{'Dentro','Fora',character.features.EyeBrownForward}
							},
							{					
								{'Cima','Baixo',character.features.CheeksBoneHigh},
								{'Dentro','Fora',character.features.CheeksBoneWidth}
							}
							,
							{					
								{'Inchadas','Esqueléticas',character.features.CheeksWidth}
								
							},
							{					
								{'Abertos','Fechados',character.features.EyesOpenning}
						
							},
							{					
								{'Grossos','Finos',character.features.LipsThickness}
						
							},
							{					
								{'Estreito','Largo',character.features.JawWidth},
								{'Redondo','Quadrado',character.features.JawLenght}
							},
							{					
								{'Cima','Baixo',character.features.ChinLowering},
								{'Dentro','Fora',character.features.ChinLenght}
							},
							{					
								{'Pontiagudo','Quadrado',character.features.ChinWidth},
								{'Redondo','Rachado',character.features.ChinHole}
							},
							{					
								{'Fino','Grosso',character.features.NeckThikness}
						
							}


						}

	
	WarMenu.CreateMenu('features', 'Características')

	WarMenu.SetTitleBackgroundColor('features', 255, 255, 255, 255)

	WarMenu.SetSubTitle('features', '')

	WarMenu.CreateSubMenu('_FeaturesDesc', 'features', '')

	WarMenu.SetTitleBackgroundColor('_FeaturesDesc', 255, 255, 255, 255)

	WarMenu.OpenMenu('features')


	local activeMenu = 0

	local featureIndex = 0

	local last = false

	while (WarMenu.IsMenuOpened('features')) or (WarMenu.IsMenuOpened('_FeaturesDesc')) do

		Citizen.Wait(0)
		
			if WarMenu.IsMenuOpened('features') then
				if last then
					WarMenu.SetCurrent(activeMenu)
					last = false
				end

				for i,v in ipairs(_Features) do


					if WarMenu.MenuButton(v, '_FeaturesDesc') then
						WarMenu.SetSubTitle('_FeaturesDesc', v)
						activeMenu=i


						if (i<= 6)then
							featureIndex = (i * 2)-2
						elseif(i>6)and(i<9) then
							featureIndex = i+4
						elseif(i>=9) then
							featureIndex = (i * 2)-5
						end

					end
					
	            	
				end

				
				if (WarMenu.Button("OK")) or (IsControlJustPressed(0, 177)) or (IsDisabledControlJustPressed(0, 177)) then

					WarMenu.CloseMenu()
				
				end
	         

	        
	        elseif WarMenu.IsMenuOpened('_FeaturesDesc') then

	        	last = true

	            
	        	for i,v in ipairs(_FeaturesDesc[activeMenu]) do
	        	
	        		if WarMenu.TickBar(v[1],v[2],v[3],0,function(currentIndex)

		
	        			SetPedFaceFeature(GetPlayerPed(-1), featureIndex+i-1, (v[3]/50)-1)
						v[3] = currentIndex



					end) then end

	        	end
	        	if (WarMenu.MenuButton('Ok', 'features'))then
					
				end

	        end

	

      
        
        WarMenu.Display()
	end 
	

		character.features.NoseWidth = _FeaturesDesc[1][1][3]
		character.features.NoseHight = _FeaturesDesc[1][2][3]

		character.features.NoseLenght = _FeaturesDesc[2][1][3]
		character.features.NoseHigh = _FeaturesDesc[2][2][3]

		character.features.NoseLowering = _FeaturesDesc[3][1][3]
		character.features.NoseTwist = _FeaturesDesc[3][2][3]

		character.features.EyeBrownHigh = _FeaturesDesc[4][1][3]
		character.features.EyeBrownForward = _FeaturesDesc[4][2][3]

		character.features.CheeksBoneHigh = _FeaturesDesc[5][1][3]
		character.features.CheeksBoneWidth = _FeaturesDesc[5][2][3]

		character.features.CheeksWidth = _FeaturesDesc[6][1][3]

		character.features.EyesOpenning = _FeaturesDesc[7][1][3]

		character.features.LipsThickness = _FeaturesDesc[8][1][3]

		character.features.JawWidth  = _FeaturesDesc[9][1][3]
		character.features.JawLenght  = _FeaturesDesc[9][2][3]

		character.features.ChinLowering  = _FeaturesDesc[10][1][3]
		character.features.ChinLenght  = _FeaturesDesc[10][2][3]

		character.features.ChinWidth = _FeaturesDesc[11][1][3]
		character.features.ChinHole = _FeaturesDesc[11][2][3]

		character.features.NeckThikness = _FeaturesDesc[12][1][3]


	
end

function overlays()

	local activeMenu = 0

	local last = false

	local _ItemIndex = {
						character.overlays.Blemishes.Index+1,
						character.overlays.FacialHair.Index+1,
						character.overlays.EyeBrows.Index+1,
						character.overlays.Ageing.Index+1,
						character.overlays.MakeUp.Index+1,
						character.overlays.Blush.Index+1,
						character.overlays.Complexion.Index+1,
						character.overlays.SunDamage.Index+1,
						character.overlays.LipStick.Index+1,
						character.overlays.MolesFreckles.Index+1,
						character.overlays.ChestHair.Index+1,
						character.overlays.BodyBlemishes.Index+1
					}

	local _ItemOpacity = {
						character.overlays.Blemishes.Opacity,
						character.overlays.FacialHair.Opacity,
						character.overlays.EyeBrows.Opacity,
						character.overlays.Ageing.Opacity,
						character.overlays.MakeUp.Opacity,
						character.overlays.Blush.Opacity,
						character.overlays.Complexion.Opacity,
						character.overlays.SunDamage.Opacity,
						character.overlays.LipStick.Opacity,
						character.overlays.MolesFreckles.Opacity,
						character.overlays.ChestHair.Opacity,
						character.overlays.BodyBlemishes.Opacity
					}


	local _ItemColor1 = {
						[2]=character.overlays.FacialHair.color1+1,
						[3]=character.overlays.EyeBrows.color1+1,
						[6]=character.overlays.Blush.color1+1,
						[9]=character.overlays.LipStick.color1+1,
						[11]=character.overlays.ChestHair.color1+1,
						}

	local _ItemColor2 = {
						[6]=character.overlays.Blush.color2+1
						}

	local colors = {}

	

	for i=1,64 do
		table.insert(colors,i)

	end



	local _overlays = {'Manchas','Barba','Sobrancelhas','Envelhecimento','Maquiagem olhos','Maquiagem','Aspecto','Danos do sol','Batom','Sardas','Pelo no peito','Manchas do corpo'}



	WarMenu.CreateMenu('overlays', 'Aparencia')

	WarMenu.SetTitleBackgroundColor('overlays', 255, 255, 255, 255)

	WarMenu.SetSubTitle('overlays', '')

	WarMenu.CreateSubMenu('_overlaysDesc','overlays','')

	WarMenu.SetTitleBackgroundColor('_overlaysDesc', 255, 255, 255, 255)

	WarMenu.OpenMenu('overlays')

	while WarMenu.IsMenuOpened('overlays') or WarMenu.IsMenuOpened('_overlaysDesc') do
		Citizen.Wait(0)

		if WarMenu.IsMenuOpened('overlays') then

			if last then

				WarMenu.SetCurrent(activeMenu)

				last = false

			end

			for i,v in ipairs(_overlays) do
				
				if WarMenu.MenuButton(v, '_overlaysDesc') then

					WarMenu.SetSubTitle('_overlaysDesc', v)
					activeMenu = i


				end


			end

			if (WarMenu.Button("OK")) or (IsControlJustPressed(0, 177)) or (IsDisabledControlJustPressed(0, 177)) then

				WarMenu.CloseMenu()
					
			end

		elseif WarMenu.IsMenuOpened('_overlaysDesc') then
			last = true


			local change = false
			
			local items = {}



			for i=1,(GetNumHeadOverlayValues(activeMenu-1)) do
				table.insert(items,i)

			end

			



		
			if WarMenu.ComboBox('Opção', items, _ItemIndex[activeMenu], _ItemIndex[activeMenu], function(currentIndex)

                    _ItemIndex[activeMenu] = currentIndex
                
                	
                    
                    change = true


                    


            end) then end

			if ((activeMenu == 2) or (activeMenu ==3) or (activeMenu ==11) or (activeMenu == 6) or (activeMenu ==9)) then

				if WarMenu.ComboBox('Cor', colors, _ItemColor1[activeMenu], _ItemColor1[activeMenu], function(currentIndex)

	                    _ItemColor1[activeMenu] = currentIndex
	                
	                    
	                    change = true


	                    


	            end) then end

			end

            if activeMenu==6 then

            	 if WarMenu.ComboBox('Segunda cor', colors, _ItemColor2[activeMenu], _ItemColor2[activeMenu], function(currentIndex)

	                    _ItemColor2[activeMenu] = currentIndex
	                
	                    
	                    change = true


	                    


	            end) then end

            end



			if WarMenu.TickBar('Opacidade','',_ItemOpacity[activeMenu],0,function(currentIndex)

				_ItemOpacity[activeMenu] = currentIndex  


				change = true


			end) then

			elseif (WarMenu.MenuButton('Ok', 'overlays'))then

					
			end

			if change then
				SetPedHeadOverlay(PlayerPedId(), activeMenu-1, _ItemIndex[activeMenu]-1 ,_ItemOpacity[activeMenu]/100)
				change = false  
				
				if ((activeMenu == 2) or (activeMenu ==3) or (activeMenu ==11)) then

					SetPedHeadOverlayColor(PlayerPedId(), activeMenu-1, 1, _ItemColor1[activeMenu]-1,  0)

				elseif ((activeMenu == 6) or (activeMenu ==9)) then

					local temp = 0

					if activeMenu==6 then

						temp = _ItemColor2[activeMenu]-1

					end

					SetPedHeadOverlayColor(PlayerPedId(), activeMenu-1, 2, _ItemColor1[activeMenu]-1,  temp)
				end

				

			end



		end


		WarMenu.Display()
	end



	character.overlays.Blemishes.Index = _ItemIndex[1]-1
	character.overlays.FacialHair.Index = _ItemIndex[2]-1
	character.overlays.EyeBrows.Index = _ItemIndex[3]-1
	character.overlays.Ageing.Index = _ItemIndex[4]-1
	character.overlays.MakeUp.Index = _ItemIndex[5]-1
	character.overlays.Blush.Index = _ItemIndex[6]-1
	character.overlays.Complexion.Index = _ItemIndex[7]-1
	character.overlays.SunDamage.Index = _ItemIndex[8]-1
	character.overlays.LipStick.Index = _ItemIndex[9]-1
	character.overlays.MolesFreckles.Index = _ItemIndex[10]-1
	character.overlays.ChestHair.Index = _ItemIndex[11]-1
	character.overlays.BodyBlemishes.Index = _ItemIndex[12]-1



	character.overlays.Blemishes.Opacity = _ItemOpacity[1]
	character.overlays.FacialHair.Opacity = _ItemOpacity[2]
	character.overlays.EyeBrows.Opacity = _ItemOpacity[3]
	character.overlays.Ageing.Opacity = _ItemOpacity[4]
	character.overlays.MakeUp.Opacity = _ItemOpacity[5]
	character.overlays.Blush.Opacity = _ItemOpacity[6]
	character.overlays.Complexion.Opacity = _ItemOpacity[7]
	character.overlays.SunDamage.Opacity = _ItemOpacity[8]
	character.overlays.LipStick.Opacity = _ItemOpacity[9]
	character.overlays.MolesFreckles.Opacity = _ItemOpacity[10]
	character.overlays.ChestHair.Opacity = _ItemOpacity[11]
	character.overlays.BodyBlemishes.Opacit = _ItemOpacity[12]



	character.overlays.FacialHair.color1=_ItemColor1[2]-1
	character.overlays.EyeBrows.color1=_ItemColor1[3]-1
	character.overlays.Blush.color1=_ItemColor1[6]-1
	character.overlays.LipStick.color1=_ItemColor1[9]-1
	character.overlays.ChestHair.color1=_ItemColor1[11]-1


	character.overlays.Blush.color2=_ItemColor2[6]-1




end


function hair()

	WarMenu.CreateMenu('hair', 'Cabelo')

	WarMenu.SetSubTitle('hair', '')

	WarMenu.SetTitleBackgroundColor('hair', 255, 255, 255, 255)

	local items = {}

	local items3 = {}




	


	local _ItemIndex = character.hair.drawable+1

	local _ItemIndex2 = character.hair.color1+1

	local _ItemIndex3 = character.hair.color2+1

	local IndexTexture = {}

	local itemsTexture = {}

	local change = false

	for i=1,GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 2) do

		table.insert(items,i)

		itemsTexture[i]={}
		IndexTexture[i] = 1

		for y=1,GetNumberOfPedTextureVariations(GetPlayerPed(-1), 2, i-1) do

			table.insert(itemsTexture[i],y)



		
		end

		
	end

	for i=1,GetNumHairColors() do

		table.insert(items3,i)

		
	end





	

	WarMenu.OpenMenu('hair')

	while WarMenu.IsMenuOpened('hair') do

		Citizen.Wait(0)

		if WarMenu.ComboBox('Tipo', items, _ItemIndex, _ItemIndex, function(currentIndex)

            _ItemIndex = currentIndex
        
            
            change = true


	        


        end) then


		elseif WarMenu.ComboBox('Cor', items3, _ItemIndex2, _ItemIndex2, function(currentIndex)

            _ItemIndex2 = currentIndex
        
            
            change = true


	        


        end) then

		elseif WarMenu.ComboBox('Madeixa', items3, _ItemIndex3, _ItemIndex3, function(currentIndex)

            _ItemIndex3 = currentIndex
        
            
            change = true


	        


        end) then

        

		elseif (WarMenu.Button("OK")) or (IsControlJustPressed(0, 177)) or (IsDisabledControlJustPressed(0, 177)) then

			WarMenu.CloseMenu()
				
		end

		if change then

			SetPedComponentVariation(GetPlayerPed(-1), 2, _ItemIndex-1,0, 0)



			SetPedHairColor(GetPlayerPed(-1), _ItemIndex2-1, _ItemIndex3-1)

			



		end

		WarMenu.Display()

		--cabelo male 22 -> FM_Hip_M_Hair_001_ A B C D E

		--ClearPedDecorations(GetPlayerPed(-1))

		--SetPedDecoration(GetPlayerPed(-1), GetHashKey("multiplayer_overlays"), GetHashKey("FM_F_Hair_003_"..itemsPallet[palletIndex]))


		--extrair os overlays.xml no openiv e procurar as referencias a hair





	end

	character.hair.drawable=_ItemIndex -1

	character.hair.color1=_ItemIndex2  -1

	character.hair.color2=_ItemIndex3  -1

	
end


function eyes()

	WarMenu.CreateMenu('eyes', 'Olhos')

	WarMenu.SetSubTitle('eyes', '')

	WarMenu.SetTitleBackgroundColor('eyes', 255, 255, 255, 255)



	local items = {}

	local _ItemIndex = character.Eyes+1

	for i=1,33 do
		table.insert(items,i)
	end

	

	WarMenu.OpenMenu('eyes')

	while WarMenu.IsMenuOpened('eyes') do

		Citizen.Wait(0)

		if WarMenu.ComboBox('Cor', items, _ItemIndex, _ItemIndex, function(currentIndex)

            _ItemIndex = currentIndex
        
        	SetPedEyeColor(GetPlayerPed(-1), _ItemIndex-1)
            

        end) then
		

		elseif (WarMenu.Button("OK")) or (IsControlJustPressed(0, 177)) or (IsDisabledControlJustPressed(0, 177)) then

			WarMenu.CloseMenu()
				
		end



		WarMenu.Display()

	end

	character.Eyes=_ItemIndex -1
	
end




RegisterNetEvent('startChar')
AddEventHandler('startChar', function()

	if not setCamera then

		Citizen.CreateThread(function()

			
		 
		
			

			setCamera = true

			camera()

			refreshChar()



			WarMenu.CreateMenu('CharacterCreation', 'Criar personagem.')
			WarMenu.SetSubTitle('CharacterCreation', '')
			WarMenu.OpenMenu('CharacterCreation')

			WarMenu.SetTitleBackgroundColor('CharacterCreation', 255, 255, 255, 255)


			SetEntityVisible(PlayerPedId(), false, 0)

			

			SetEntityCollision(PlayerPedId(), false, false)

			FreezeEntityPosition(PlayerPedId(), true)



			while WarMenu.IsMenuOpened('CharacterCreation') do
				Citizen.Wait(0)

				

				

				if WarMenu.Button("Genero") then


					
					

					chooseGender()
					
					WarMenu.OpenMenu('CharacterCreation')

				

					WarMenu.SetCurrent(1)


				elseif WarMenu.Button("Familia") then

					
					chooseFace()
					
					WarMenu.OpenMenu('CharacterCreation')
					WarMenu.SetCurrent(2)
		

			    elseif WarMenu.Button('características') then
			    	
			    	features()
			    	
			    	WarMenu.OpenMenu('CharacterCreation')
			    	WarMenu.SetCurrent(3)

			    elseif WarMenu.Button('Aparencia') then
			    
			    	

			    	overlays()
			    	WarMenu.OpenMenu('CharacterCreation')
			    	WarMenu.SetCurrent(4)

			    elseif WarMenu.Button('Cabelo') then
			    
			    	

			    	hair()
			    	WarMenu.OpenMenu('CharacterCreation')
			    	WarMenu.SetCurrent(5)


			    elseif WarMenu.Button('Olhos') then
			    	
			    	

			    	eyes()
			    	WarMenu.OpenMenu('CharacterCreation')
			    	WarMenu.SetCurrent(6)




				elseif WarMenu.Button('Guardar') then

					TriggerServerEvent('saveCharacter', character)

					WarMenu.CloseMenu()

					

				end

				WarMenu.Display()


			end

			setCamera = false


			SetEntityVisible(PlayerPedId(), true, 0)

			

			SetEntityCollision(PlayerPedId(), true, true)

			FreezeEntityPosition(PlayerPedId(), false)

		end)

	end

end)