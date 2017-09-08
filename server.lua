RegisterServerEvent('selectCharacter')
RegisterServerEvent('saveCharacter')

AddEventHandler('selectCharacter', function(args)

	local mySource = source
	
	local playerID = GetPlayerIdentifier(mySource)
	

	
	MySQL.Async.fetchAll('SELECT characterString FROM Characters WHERE idCharacters=@id', {['@id'] = playerID}, function(characters)
		
		if next(characters) ~=nil then
		
			local sString = characters[1].characterString
		
			TriggerClientEvent('loadCharacter',mySource,sString)
			print(sString)
			
		else
		
			TriggerClientEvent('createCharacter',mySource)
			
		
			
		end
		
	end)
	
	
	
 end)
 
 
 AddEventHandler('saveCharacter', function(superString)
	local mySource = source
	
	local playerID = GetPlayerIdentifier(mySource)
 
	
	
	MySQL.Async.execute('INSERT INTO Characters(idCharacters,characterString) VALUES ("'..tostring(playerID)..'","'..tostring(superString)..'");', {}, function(rowsChanged)
	
		
		
	end)
	

 
 end)