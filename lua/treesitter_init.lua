vim.cmd [[

packadd nvim-treesitter
packadd nvim-treesitter-textobjects

TSUpdate

]]

require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["al"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["il"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ad"] = "@conditional.outer",
        ["id"] = "@conditional.inner",
        ["ao"] = "@loop.outer",
        ["io"] = "@loop.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@call.outer",
        ["if"] = "@call.inner",
        ["ac"] = "@comment.outer",
        ["ar"] = "@frame.outer",
        ["ir"] = "@frame.inner",
        ["at"] = "@attribute.outer",
        ["it"] = "@attribute.inner",
        ["ae"] = "@scopename.inner",
        ["ie"] = "@scopename.inner",
        ["as"] = "@statement.outer",
        ["is"] = "@statement.outer",
        ["ag"] = "@assignment.outer",
        ["ig"] = "@assignment.inner",
        ["in"] = "@number.inner",
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = treesitter_selection_mode,
      -- if you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = false,
    },
    swap = {
      enable = true,
      swap_next = {
        [")m"] = "@function.outer",
        [")c"] = "@comment.outer",
        [")a"] = "@parameter.inner",
        [")b"] = "@block.outer",
        [")C"] = "@class.outer",
      },
      swap_previous = {
        ["(m"] = "@function.outer",
        ["(c"] = "@comment.outer",
        ["(a"] = "@parameter.inner",
        ["(b"] = "@block.outer",
        ["(C"] = "@class.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]f"] = "@call.outer",
        ["]d"] = "@conditional.outer",
        ["]o"] = "@loop.outer",
        ["]s"] = "@statement.outer",
        ["]a"] = "@parameter.outer",
        ["]c"] = "@comment.outer",
        ["]b"] = "@block.outer",
        ["]l"] = { query = "@class.outer", desc = "next class start" },
        ["]r"] = "@frame.outer",
        ["]t"] = "@attribute.outer",
        ["]e"] = "@scopename.outer",
        ["]g"] = "@assignment.outer",
        ["]n"] = "@number.inner",
        ["]]m"] = "@function.inner",
        ["]]f"] = "@call.inner",
        ["]]d"] = "@conditional.inner",
        ["]]o"] = "@loop.inner",
        ["]]a"] = "@parameter.inner",
        ["]]b"] = "@block.inner",
        ["]]l"] = { query = "@class.inner", desc = "next class start" },
        ["]]r"] = "@frame.inner",
        ["]]t"] = "@attribute.inner",
        ["]]e"] = "@scopename.inner",
        ["]]g"] = "@assignment.inner",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]F"] = "@call.outer",
        ["]D"] = "@conditional.outer",
        ["]O"] = "@loop.outer",
        ["]S"] = "@statement.outer",
        ["]A"] = "@parameter.outer",
        ["]C"] = "@comment.outer",
        ["]B"] = "@block.outer",
        ["]L"] = "@class.outer",
        ["]R"] = "@frame.outer",
        ["]T"] = "@attribute.outer",
        ["]E"] = "@scopename.outer",
        ["]G"] = "@assignment.outer",
        ["]N"] = "@number.inner",
        ["]]M"] = "@function.inner",
        ["]]F"] = "@call.inner",
        ["]]D"] = "@conditional.inner",
        ["]]O"] = "@loop.inner",
        ["]]A"] = "@parameter.inner",
        ["]]B"] = "@block.inner",
        ["]]L"] = "@class.inner",
        ["]]R"] = "@frame.inner",
        ["]]T"] = "@attribute.inner",
        ["]]E"] = "@scopename.inner",
        ["]]G"] = "@assignment.inner",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[f"] = "@call.outer",
        ["[d"] = "@conditional.outer",
        ["[o"] = "@loop.outer",
        ["[s"] = "@statement.outer",
        ["[a"] = "@parameter.outer",
        ["[c"] = "@comment.outer",
        ["[b"] = "@block.outer",
        ["[l"] = "@class.outer",
        ["[r"] = "@frame.outer",
        ["[t"] = "@attribute.outer",
        ["[e"] = "@scopename.outer",
        ["[g"] = "@assignment.outer",
        ["[n"] = "@number.inner",
        ["[[m"] = "@function.inner",
        ["[[f"] = "@call.inner",
        ["[[d"] = "@conditional.inner",
        ["[[o"] = "@loop.inner",
        ["[[a"] = "@parameter.inner",
        ["[[b"] = "@block.inner",
        ["[[l"] = "@class.inner",
        ["[[r"] = "@frame.inner",
        ["[[t"] = "@attribute.inner",
        ["[[e"] = "@scopename.inner",
        ["[[g"] = "@assignment.inner",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[F"] = "@call.outer",
        ["[D"] = "@conditional.outer",
        ["[O"] = "@loop.outer",
        ["[S"] = "@statement.outer",
        ["[A"] = "@parameter.outer",
        ["[C"] = "@comment.outer",
        ["[B"] = "@block.outer",
        ["[L"] = "@class.outer",
        ["[R"] = "@frame.outer",
        ["[T"] = "@attribute.outer",
        ["[E"] = "@scopename.outer",
        ["[G"] = "@assignment.outer",
        ["[N"] = "@number.inner",
        ["[[M"] = "@function.inner",
        ["[[F"] = "@call.inner",
        ["[[D"] = "@conditional.inner",
        ["[[O"] = "@loop.inner",
        ["[[A"] = "@parameter.inner",
        ["[[B"] = "@block.inner",
        ["[[L"] = "@class.inner",
        ["[[R"] = "@frame.inner",
        ["[[T"] = "@attribute.inner",
        ["[[E"] = "@scopename.inner",
        ["[[G"] = "@assignment.inner",
      },
    },
  },
}
