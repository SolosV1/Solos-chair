# in qb-inventory
--> add png from /assets to /html/images

# in qb-core
--> add the following line to /shared/items.lua
	['portablechair'] 				 = {['name'] = 'portablechair', 				['label'] = 'Portable Chair', 			['weight'] = 500, 			['type'] = 'item', 		['image'] = 'portablechair.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   	['combinable'] = nil,   ['description'] = 'Shouldn\'t have skipped leg day!'},

# in qb-shops > config.lua
--> add the following to the end of any store in the config

[Slot # (Change me)] = {
            name = "portablechair",
            price = 100, -- change to whatever you want the price to be 
            amount = 50, -- amount available in stock
            info = {},
            type = "item",
            slot = Slot #, --change this to the same number above
        },

# View more FIVEM scripts and assets

https://solos.tebex.io/category/2347542 <<<<



# Join the discord for support

https://discord.gg/m3bMSvDfr3 

# ESX VERSION (Thanks to TheSmugGod)
https://github.com/TheSmugGod/solos-chair-esx

