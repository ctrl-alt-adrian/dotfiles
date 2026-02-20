return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Disable inlay hints globally
      inlay_hints = {
        enabled = false,
      },

      -- Diagnostic configuration
      diagnostics = {
        virtual_lines = true,
        -- virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
          },
        },
      },

      -- LSP Server configurations
      servers = {
        -- Go (gopls)
        gopls = {
          filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = false,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
              },
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
                unreachable = true,
                modernize = true,
                stylecheck = true,
                appends = true,
                asmdecl = true,
                assign = true,
                atomic = true,
                bools = true,
                buildtag = true,
                cgocall = true,
                composite = true,
                contextcheck = true,
                deba = true,
                atomicalign = true,
                composites = true,
                copylocks = true,
                deepequalerrors = true,
                defers = true,
                deprecated = true,
                directive = true,
                embed = true,
                errorsas = true,
                fillreturns = true,
                framepointer = true,
                gofix = true,
                hostport = true,
                infertypeargs = true,
                lostcancel = true,
                httpresponse = true,
                ifaceassert = true,
                loopclosure = true,
                nilfunc = true,
                nonewvars = true,
                noresultvalues = true,
                printf = true,
                shadow = true,
                shift = true,
                sigchanyzer = true,
                simplifycompositelit = true,
                simplifyrange = true,
                simplifyslice = true,
                slog = true,
                sortslice = true,
                stdmethods = true,
                stdversion = true,
                stringintconv = true,
                structtag = true,
                testinggoroutine = true,
                tests = true,
                timeformat = true,
                unmarshal = true,
                unsafeptr = true,
                unusedfunc = true,
                unusedresult = true,
                waitgroup = true,
                yield = true,
                unusedvariable = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },

        -- Vue (vue-language-server)
        volar = {
          init_options = {
            vue = {
              hybridMode = false,
            },
            typescript = (function()
              local function get_typescript_sdk()
                local local_sdk = vim.fn.getcwd() .. "/node_modules/typescript/lib"
                if vim.fn.isdirectory(local_sdk) == 1 then
                  return local_sdk
                end
                local global_root = vim.fn.system("npm root -g"):gsub("\n", ""):gsub("\r", "")
                local global_sdk = global_root .. "/typescript/lib"
                if vim.fn.isdirectory(global_sdk) == 1 then
                  return global_sdk
                end
                return nil
              end
              local tsdk = get_typescript_sdk()
              return tsdk and { tsdk = tsdk } or nil
            end)(),
          },
        },

        -- TypeScript/JavaScript (typescript-language-server)
        ts_ls = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            -- Find the nearest tsconfig.json walking up from the file.
            -- In monorepos this roots at the subproject (e.g. apps/mobile/)
            -- rather than the repo root, so the right tsconfig is used.
            return util.root_pattern("tsconfig.json", "jsconfig.json")(fname)
              or util.root_pattern("package.json", ".git")(fname)
          end,

          settings = {
            typescript = {
              tsserver = {
                useSyntaxServer = false,
              },
            },
            javascript = {},
          },
        },

        -- Tailwind CSS
        tailwindcss = {
          filetypes = {
            -- html
            "astro",
            "astro-markdown",
            "blade",
            "clojure",
            "django-html",
            "htmldjango",
            "edge",
            "eelixir",
            "elixir",
            "ejs",
            "erb",
            "eruby",
            "gohtml",
            "gohtmltmpl",
            "haml",
            "handlebars",
            "hbs",
            "html",
            "htmlangular",
            "html-eex",
            "heex",
            "jade",
            "leaf",
            "liquid",
            "markdown",
            "mdx",
            "mustache",
            "njk",
            "nunjucks",
            "php",
            "razor",
            "slim",
            "twig",
            -- css
            "css",
            "less",
            "postcss",
            "sass",
            "scss",
            "stylus",
            "sugarss",
            -- js
            "javascript",
            "javascriptreact",
            "reason",
            "rescript",
            "typescript",
            "typescriptreact",
            -- mixed
            "vue",
            "svelte",
            "templ",
          },
          settings = {
            tailwindCSS = {
              emmetCompletions = true,
              validate = true,
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidScreen = "error",
                invalidVariant = "error",
                invalidConfigPath = "error",
                invalidTailwindDirective = "error",
                recommendedVariantOrder = "warning",
              },
              classAttributes = { "class", "className", "classList", "ngClass", ":class" },
              experimental = {
                classRegex = {
                  "tw`([^`]*)`",
                  "tw\\(([^)]*)\\)",
                  "@apply\\s+([^;]*)",
                  'class="([^"]*)"',
                  'className="([^"]*)"',
                  ':class="([^"]*)"',
                  "@class\\(([^)]*)\\)",
                },
              },
            },
          },
        },

        -- Lua (lua-language-server)
        lua_ls = {},

        -- Rust (rust-analyzer)
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
              diagnostics = {
                enable = true,
              },
            },
          },
        },

        -- HTML (vscode-html-language-server)
        html = {
          filetypes = {
            "html",
            "blade",
            "javascriptreact",
            "typescriptreact",
            "svelte",
          },
        },

        -- CSS/SCSS/LESS (vscode-css-language-server)
        -- Supports: .css, .scss, .sass, .less files
        cssls = {},
      },
    },
  },
  -- LSP autocmd configurations
  {
    "neovim/nvim-lspconfig",
    opts = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("CustomLspConfig", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          -- Disable inlay hints globally
          vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })

          -- Go semantic tokens workaround
          if client and client.name == "gopls" then
            if not client.server_capabilities.semanticTokensProvider then
              local semantic = client.config.capabilities.textDocument.semanticTokens
              if semantic then
                client.server_capabilities.semanticTokensProvider = {
                  full = true,
                  legend = {
                    tokenTypes = semantic.tokenTypes,
                    tokenModifiers = semantic.tokenModifiers,
                  },
                  range = true,
                }
              end
            end
          end
        end,
      })
    end,
  },
  -- Vue goto definition plugin
  {
    "catgoose/vue-goto-definition.nvim",
    event = "BufReadPre",
    opts = {
      filters = {
        auto_imports = true,
        auto_components = true,
        import_same_file = true,
        declaration = true,
        duplicate_filename = true,
      },
      filetypes = { "vue", "typescript" },
      detection = {
        nuxt = function()
          return vim.fn.glob(".nuxt/") ~= ""
        end,
        vue3 = function()
          return vim.fn.filereadable("vite.config.ts") == 1 or vim.fn.filereadable("src/App.vue") == 1
        end,
        priority = { "nuxt", "vue3" },
      },
      lsp = {
        override_definition = true,
      },
      debounce = 200,
    },
  },
}
