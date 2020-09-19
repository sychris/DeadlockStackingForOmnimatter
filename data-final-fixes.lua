if mods["omnimatter_science"] then
    print("Fixing some omnimatter science recipes")
    local omnimatter_recipes_to_fix = {
        "chemical-science-pack",
        "production-science-pack",
        "utility-science-pack",
    }
    for _, recipe in ipairs(omnimatter_recipes_to_fix) do
        recipe = data.raw.recipe[recipe]
        if recipe.normal then
            recipe.normal.energy_required = recipe.energy_required
        end
        if recipe.expensive then
            recipe.expensive.energy_required = recipe.energy_required
        end
    end
end
