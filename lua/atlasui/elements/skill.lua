local PANEL = {}

function PANEL:Init()
    self.progressBar = self:Add("Panel")
    self.progressBar:Dock(TOP)
    self.progressBar.Paint = function(pnl, w, h)
        local aX, aY = self.progressBar:LocalToScreen()

        draw.RoundedBox(0, 0, 0, w, h, AtlasUI.Theme.HeaderPrimary)
        draw.RoundedBox(0, 5, 5, w-(5*2), h-(5*2), AtlasUI.Theme.HeaderText)
        AtlasUI:Mask(
            function()
                AtlasUI:DrawRoundedBox(10, 5, 5, w/3-(5*2), h-(5*2), AtlasUI.Theme.HeaderText)
            end,
            function()
                draw.SimpleLinearGradient(aX, aY, w, h, Color(0, 242, 96), Color(5, 117, 230), true)
            end
        )
    end
    self.progressBar:SetTall(50)
end

vgui.Register("AtlasUI.SkillPanel", PANEL)