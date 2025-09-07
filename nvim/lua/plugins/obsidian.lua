return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function.
      -- Functions are called with obsidian.TemplateContext objects as their sole parameter.
      -- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#substitutions
      substitutions = {},

      -- A map for configuring unique directories and paths for specific templates
      --- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#customizations
      customizations = {},
    },
  },
  keys = {
    { "<leader>o", "", desc = "+obsidian", mode = "n" },
    { "<leader>o ", "<cmd>Obsidian<cr>", desc = "Obsidian picker", mode = "n" },
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
    { "<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "Follow link under cursor", mode = "n" },
    { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste image from clipboard under cursor", mode = "n" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
    { "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Switch to another workspace", mode = "n" },
    { "<leader>oc", "<cmd>ObsidianCheck<cr>", desc = "Check Obsidian notes", mode = "n" },
    { "<leader>od", "", desc = "+dailies", mode = "n" },
    { "<leader>odd", "<cmd>ObsidianDailies<cr>", desc = "Daily Obsidian notes", mode = "n" },
    { "<leader>odt", "<cmd>ObsidianToday<cr>", desc = "Todays Obsidian note", mode = "n" },
    { "<leader>odp", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday's Obsidian note", mode = "n" },
    { "<leader>odn", "<cmd>ObsidianTomorrow<cr>", desc = "Tomorrow's Obsidian note", mode = "n" },
    { "<leader>os", "", desc = "+search", mode = "n" },
    { "<leader>oss", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
    { "<leader>ost", "<cmd>ObsidianTags<cr>", desc = "Search Obsidian tags", mode = "n" },
    { "<leader>osr", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
    { "<leader>osl", "<cmd>ObsidianLinks<cr>", desc = "Show links", mode = "n" },
    { "<leader>ot", "", desc = "+template", mode = "n" },
    { "<leader>otn", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New Obsidian note from template", mode = "n" },
    { "<leader>oti", "<cmd>ObsidianTemplate<cr>", desc = "Insert template", mode = "n" },
  },
}
