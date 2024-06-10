fx_version 'bodacious'
game 'gta5'
description 'Hunting - Hunt animals and sell their meat!'
author 'Abel Gaming'
version '1.0'
lua54 'yes'

shared_script '@ox_lib/init.lua'

server_scripts {
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua',
	'client/functions.lua'
}
