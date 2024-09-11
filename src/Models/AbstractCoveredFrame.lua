--[[--
An abstract covered frame is a class that wraps a game frame that is covered by
Center Gossip Frame.

This class is abstract given that the way frames are handled may vary from one
to another and we need a standard way to perform all the operations that are
required to determine whether a frame should be centered and also how to center
it.
]]
local AbstractCoveredFrame = {}
    AbstractCoveredFrame.__index = AbstractCoveredFrame
    AbstractCoveredFrame.gameFrame = nil

    CenterGossipFrame:addAbstractClass('AbstractCoveredFrame', AbstractCoveredFrame)

    --[[--
    Applies a listener to the game frame OnUpdate event.

    The listener is called every time the game frame is updated so it can be
    centered if necessary.
    ]]
    function AbstractCoveredFrame:applyListener()
        -- @TODO: Implement this method in CG2 <2024.09.11>
    end

    --[[--
    Determines whether the frame can be centralized.

    @treturn boolean
    ]]
    function AbstractCoveredFrame:canBeCentralized()
        -- @TODO: Implement this method in CG3 <2024.09.11>
    end

    --[[--
    Registers the covered frame in the addon.

    It stores an instance of the covered frame so Center Gossip Frame can centralize
    the game frame.
    ]]
    function AbstractCoveredFrame:register()
        error('This is an abstract method and should be implemented by this class inheritances')
    end

    --[[--
    Determines whether the frame should be centralized.

    This method should be implemented by the concrete classes that inherit from
    this one, as the way frames are handled may vary from one to another.

    @treturn boolean
    ]]
    function AbstractCoveredFrame:shouldCentralize()
        error('This is an abstract method and should be implemented by this class inheritances')
    end
-- end of AbstractCoveredFrame