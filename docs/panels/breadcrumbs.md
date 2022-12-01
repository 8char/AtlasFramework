# AtlasUI.Breadcrumbs <client>Client</client>

The `AtlasUI.Breadcrumbs` is used to draw an animated texture on a panel.

## Parent

This panel doesn't derrive from anything.

# Methods
All write operations to build the object is available here.

```lua
<AtlasUI.Breadcrumbs>:SetBreadcrumbs(tbl: table)
```

Will create individual breadcrumbs using the `<AtlasUI.AnimatedTexture>:CreateBreadcrumb(data: table, index: number)` internally.

## Arguments

1. tbl - The breadcrumbs, should each include a name and a onClick (optional) field.

---

```lua
<AtlasUI.Breadcrumbs>:CreateBreadcrumb(data: table, index: number)
```

<internal>INTERNAL</internal>
Will create a singular breadcrumb.

## Arguments

1. tbl - The breadcrumbs, should include a name and a onClick (optional) field.
1. index - The index of the breadcrumb.

---

```lua
<AtlasUI.Breadcrumbs>:CorrectColors()
```

<internal>INTERNAL</internal>
Will re-calculate the colors so that everything looks correct.

---

```lua
<AtlasUI.Breadcrumbs>:RemoveTo(removeToName: string)
```

Will remove all of the breadcrumbs up until that point. Keep in mind that it invalidates the layout, aswell as calls the `<AtlasUI.Breadcrums>:CorrectColors()` method.

## Arguments

1. removeToName - the name of the breadcrumb that all breadcrumbs will be removed up to.