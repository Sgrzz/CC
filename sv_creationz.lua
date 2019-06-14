

local notLoaded = {}
RegisterServerEvent("LoadCharacter")
AddEventHandler('LoadCharacter', function()

	local sourceT = source

	Citizen.CreateThread(function()
	
		if not notLoaded[sourceT] then

			

			notLoaded[sourceT] = true

			identifier = GetPlayerIdentifier(sourceT,1)

			
			

			local result = MySQL.Sync.fetchAll("SELECT * FROM essentialmode.characters WHERE license='"..identifier.."'")



				if result[1]~=nil then

					

					TriggerClientEvent('iniChar',sourceT,result[1])

				else

				

					TriggerClientEvent('startChar',sourceT)

				

				

				end


				
				





		else

			

			TriggerClientEvent('refreshChar',sourceT)

		end

	end)

end)



AddEventHandler('playerDropped', function(source)


	notLoaded[source] = true



end)



RegisterServerEvent('saveCharacter')
AddEventHandler('saveCharacter', function(character)


	

	identifier = GetPlayerIdentifier(source,1)

	local superString = ''

	superString = "'"..identifier.."','"..character.gender.."','"


	for i,v in ipairs(character.face.order) do
		superString= superString..character.face[v].."','"
	end
	
	for i,v in ipairs(character.features.order) do
		superString= superString..character.features[v].."','"
	end

	
	for i,v in ipairs(character.hair.order) do
		superString= superString..character.hair[v].."','"
	end

	superString= superString..character.Eyes.."','"

	for i,v in ipairs(character.overlays.order) do
		
		for k,b in ipairs(character.overlays[v].order) do
			superString= superString..character.overlays[v][b].."','"
			
		end

	end
	
	

	superString = superString:sub(1, -3)

	


		
	MySQL.Async.execute("DELETE FROM essentialmode.characters WHERE license='"..identifier.."'", {}, function(result)

		MySQL.Async.execute(

			"INSERT INTO essentialmode.characters ("..

			"license, gender, mother, father, headMix, skinMix, noseWidth, noseHight, noseLenght, noseHigh, noseLowering, noseTwist, eyebrowHigh, eyebrowForward, cheekboneHigh, cheekboneWidth, cheekWidth, eyesOpenning, lipsThinkness, jawWidth, jawLenght, chinLowering, chinLenght, chinWidth, chinHole, neckThikness, drawable, color1, color2, eyes, blemishesindex, blemishesopacity, blemishescolorType, facialHairindex, facialHairopacity, facialHaircolorType, facialHaircolor, eyeBrowsindex, eyeBrowsopacity, eyeBrowscolorType, eyeBrowscolor, ageingindex, ageingopacity, ageingcolorType, makeupindex, makeupopacity, makeupcolorType, blushindex, blushopacity, blushcolorType, blushcolor, blushcolor2, complexionindex, complexionopacity, complexioncolorType, sunDamageindex, sunDamageopacity, sunDamagecolorType, lipstickindex, lipstickopacity, lipstickcolorType, lipstickcolor, molesFrecklesindex, molesFrecklesopacity, molesFrecklescolorType, chestHairindex, chestHairopacity, chestHaircolorType, chestHaircolor, bodyBlemishesindex, bodyBlemishesopacity, bodyBlemishescolorType)"..

			"VALUES ("..superString..");" , {}, function()

		 end)




	end)


  
end)



