# AtlasUI.Breadcrumbs <client>Client</client>

The `AtlasUI.Breadcrumbs` is used to draw an animated texture on a panel.

## Parent

This panel doesn't derrive from anything.

## AtlasUI.Breadcrumbs :: SetBreadcrumbs

```lua
<AtlasUI.Breadcrumbs>:SetBreadcrumbs(tbl: table)
```

Will create individual breadcrumbs using the `<AtlasUI.AnimatedTexture>:CreateBreadcrumb(data: table, index: number)` internally.

## Arguments

1. tbl - The breadcrumbs, should each include a name and a onClick (optional) field.

---

## AtlasUI.Breadcrumbs :: CreateBreadcrumb <internal>INTERNAL</internal>

```lua
<AtlasUI.Breadcrumbs>:CreateBreadcrumb(data: table, index: number)
```

Will create a singular breadcrumb.

## Arguments

1. tbl - The breadcrumbs, should include a name and a onClick (optional) field.
1. index - The index of the breadcrumb.

---

## AtlasUI.Breadcrumbs :: CorrectColors <internal>INTERNAL</internal>

```lua
<AtlasUI.Breadcrumbs>:CorrectColors()
```

Will re-calculate the colors so that everything looks correct.

---

## AtlasUI.Breadcrumbs :: RemoveTo

```lua
<AtlasUI.Breadcrumbs>:RemoveTo(removeToName: string)
```

Will remove all of the breadcrumbs up until that point. Keep in mind that it invalidates the layout, aswell as calls the `<AtlasUI.Breadcrums>:CorrectColors()` method.

## Arguments

1. removeToName - the name of the breadcrumb that all breadcrumbs will be removed up to.