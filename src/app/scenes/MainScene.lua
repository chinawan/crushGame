
local RuleLayer=require("app.scenes.RuleLayer")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    local background = display.newSprite("GameBackground.png",display.cx,display.cy):addTo(self)
    local particle = cc.ParticleSystemQuad:create("gameBack.plist"):addTo(self)
    
    local ruleLayer=RuleLayer.new():addTo(self)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
