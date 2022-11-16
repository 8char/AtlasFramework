local PANEL = {}

local matCloseBtn = Material("xenin/closebutton.png")

AtlasUI:CreateFont("Header", 20)

function PANEL:Init()
    self.timeOpened = CurTime()
    self.header = self:Add("Panel")
    self.header:Dock(TOP)
    self.header.Paint = function(pnl, w, h)
        AtlasUI:DrawRoundedBoxEx(AtlasUI.UISizes.Roundness, 0, 0, w, h, AtlasUI.Theme.HeaderPrimary, true, true, false, false)
    end

    self.header.closeBtn = self.header:Add("Button")
    self.header.closeBtn:Dock(RIGHT)
    self.header.closeBtn:SetText("")
    self.header.closeBtn.DoClick = function(pnl)
        self:Remove()
    end

    self.header.closeBtn.Paint = function(pnl, w, h)
        local margin = AtlasUI.UISizes.Header.Margin
        
        surface.SetDrawColor(AtlasUI.Theme.CloseButton)
        surface.SetMaterial(matCloseBtn)
        surface.DrawTexturedRect(margin, margin, w - (margin * 2), h - (margin * 2))
    end

    self.header.title = self.header:Add("DLabel")
    self.header.title:Dock(LEFT)
    self.header.title:SetFont("AtlasUI.Header")
    self.header.title:SetTextColor(AtlasUI.Theme.HeaderText)
    self.header.title:SetText("AtlasUI - Frame")
    self.header.title:SetTextInset(AtlasUI.UISizes.Header.Margin, 0)
    self.header.title:SizeToContents()
end

function PANEL:SetTitle(text)
    self.header.title:SetText(text)
    self.header.title:SizeToContents()
end

function PANEL:PerformLayout()
    self.header:SetTall(AtlasUI.UISizes.Navbar.Height)
    self.header.closeBtn:SetWide(self.header.closeBtn:GetTall())
end

function PANEL:Paint(w, h)
    AtlasUI:DrawRoundedBox(AtlasUI.UISizes.Roundness, 0, 0, w, h, AtlasUI.Theme.BackgroundPrimary)
end

vgui.Register("AtlasUI.Frame", PANEL, "EditablePanel")