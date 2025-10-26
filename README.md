# Name-Colors-GMA3

A grandMA3 Lua plugin that reads **RGB** values from **Color Preset Pool (4)** and assigns the **nearest color name** from a selectable table (full HTML/CSS named colors or a basic set).

> **Tested scope:** This plugin has been **tested only with Universal Color presets** stored as RGB in Pool 4. Other feature modes (CMY/HSV/CT) or non-Universal presets may require adjustments to the extractor.

## Features
- Choose **first** and **last** preset (numbers only, without the `4.` prefix).
- Select color table: **HTML colors** (CSS named colors) or **Basic colors**.
- Finds the **nearest name** using linear sRGB distance.
- **Auto-labels** each non-empty preset: `Label Preset 4.X "Name"`.
- Read‑only access to preset content via `GetPresetData` (does not touch the Programmer).

## Requirements
- grandMA3 console or onPC with Lua and `GetPresetData` available.
- Color presets stored in **Color Preset Pool (4)** as **Universal** presets with RGB data.

## Installation

### Option A — Create a new plugin inside the showfile (no external files)
1. Open the **Plugin Pool** (Setup → Plugins or via Pools view).
2. **Edit** an empty plugin slot (tap-and-hold or right-click → *Edit*).
3. In the editor, create a new **Lua** component (e.g., *Add Component → Lua*).
4. **Paste** the Lua source code of `NameColors.lua` into the editor pane.
5. **Save** the plugin.
6. **Rename** the plugin to **“Name Colors”** (Edit the pool item → *Name*).

This stores the code inside the showfile; no file paths needed.

### Option B — Import `.lua` from USB / library (stored into showfile)
1. Put your `NameColors.lua` on a USB under `gma3_library/datapools/plugins/`.
2. In the **Plugin Pool**, **Edit** an empty slot and tap **Import**, choose the USB, and select `NameColors.lua`.
3. Save; the plugin code is now embedded in the showfile.

### Option C — Reference an external `.lua` (reloadable)
1. Place `NameColors.lua` in `gma3_library/datapools/plugins/` (internal drive or USB).
2. In the **Plugin Pool**, **Edit** the plugin and set **FileName** to `NameColors.lua`.
3. Use **ReloadAllPlugins** when you update the external file to apply changes.


## Usage
1. Run the **Name Colors** plugin.
2. In the dialog:
   - Enter **First Preset** and **Last Preset** (e.g., `1` and `50`). Do **not** include `4.`.
   - Choose **Color table**: *HTML colors* or *Basic colors*.
3. Click **Ok**. The plugin will iterate through the range, read RGB, print the nearest name, and label each non-empty preset.

## How it works (short)
- Gets the handle for each preset: `DataPool().PresetPools[4][i]`.
- Extracts a nested table with `GetPresetData(handle)`.
- Locates `ColorRGB_R/G/B` → `absolute` values (0..100), normalizes to 0..255.
- Computes nearest name using squared distance in **linear sRGB** to the selected table.

## Notes & Limitations
- **Tested only with Universal Color presets** in Pool 4, stored as RGB.
- If your fixtures/presets use **CMY/HSV/CT**, you may need to extend the extractor logic.
- If a preset is **empty** or lacks `ColorRGB_R/G/B`, it is reported and skipped.
- HTML named colors are descriptive; results may not match your show’s exact naming conventions.

## Customization
- Edit the **Basic** table for a compact, predictable palette.
- (Optional) Add a **threshold** to avoid labeling when the best match is too far.
- (Optional) Add a mode selector for **print-only** vs **rename**.

## Contributing
1. Fork the repository.
2. Create a branch: `feat/your-improvement`.
3. Open a Pull Request with a concise description.

## License
Recommended: **MIT** (add a `LICENSE` file if desired).
