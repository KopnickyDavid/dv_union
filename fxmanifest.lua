fx_version 'adamant'
game 'gta5'

author 'DV-SCRIPT'
description 'Script that allows you to add more illegal roleplay with Union Depository heist.'
version '1.5'

server_scripts {
	'config/server_config.lua',
	'server/*.lua'
}

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
	'config/client_config.lua',
	'client/*.lua'
}

lua54 'yes'
dependency '/server:4700' -- You must have server artifact at least 4700