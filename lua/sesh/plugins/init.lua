return {
  'nvim-lua/plenary.nvim',
  'JoseConseco/telescope_sessions_picker.nvim',
  'toml-lang/toml',
  'cespare/vim-toml',
  'scrooloose/nerdcommenter',
  'airblade/vim-rooter',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'APZelos/blamer.nvim',
  'junegunn/gv.vim',
  'michaeljsmith/vim-indent-object',
  'majutsushi/tagbar',
  'dkarter/bullets.vim',
  'crusoexia/vim-monokai',
  'psliwka/vim-smoothie',
  'qpkorr/vim-bufkill',
  -- autocompletion framework
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'nvim-lua/popup.nvim',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'rrethy/vim-illuminate',

  -- navigation
  'phaazon/hop.nvim',
  {
    'nvim-telescope/telescope.nvim', 
    branch = '0.1.x',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      { 
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    }
  },
  { 
    'nvim-telescope/telescope-fzf-native.nvim', 
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' 
  },
}


