# Include<> Processor for Luau
A free and open-source Roblox plugin that handles recursive `--#include <Header>` statements in scripts, automatically expanding headers while skipping strings (`[[...]]`, `"..."`, `'...'`) to avoid processing includes inside literals. Built by Yarik_superpro with a focus on modular development, performance, and developer convenience.

(Free) Get Include<> Processor on Roblox Marketplace: https://create.roblox.com/store/asset/132458406454669/Include

<img src="logo.png" alt="Include<> Processor logo" width="500" height="500">

**Features:**
- Recursive header expansion 🔄
- Auto-completion support 📝
- Script analysis / linting 🕵️‍♂️
- Custom headers 🗂️
- Configurable keybinds ⌨️⚡
- Lightweight UI for configuration 🖥️

**Example usage:**
```luau
--#include <stdio.lua>
local function Sample()
    warn("uh oh")
end
--\include
```
Devforum Post: https://devforum.roblox.com/t/free-include-processor-for-luau-recursive-header-expansion-for-roblox-scripts/386XXXX
