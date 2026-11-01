#!/bin/bash
# Сборка textures.js из установленного Create и ванильного клиента
set -e
INST="/g/tlauncher/versions/All of Create Aeronautics All of Create - Aeronauti"
CJ="$INST/mods/create-1.21.1-6.0.10.jar"
MJ="$INST/All of Create Aeronautics All of Create - Aeronauti.jar"
OUT="$PWD/textures.js"
TMP="$PWD/.tex_tmp"
rm -rf "$TMP"; mkdir -p "$TMP"
echo '/* Текстуры из Create 6.0.10 и Minecraft 1.21.1 (автосборка) */' > "$OUT"
echo 'window.TEXDATA={' >> "$OUT"

count=0; miss=0
emit(){ # $1=id $2=jar $3=path
  local id="$1" jar="$2" path="$3"
  if unzip -p "$jar" "$path" > "$TMP/t.png" 2>/dev/null && [ -s "$TMP/t.png" ]; then
    local b64=$(base64 -w0 "$TMP/t.png")
    printf '  %s:"data:image/png;base64,%s",\n' "$id" "$b64" >> "$OUT"
    count=$((count+1))
  else
    echo "  MISSING: $id <- $path" >&2
    miss=$((miss+1))
  fi
}
C="create"; V="vanilla"
# --- блоки (Create) ---
emit belt            "$CJ" assets/create/textures/block/belt.png
emit funnel          "$CJ" assets/create/textures/block/funnel_closed.png
emit chute           "$CJ" assets/create/textures/block/chute.png
emit smart_chute     "$CJ" assets/create/textures/block/chute_smart.png
emit splitter        "$CJ" assets/create/textures/item/filter.png
emit ejector         "$CJ" assets/create/textures/block/weighted_ejector_top.png
emit shaft           "$CJ" assets/create/textures/block/gantry_shaft.png
emit cog             "$CJ" assets/create/textures/block/cogwheel.png
emit large_cog       "$CJ" assets/create/textures/block/large_cogwheel.png
emit gearbox         "$CJ" assets/create/textures/block/gearbox.png
emit crusher         "$CJ" assets/create/textures/block/crushing_wheel_insert.png
emit press           "$CJ" assets/create/textures/block/mechanical_press_top.png
emit mixer           "$CJ" assets/create/textures/block/mixer_base_side.png
emit millstone       "$CJ" assets/create/textures/block/millstone.png
emit crafter         "$CJ" assets/create/textures/block/crafter_side.png
emit saw             "$CJ" assets/create/textures/block/mechanical_saw_top.png
emit drill           "$CJ" assets/create/textures/block/mechanical_drill_top.png
emit deployer        "$CJ" assets/create/textures/block/deployer.png
emit fan             "$CJ" assets/create/textures/block/fan_side.png
emit fluid_pipe      "$CJ" assets/create/textures/block/pipes.png
emit fluid_pump      "$CJ" assets/create/textures/block/pump.png
emit fluid_tank      "$CJ" assets/create/textures/block/fluid_tank.png
emit spout           "$CJ" assets/create/textures/block/spout.png
emit steam_engine    "$CJ" assets/create/textures/block/engine.png
emit water_wheel     "$CJ" assets/create/textures/block/waterwheel_metal.png
emit creative_motor  "$CJ" assets/create/textures/block/creative_motor.png
emit electric_motor  "$CJ" assets/create/textures/block/creative_motor.png
# --- блоки (ванильные) ---
emit chest           "$MJ" assets/minecraft/textures/block/crafting_table_front.png
emit sink            "$MJ" assets/minecraft/textures/block/cauldron_side.png
emit void_box        "$MJ" assets/minecraft/textures/block/obsidian.png
# --- предметы (Create) ---
emit copper_ingot    "$CJ" assets/create/textures/item/copper_ingot.png
emit zinc_ingot      "$CJ" assets/create/textures/item/zinc_ingot.png
emit brass_ingot     "$CJ" assets/create/textures/item/brass_ingot.png
emit andesite_alloy  "$CJ" assets/create/textures/item/andesite_alloy.png
emit iron_sheet      "$CJ" assets/create/textures/item/iron_sheet.png
emit copper_sheet    "$CJ" assets/create/textures/item/copper_sheet.png
emit gold_sheet      "$CJ" assets/create/textures/item/golden_sheet.png
emit brass_sheet     "$CJ" assets/create/textures/item/brass_sheet.png
emit sturdy_sheet    "$CJ" assets/create/textures/item/sturdy_sheet.png
emit shaft_it        "$CJ" assets/create/textures/block/gantry_shaft.png
emit cogwheel        "$CJ" assets/create/textures/block/cogwheel.png
emit large_cogwheel  "$CJ" assets/create/textures/block/large_cogwheel.png
emit electron_tube   "$CJ" assets/create/textures/item/electron_tube.png
emit precision_mechanism "$CJ" assets/create/textures/item/precision_mechanism.png
emit rose_quartz     "$CJ" assets/create/textures/item/rose_quartz.png
emit polished_rose_quartz "$CJ" assets/create/textures/item/polished_rose_quartz.png
emit flour           "$CJ" assets/create/textures/item/wheat_flour.png
emit dough           "$CJ" assets/create/textures/item/dough.png
emit honeyed_apple   "$CJ" assets/create/textures/item/honeyed_apple.png
emit chocolate_bar   "$CJ" assets/create/textures/item/bar_of_chocolate.png
# --- предметы (ванильные) ---
emit iron_ingot      "$MJ" assets/minecraft/textures/item/iron_ingot.png
emit gold_ingot      "$MJ" assets/minecraft/textures/item/gold_ingot.png
emit iron_nugget     "$MJ" assets/minecraft/textures/item/iron_nugget.png
emit gold_nugget     "$MJ" assets/minecraft/textures/item/gold_nugget.png
emit redstone        "$MJ" assets/minecraft/textures/item/redstone.png
emit quartz          "$MJ" assets/minecraft/textures/item/quartz.png
emit bone_meal       "$MJ" assets/minecraft/textures/item/bone_meal.png
emit apple           "$MJ" assets/minecraft/textures/item/apple.png
emit wheat           "$MJ" assets/minecraft/textures/item/wheat.png
emit bread           "$MJ" assets/minecraft/textures/item/bread.png
emit potato          "$MJ" assets/minecraft/textures/item/potato.png
emit baked_potato    "$MJ" assets/minecraft/textures/item/baked_potato.png
emit raw_porkchop    "$MJ" assets/minecraft/textures/item/porkchop.png
emit cooked_porkchop "$MJ" assets/minecraft/textures/item/cooked_porkchop.png
emit raw_beef        "$MJ" assets/minecraft/textures/item/beef.png
emit cooked_beef     "$MJ" assets/minecraft/textures/item/cooked_beef.png
emit raw_iron        "$MJ" assets/minecraft/textures/item/raw_iron.png
emit raw_copper      "$MJ" assets/minecraft/textures/item/raw_copper.png
emit raw_gold        "$MJ" assets/minecraft/textures/item/raw_gold.png
emit cobblestone     "$MJ" assets/minecraft/textures/block/cobblestone.png
emit gravel          "$MJ" assets/minecraft/textures/block/gravel.png
emit sand            "$MJ" assets/minecraft/textures/block/sand.png
emit soul_sand       "$MJ" assets/minecraft/textures/block/soul_sand.png
emit andesite        "$MJ" assets/minecraft/textures/block/andesite.png
emit oak_log         "$MJ" assets/minecraft/textures/block/oak_log.png
emit oak_planks      "$MJ" assets/minecraft/textures/block/oak_planks.png
emit stripped_log    "$MJ" assets/minecraft/textures/block/stripped_oak_log.png
echo '};' >> "$OUT"
rm -rf "$TMP"
echo "Готово: $count текстур, пропущено: $miss, размер: $(wc -c < "$OUT") байт"
