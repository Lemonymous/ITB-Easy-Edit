
-- defs
local CATEGORIES = {
	[REWARD_REP] = "RepAssets",
	[REWARD_POWER] = "PowAssets",
	[REWARD_TECH] = "TechAssets",
}

local Structure = Class.inherit(IndexedEntry)
Structure._debugName = "Structure"
Structure._entryType = "structures"
Structure._iconDef = {
	width = 90,
	height = 60,
	scale = 2,
	pathformat = "img/combat/structures/%s_on.png",
	pathtoken = "Image",
}
Structure._tooltipDef = {
	width = 90,
	height = 60,
	scale = 2,
	clip = true,
	pathformat = "img/combat/structures/%s_on.png",
	pathtoken = "Image",
}
Structure._rewardIcons = {
	[REWARD_REP] = "img/ui/star.png",
	[REWARD_POWER] = "img/ui/power.png",
	[REWARD_TECH] = "img/ui/core.png",
}

function Structure:getName()
	return self.Name or self._id
end

function Structure:getCategory()
	return CATEGORIES[self.Reward]
end

function Structure:getDragType()
	return "STRUCTURE"
end

function Structure:getRewardIcon()
	return self._rewardIcons[self.Reward]
end

function Structure:getImagePath()
	return string.format(self._iconDef.pathformat, self.Image)
end


local Structures = IndexedList(Structure)
Structures._rewardIcons = Structure._rewardIcons

modApi.structures = Structures
