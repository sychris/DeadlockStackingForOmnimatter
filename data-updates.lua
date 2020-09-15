if not settings.startup["deadlock-enable-beltboxes"] or
    not settings.startup["deadlock-enable-beltboxes"].value then return end

local mods = {
    ["__omnimatter__"] = require("prototypes.omnimatter"),
    ["__omnimatter_crystal__"] = require("prototypes.omnimatter_crystal")
}

for _, mod_stackables in pairs(mods) do
    for _, item in pairs(mod_stackables.items) do
        local stacked_name = "deadlock-stack-" .. item["item-name"]

        if (not data.raw.item[stacked_name] == nil) then
            print("DeadlockStacking for Omnimater: " ..
                      "removing previously stacked item: " .. item["item-name"])
            deadlock.destroy_stack(item["item-name"])
        end

        -- item_name, graphic_path, target_tech, icon_size, item_type, mipmap_levels
        deadlock.add_stack(item["item-name"], item["icon"], item["unlock-tier"],
                           item["icon-size"])

        for _, icon_addition in ipairs(item["icon-additions"]) do
            table.insert(data.raw.item[stacked_name].icons, icon_addition)
        end
    end
end
