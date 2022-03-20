fx_version 'adamant'
game 'gta5'

server_scripts {
	'config.lua',
	'server/*.lua'
}

client_scripts {
	'config.lua',
	'client/*.lua'
}

lua54 'yes'

dependency '/server:4700' -- You must have server artifact at least 4700