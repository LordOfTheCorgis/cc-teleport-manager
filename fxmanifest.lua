fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'LordOfTheCorgis'
description 'Very simple marker-based teleport script.'
version '1.0.0'

dependencies {
    'ox_lib',
    'ox_target'
}

shared_script {
    'config.lua',
    '@ox_lib/init.lua'
}
client_script 'client.lua'
