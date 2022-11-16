AtlasLibrary.ImgurMaterials = {}

local errorMat = Material("debug/debugempty")

file.CreateDir("atlaslibrary_materials")

function AtlasLibrary:GetImgurMaterial(id, callbackFunction)
    if AtlasLibrary.ImgurMaterials[id] then
        return callbackFunction(AtlasLibrary.ImgurMaterials[id])
    end

    if file.Exists("atlaslibrary_materials/" .. id .. ".png", "DATA") then
        AtlasLibrary.ImgurMaterials[id] = Material("../data/atlaslibrary_materials/" .. id .. ".png", "noclamp smooth mips")
        return callbackFunction(AtlasLibrary.ImgurMaterials[id])
    end

    http.Fetch("https://i.imgur.com/" .. id .. ".png",
        function(body, length)
            file.Write("atlaslibrary_materials/" .. id .. ".png", body)
            AtlasLibrary.ImgurMaterials[id] = Material("../data/atlaslibrary_materials/" .. id .. ".png", "noclamp smooth mips")

            return callbackFunction(AtlasLibrary.ImgurMaterials[id])
        end,
        function(error)
            return AtlasLibrary:GetImgurMaterial(id, callbackFunction)
        end
    )
end

function AtlasLibrary:DrawImgur(x, y, w, h, id)
    if not AtlasLibrary.ImgurMaterials[id] then
        AtlasLibrary:GetImgurMaterial(id, function(mat)
            AtlasLibrary.ImgurMaterials[id] = mat
        end)

        return
    end

    surface.SetMaterial(AtlasLibrary.ImgurMaterials[id])
    surface.DrawTexturedRect(x, y, w, h)
end

function AtlasLibrary:DrawImgurRotated(x, y, w, h, angle, id)
    if not AtlasLibrary.ImgurMaterials[id] then
        AtlasLibrary:GetImgurMaterial(id, function(mat)
            AtlasLibrary.ImgurMaterials[id] = mat
        end)

        return
    end

    surface.SetMaterial(AtlasLibrary.ImgurMaterials[id])
    surface.DrawTexturedRectRotated(x, y, w, h, angle)
end