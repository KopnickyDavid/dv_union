fx_version 'adamant'
game 'gta5'
version '1.1'
author 'Davitko ve stylu.#3722'
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