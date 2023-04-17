local M = {}
local opts = {silent = true, noremap = true}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debug sidebar"
    }
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require('crates').upgrade_all_crates()
      end,
      "Update crates"
    }
  }
}

M.trouble = {
  n = {
    ["<leader>cx"] = {
      "<cmd> TroubleToggle <CR>",
      "Trouble Toggle",
      opts = opts
    },
    ["<leader>cw"] = {
      "<cmd> TroubleToggle workspace_diagnostics <CR>",
      "Trouble Workspace Diagnostics",
      opts = opts
    },
    ["<leader>cd"] = {
      "<cmd> TroubleToggle document_diagnostics <CR>",
      "Trouble Document Diagnostics",
      opts = opts
    },
    ["<leader>cl"] = {
      "<cmd> TroubleToggle loclist <CR>",
      "Trouble Local List",
      opts = opts
    },
    ["<leader>cq"] = {
      "<cmd> TroubleToggle quickfix <CR>",
      "Trouble QuickFix",
      opts = opts
    },
    ["<leader>cgR"] = {
      "<cmd> TroubleToggle lsp_references <CR>",
      "Trouble LSP References",
      opts = opts
    },
    ["[q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true})
        else
          vim.cmd.cprev()
        end
      end,
      "Previous trouble/quickfix item"
    },
    ["]q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true})
        else
          vim.cmd.cnext()
        end
      end,
      "Next trouble/quickfix item"
    }

  }
}

M.spectre = {
  n = {
    ["<leader>sr"] = {
      function()
        require("spectre").open()
      end,
      "Replace in files (Spectre)"
    }
  }
}

M.undotree = {
  n = {
    ["<leader>u"] = {
      "<cmd> UndotreeToggle <CR>",
      "Undotree Toggle"
    }
  }
}

return M
