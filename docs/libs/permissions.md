# Permissions <shared>Shared</shared>

How works `AtlasUI.Permissions` object.

## AtlasUI.Permissions :: canAccessFramework

```lua
AtlasUI.Permissions:canAccessFramework(ply: Player)
```

**Arguments**

1. ply - Player to check if he can access the framework.

---

## AtlasUI.Permissions :: isAdmin

```lua
AtlasUI.Permissions:isAdmin(ply: Player, level = 1)
```
**Arguments**

1. Player to check if he is admin.
2. **Optional** Level

---

## AtlasUI.Permissions :: isSuperAdmin

```lua
AtlasUI.Permissions:isSuperAdmin(ply: Player)
```

**Arguments**

1. ply - Player to check if he is superadmin.

---

## AtlasUI.Permissions :: isAtlasDeveloper

```lua
AtlasUI.Permissions:isAtlasDeveloper(ply: Player)
```
**Arguments**

1. ply - Player to check if he is a Atlas Developer.

# atlas_easy_permissions <convar>CONVAR</convar>

```lua
-- Default
"atlas_easy_permissions": 1
```

If enabled, developers can access the framework.
