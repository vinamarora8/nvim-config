local actions = require("telescope.actions")
require('telescope').setup{
    defaults = {
        color_devicons = false,
        layout_config = {
            width = 0.7,
            horizontal = {
                preview_width = 0.6
            }
        },
        mappings = { 
            i = { 
                ["<esc>"] = actions.close,  -- Single escape exit
            }, 
        }, 
    },
    pickers = {
        buffers = {
            -- ignore_current_buffer = true,
            sort_lastused = true,
        },
  },
}
