local PANEL = {}

function PANEL:Init()
    self.summary = self:Add("Panel")
    self.summary:Dock(FILL)
    self.summary:DockMargin(10, 10, 10, 10)
    self.summary.Paint = function(pnl, w, h)
        AtlasUI:DrawRoundedBox(10, 0, 0, w, h, AtlasUI.Theme.BackgroundSecondary)
    end

    self.summary.level = self.summary:Add("Panel")
    self.summary.level.openTime = CurTime()
    local level = self.summary.level
    level:SetSize(200, 200)
    level.Paint = function(pnl, w, h)
        AtlasUI:MaskInverse(function()
            AtlasUI:DrawArc(w / 2, h / 2, 0, 360, h / 2 - 30, Color(255, 255, 255), 45)
        end, function()
            AtlasUI:DrawArc(w / 2, h / 2, 0, 360, h / 2 - 20, Color(24, 24, 24), 45)
        end)
        local frac = ( CurTime() - level.openTime ) / 10
        AtlasUI:MaskInverse(function()
            AtlasUI:DrawArc(w / 2, h / 2, 0, Lerp(math.ease.InCubic(frac), 0, 360), h / 2 - 30, Color(255, 255, 255), 45)
        end, function()
            AtlasUI:DrawArc(w / 2, h / 2, 0, Lerp(math.ease.InCubic(frac), 0, 360), h / 2 - 20, Color(255, 255, 255), 45)
        end)

    end
end

vgui.Register("AtlasUI.Summary", PANEL)