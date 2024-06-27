TestCenterGossipFrame = BaseTestClass:new()
    -- @covers CenterGossipFrame
    function TestCenterGossipFrame:testMainAddonFile()
        lu.assertNotIsNil(CenterGossipFrame)
    end
-- end of MultiTargetsTest