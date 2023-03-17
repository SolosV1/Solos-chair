fx_version 'cerulean'
game 'gta5'

author 'Solos#7777'
description 'solos-chair'
version '1.0.0'


shared_scripts '@qb-core/shared/locale.lua'

client_script 'client.lua'

server_script 'server.lua'

escrow_ignore {
    'client.lua',
    'server.lua'
}

lua54 'yes'
