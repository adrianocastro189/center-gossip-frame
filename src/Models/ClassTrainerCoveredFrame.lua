--[[
The ClassTrainerCoveredFrame is a specific implementation for the ClassTrainer
frame.

This frame deserves a special treatment because due to when it's instantiated in the
game. As of the time of implementation, the ClassTrainer is nil when the game opens
and it's only a valid frame after the player interacts with the trainer.

That said, the way this covered frame is registered is a bit different from the
others.
]]
local ClassTrainerCoveredFrame = {}
    ClassTrainerCoveredFrame.__index = ClassTrainerCoveredFrame

    CenterGossipFrame:addChildClass('CenterGossipFrame/ClassTrainerCoveredFrame', ClassTrainerCoveredFrame, 'CenterGossipFrame/AbstractCoveredFrame')

    --[[
    ClassTrainerCoveredFrame constructor.
    ]]
    function ClassTrainerCoveredFrame.__construct()
        return setmetatable({}, ClassTrainerCoveredFrame)
    end

    --[[
    May register the frame if it's not already registered.
    ]]
    function ClassTrainerCoveredFrame:maybeRegisterOnTrainerUpdate()
        if not self.gameFrame then
            self.gameFrame = ClassTrainerFrame
            self:applyListener()
        end
    end

    --[[ @inheritDoc ]]
    function ClassTrainerCoveredFrame:register()
        CenterGossipFrame.events:listenOriginal('TRAINER_UPDATE', function()
            self:maybeRegisterOnTrainerUpdate()
        end)
    end

    --[[ @inheritDoc ]]
    function ClassTrainerCoveredFrame:shouldCentralize()
        return true
    end
-- end of ClassTrainerCoveredFrame