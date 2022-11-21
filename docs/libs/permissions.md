# Permissions <shared>Shared</shared>

How works `AtlasUI.Permissions` object.

# Methods

```lua
AtlasUI.Permissions:canAccessLibrary(ply: Player)
```

## Arguments

1. ply - Player to check if he can access the library.

---

```lua
AtlasUI.Permissions:isAdmin(ply: Player, level = 1)
```
## Arguments

1. Player to check if he is admin.
2. **Optional** Level

---

```lua
AtlasUI.Permissions:isSuperAdmin(ply: Player)
```

## Arguments

1. ply - Player to check if he is superadmin.

---

```lua
AtlasUI.Permissions:isAtlasDeveloper(ply: Player)
```
## Arguments

1. ply - Player to check if he is a Atlas Developer.

# ConVars

## atlas_easy_permissions

```lua
-- Default
"atlas_easy_permissions": 1
```

If enabled, developers can access the library.
