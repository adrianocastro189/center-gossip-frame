TestCenterGossipFrame = BaseTestClass:new()

-- @covers CenterGossipFrame
TestCase.new()
    :setName('mainAddonFile')
    :setTestClass(TestCenterGossipFrame)
    :setExecution(function()
        lu.assertNotIsNil(CenterGossipFrame)
        lu.assertNotIsNil(CenterGossipFrame.tsmIntegration)
    end)
    :register()
-- end of TestCenterGossipFrame
