-- Pal Analyzer v0.3 (Hahabynow) --

-- ********************************************* --
-- *************** CONFIGS BEGIN *************** --
-- ********************************************* --

-- Display Condition --
                                -- "AlwaysOn"   - 不需要按住或按下按钮，工具提示将始终显示
DisplayStyle = "Toggle"           -- "Hold"       - 左键(键盘)或右杠(控制器)将显示工具提示，而按住
                                -- "Toggle"     - 左键(键盘)或右杠(控制器)将切换工具提示的打开和关闭

-- Visual Settings --
TimeToHoldWidget = 1.0          -- 移除目标后需要等待多长时间(以秒为单位)才能移除工具提示
MaxOpacity = 0.8                -- 工具提示的不透明度。1.0是不透明的，0.0是完全透明的
FollowPal = true                -- 如果为true，工具提示将绘制在世界空间中帕鲁的顶部，否则将绘制在左上角

-- Position Of FollowPal Tooltip --
FollowOffsetX = 100.0             -- 如果FollowPal = true，则在X轴上偏移工具提示(从左到右)。负号向左移动，正号向右移动
FollowOffsetY = -400.0          -- 如果FollowPal = true，则在Y轴上(上下)偏移工具提示。消极的向上移动，积极的向下移动

-- Position of Static (Top Left) Tooltip --
StaticOffsetX = 50.0            -- 如果FollowPal = false，则在X轴上偏移工具提示(从左到右)。负号向左移动，正号向右移动
StaticOffsetY = 200.0           -- 如果FollowPal = false，则在Y轴上偏移工具提示(上下)。消极的向上移动，积极的向下移动

-- Search Distance --
Distance = 100000.0               -- 要多远才能找到帕鲁。默认值5000.0匹配捕获标线距离

-- Unlock Thresholds --
StatsThreshold = 0              -- 你必须捕获多少个这种类型的帕鲁才能在工具提示中看到它的属性(例如:工作速度，攻击，防御)
ActiveAbilitiesThreshold = 0    -- 你必须捕获多少个这种类型的帕鲁才能在工具提示中看到它的主动技能
PassiveAbilitiesThreshold = 0  -- 你必须捕获多少个这种类型的帕鲁才能在工具提示中看到它的被动技能
IVsThreshold = 0               -- 你必须捕获多少个这种类型的帕鲁才能看到它的IV/天赋值

-- Additional Information --
ShowCaptureCount = true         -- 如果为真，将显示捕获计数代替饥饿(不幸的是，我不能在这个时候改变食物图标，所以它有点糟糕)
AnalyzeHumans = true           -- 显示“野生”人类的工具提示?这将适用于所有野生非朋友npc
AnalyzeDomestic = true         -- 显示玩家拥有的帕鲁的工具提示
ShowPalsInBox = true            -- 显示您的PalBox中该物种的数量。显示在他们的名字之后[]
ShowIVs = true                  -- 在属性(攻击，防御和生命值)之后显示iv(天赋)100是最好的，0是最差的
ShowIVBonus = false             -- 显示属性的奖励百分比，因为它是IV。

-- ********************************************* --
-- *************** CONFIGS END ***************** --
-- ********************************************* --

RegisterCustomEvent("SetPalAnalyzerConfig", function(Context)
    local ModActors = FindAllOf("ModActor_C")
    for _, ModActor in ipairs(ModActors) do
        if ModActor.IsPalAnalyzer04 ~= nil and ModActor.IsPalAnalyzer04 then
            
            if type(TimeToHoldWidget) == "number" then
                ModActor.TimeToHoldWidget = TimeToHoldWidget
            end
            
            if type(MaxOpacity) == "number" then
                ModActor.MaxOpacity = MaxOpacity
            end
            
            if type(FollowPal) == "boolean" then
                ModActor.FollowPal = FollowPal
            end
            
            if type(Distance) == "number" then
                ModActor.Distance = Distance
            end
            
            if type(DisplayStyle) == "string" then
                ModActor.DisplayStyle = DisplayStyle
            end

            if type(StatsThreshold) == "number" then
                ModActor.StatsThreshold = StatsThreshold
            end

            if type(ActiveAbilitiesThreshold) == "number" then
                ModActor.ActiveAbilitiesThreshold = ActiveAbilitiesThreshold
            end

            if type(PassiveAbilitiesThreshold) == "number" then
                ModActor.PassiveAbilitiesThreshold = PassiveAbilitiesThreshold
            end
            
            if type(ShowCaptureCount) == "boolean" then
                ModActor.ShowCaptureCount = ShowCaptureCount
            end

            if type(AnalyzeHumans) == "boolean" then
                ModActor.AnalyzeHumans = AnalyzeHumans
            end

            if type(ShowPalsInBox) == "boolean" then
                ModActor.ShowPalsInBox = ShowPalsInBox
            end

            if type(ShowIVs) == "boolean" then
                ModActor.ShowIVs = ShowIVs
            end

            if type(FollowOffsetX) == "number" then
                ModActor.FollowOffsetX = FollowOffsetX
            end

            if type(FollowOffsetY) == "number" then
                ModActor.FollowOffsetY = FollowOffsetY
            end

            if type(StaticOffsetX) == "number" then
                ModActor.StaticOffsetX = StaticOffsetX
            end
            
            if type(StaticOffsetY) == "number" then
                ModActor.StaticOffsetY = StaticOffsetY
            end

            if type(AnalyzeDomestic) == "boolean" then
                ModActor.AnalyzeDomestic = AnalyzeDomestic
            end

            if type(IVsThreshold) == "number" then
                ModActor.IVsThreshold = IVsThreshold
            end

            if type(ShowIVBonus) == "boolean" then
                ModActor.ShowIVBonus = ShowIVBonus
            end
        end
    end
end)
