local PANEL = {}

function PANEL:Init()
    self.navbar = self:Add("AtlasUI.Navbar")
    self.navbar:Dock(BOTTOM)
    self.navbar:SetBody(self)
    self.navbar:AddTab("Summary", "AtlasUI.Summary")
    self.navbar:AddTab("Clone Skills", "Panel")
    self.navbar:AddTab("Event Character Skills", "Panel")
    self.navbar:SetActiveName("Summary")
end

function PANEL:PerformLayout(w, h)
    self.BaseClass.PerformLayout(self, w, h)
    
    self.navbar:SetTall(AtlasUI.UISizes.Navbar.Height)
end

vgui.Register("AtlasUI.Menu", PANEL, "AtlasUI.Frame")

local OpenFrame = function()
    local frame = vgui.Create("AtlasUI.Menu")
    frame:SetSize(1080, 720)
    frame:Center()
    frame:MakePopup()
    frame:SetTitle("Skill Machine")
end

concommand.Add("testing_frame", OpenFrame)