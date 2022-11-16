local PANEL = {}

AccessorFunc(PANEL, "m_body", "Body")

AtlasUI:CreateFont("NavbarButton", 20)

function PANEL:Init()
    -- self.active == as the active tab

    self.buttons = {}
    self.panels = {}
end

function PANEL:AddTab(name, panel)
    local i = table.Count(self.buttons) + 1
    if i ~= 1 then
        local divider = self:Add("Panel")
        divider:SetWide(128)
        divider:Dock(LEFT)
        divider.Paint = function(pnl, w, h)
            AtlasUI:DrawRoundedBox(0, 0, h/2, w, 1, AtlasUI.Theme.NavbarUnselected)
        end
    end
    self.buttons[i] = self:Add("DButton")
    local btn = self.buttons[i]
    btn.id = i
    btn:SetText(name)
    btn:SetFont("AtlasUI.NavbarButton")
    btn.Paint = function(pnl, w, h)
        if (self.active == pnl.id) then
            local barW = Lerp(math.ease.InCubic( (CurTime() - btn.activeTime) * 5), 0, w)
            AtlasUI:DrawRoundedBox(0, w/2-barW/2, h-2, barW, 2, AtlasUI.Theme.NavbarHighlighted)
        end
    end
    btn:Dock(LEFT)
    btn:SizeToContentsX(32)
    btn:SetTextColor(AtlasUI.Theme.NavbarUnselected)
    btn.DoClick = function(pnl)
        self:SetActive(pnl.id)
    end

    self.panels[i]  = self:GetBody():Add(panel or "DPanel")
    local panel = self.panels[i]
    panel:Dock(FILL)
    panel:SetVisible(false)
end

function PANEL:SetActive(id)
    local btn = self.buttons[id]
    if not IsValid(btn) then return end
    if self.active == id then return end

    btn.activeTime = CurTime()

    local activeBtn = self.buttons[self.active]
    if IsValid(activeBtn) then
        activeBtn:SetTextColor(AtlasUI.Theme.NavbarUnselected)

        local activePnl = self.panels[self.active]
        if IsValid(activePnl) then
            activePnl:SetVisible(false)
        end
    end

    self.active = id

    btn:SetTextColor(AtlasUI.Theme.NavbarHighlighted)
    local panel = self.panels[id]
    panel:SetVisible(true)
end

function PANEL:SetActiveName(name)
    for k, btn in pairs(self.buttons) do
        if btn:GetText() == name then
            self:SetActive(btn.id)

            break
        end
    end
end

function PANEL:PerformLayout(w, h)
    local totalWidth = 0
    for k, v in ipairs(self.buttons) do
        totalWidth = totalWidth + v:GetWide()
    end
    totalWidth = totalWidth + (#self.buttons - 1) * AtlasUI.UISizes.Navbar.DividerWidth
    self.buttons[1]:DockMargin(( self:GetWide() - totalWidth ) / 2, 0, 0, 0)
end

function PANEL:Paint(w, h)
    AtlasUI:DrawRoundedBoxEx(AtlasUI.UISizes.Roundness, 0, 0, w, h, AtlasUI.Theme.NavbarBackground, false, false, true, true)
end

vgui.Register("AtlasUI.Navbar", PANEL)