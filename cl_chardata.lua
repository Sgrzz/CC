


character = {
				
	
				gender = 1,
				face = {
						order={"mother","father","headMix","skinMix"},
						mother = 1,
						father = 1,
						headMix = 50.0,
						skinMix = 50.0
						},


				
				features = {  --scale is actually -1.0 to 1.0

							order={"NoseWidth","NoseHight","NoseLenght","NoseHigh","NoseLowering","NoseTwist","EyeBrownHigh","EyeBrownForward","CheeksBoneHigh","CheeksBoneWidth","CheeksWidth","EyesOpenning","LipsThickness","JawWidth","JawLenght","ChinLowering","ChinLenght","ChinWidth","ChinHole","NeckThikness"},

					        NoseWidth = 50.0, --0
					        NoseHight = 50.0, --1

					        NoseLenght = 50.0,--2
					        NoseHigh = 50.0,--3

					        NoseLowering = 50.0,--4
					        NoseTwist = 50.0,--5

					        EyeBrownHigh = 50.0,--6
					        EyeBrownForward = 50.0,--7

					        CheeksBoneHigh = 50.0,--8
					        CheeksBoneWidth = 50.0,--9

					        CheeksWidth = 50.0,--10

					        EyesOpenning = 50.0,--11

					        LipsThickness = 50.0,--12

					        JawWidth  = 50.0,--13
					        JawLenght  = 50.0,--14

					        ChinLowering  = 50.0,--15
					        ChinLenght  = 50.0,--16

					        ChinWidth = 50.0,--17
					        ChinHole = 50.0,--18

					        NeckThikness = 50.0--19
							},

							
				hair = {
							order={"drawable","color1","color2"},
							drawable=0,
							color1=0,
							color2=0


						},

				Eyes = 0,

				overlays = { --42

							order = {"Blemishes","FacialHair","EyeBrows","Ageing","MakeUp","Blush","Complexion","SunDamage","LipStick","MolesFreckles","ChestHair","BodyBlemishes"},

							Blemishes = {
											order= {"Index","Opacity","colorType"},
											Index = 0,
											Opacity = 0.0,
											colorType = 0
										},   

							FacialHair = {
											order= {"Index","Opacity","colorType","color1"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 1,
											color1 = 0
										},
							EyeBrows = {
											order= {"Index","Opacity","colorType","color1"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 1,
											color1 = 0
										},
							Ageing = {	
											order= {"Index","Opacity","colorType"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 0
										},
							MakeUp = {
											order= {"Index","Opacity","colorType"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 0
										},
							Blush = {
											order= {"Index","Opacity","colorType","color1","color2"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 2,
											color1 = 0,color2 = 0
										},
							Complexion = {
											order= {"Index","Opacity","colorType"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 0
										},
							SunDamage = {
											order= {"Index","Opacity","colorType"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 0
										},
							LipStick = {
											order= {"Index","Opacity","colorType","color1"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 2,
											color1 = 0
										},
							MolesFreckles = {
											order= {"Index","Opacity","colorType"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 0
										},
							ChestHair = {
											order= {"Index","Opacity","colorType","color1"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 1,
											color1 = 0
										},
							BodyBlemishes = {

											order= {"Index","Opacity","colorType"},
											
											Index = 0,
											Opacity = 0.0,
											colorType = 0
										}



							}


			}


AddEventHandler('playerSpawned', function()
	TriggerServerEvent("LoadCharacter")
end)


RegisterNetEvent('refreshChar')
AddEventHandler('refreshChar', function()


	refreshChar()


end)


RegisterNetEvent('iniChar')
AddEventHandler('iniChar', function(char)




	

	character.gender=char.gender

	for i,v in ipairs(character.face.order) do
		character.face[v]=char[v]
		
	end

	local order = {"noseWidth", "noseHight", "noseLenght", "noseHigh", "noseLowering", "noseTwist", "eyebrowHigh", "eyebrowForward", "cheekboneHigh", "cheekboneWidth", "cheekWidth", "eyesOpenning", "lipsThinkness", "jawWidth", "jawLenght", "chinLowering", "chinLenght", "chinWidth", "chinHole", "neckThikness"}

	for i,v in ipairs(character.features.order) do
		
		character.features[v]=char[order[i]]
		
	end


	for i,v in ipairs(character.hair.order) do
		character.hair[v]=char[v]
	end

	character.Eyes=char.eyes

	local order = {"blemishesindex", "blemishesopacity", "blemishescolorType", "facialHairindex", "facialHairopacity", "facialHaircolorType", "facialHaircolor", "eyeBrowsindex", "eyeBrowsopacity", "eyeBrowscolorType", "eyeBrowscolor", "ageingindex", "ageingopacity", "ageingcolorType", "makeupindex", "makeupopacity", "makeupcolorType", "blushindex", "blushopacity", "blushcolorType", "blushcolor", "blushcolor2", "complexionindex", "complexionopacity", "complexioncolorType", "sunDamageindex", "sunDamageopacity", "sunDamagecolorType", "lipstickindex", "lipstickopacity", "lipstickcolorType", "lipstickcolor", "molesFrecklesindex", "molesFrecklesopacity", "molesFrecklescolorType", "chestHairindex", "chestHairopacity", "chestHaircolorType", "chestHaircolor", "bodyBlemishesindex", "bodyBlemishesopacity", "bodyBlemishescolorType"}

	local counter = 0

	for i,v in ipairs(character.overlays.order) do

		
		for y,b in ipairs(character.overlays[v].order) do
			
			counter = counter + 1

			


			character.overlays[v][b] = char[order[counter]]

		
			

		end

	end


	


    

	refreshChar()

	





end)

 	
		

RegisterNetEvent('save')
AddEventHandler('save', function()
	

	TriggerServerEvent('saveCharacter', character)



end)
