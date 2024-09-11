--[[--
GenericCoveredFrame covers the majority of the frames in World of Warcraft and it's
the default implementation of AbstractCoveredFrame.
]]
local GenericCoveredFrame = {}
    GenericCoveredFrame.__index = GenericCoveredFrame

    CenterGossipFrame:addChildClass('GenericCoveredFrame', GenericCoveredFrame, 'AbstractCoveredFrame')

    --[[--
    GenericCoveredFrame constructor.
    ]]
    function GenericCoveredFrame.__construct(gameFrame)
        local self = setmetatable({}, GenericCoveredFrame)

        self.gameFrame = gameFrame

        return self
    end
-- end of GenericCoveredFrame