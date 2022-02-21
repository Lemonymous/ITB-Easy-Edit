
local NULLTABLE = {}
local IslandComposite = Class.inherit(IndexedEntry)
IslandComposite._entryType = "IslandComposite"
IslandComposite._iconDef = {
	width = 120,
	height = 120,
	scale = 2,
	clip = true,
	outlinesize = 0,
	pathformat = "img/strategy/island1x_%s.png",
}
IslandComposite._tooltipDef = {
	width = 180,
	height = 180,
	scale = 1,
	clip = true,
	outlinesize = 0,
	pathformat = "img/strategy/island1x_%s.png",
}

function IslandComposite:new(id, base)
	IndexedEntry.new(self, id, base)
end

function IslandComposite:getDragType()
	return "ISLAND_COMPOSITE"
end

local IslandComposites = IndexedList(IslandComposite)

function IslandComposites:update()
	local cache_islandComposites = easyEdit.savedata.cache.islandComposite or NULLTABLE

	for cache_id, cache_islandComposite in pairs(cache_islandComposites) do
		local livedata = modApi.islandComposite:get(cache_id)

		if livedata == nil then
			livedata = modApi.islandComposite:add(cache_id)
			livedata:lock()
		end

		if livedata then
			clear_table(livedata)
			clone_table(livedata, cache_islandComposite)
		end
	end

	modApi.world:update()
end

modApi.islandComposite = IslandComposites
