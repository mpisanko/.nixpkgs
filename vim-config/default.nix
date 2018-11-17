{ pkgs }:

let
my_plugins = import ./plugins.nix { inherit (pkgs) vimUtils fetchFromGitHub; };

in with pkgs; neovim.override {
  vimAlias = true;
  configure = {
    customRC = ''
      syntax on
      filetype on
      set expandtab
      set tabstop=2
      set softtabstop=0
      set shiftwidth=2
      set smarttab
      set autoindent
      set smartindent
      set smartcase
      set ignorecase
      set modeline
      set nocompatible
      set encoding=utf-8
      set incsearch
      set hlsearch
      set history=700
      set number
      set laststatus=2
      set signcolumn=yes

      set termguicolors
      set background=dark
      colorscheme molokai
      let g:airline_theme = 'molokai'

      set grepprg=rg\ --
      nnoremap <silent> F :Rg<CR>

      let g:ctrlp_user_command = 'rg --files %s'
      let g:ctrlp_use_caching = 0

      let g:deoplete#enable_at_startup = 1

      " Error and warning signs.
      let g:ale_sign_error = '⤫'
      let g:ale_sign_warning = '⚠'

      " Enable integration with airline.
      let g:airline#extensions#ale#enabled = 1

      let g:ale_linters = {
      \   'javascript': ['standard', 'flow'],
      \}
      let g:ale_fixers = {'javascript': ['standard']}

      let g:flow#autoclose = 1
      let g:flow#showquickfix = 0
    '';

    vam.knownPlugins = vimPlugins // my_plugins;
    vam.pluginDictionaries = [
      { names = [
        "ale"
        "ctrlp"
        "vim-rooter"
        "vim-addon-nix"
        "fzfWrapper"
        "vim-ripgrep"
        "nvim-completion-manager"
        "deoplete-nvim"
        "LanguageClient-neovim"
        "vim-test"
        "molokai"
        "fugitive"
        "gitgutter"
        "vim-airline"
        "vim-airline-themes"
        "sleuth"
        "vim-javascript"
        "typescript-vim"
        "vim-graphql"
        "vim-vue"
        "elm-vim"
        "vim-pony"
        "nim-vim"
        "vim-reason-plus"
        "vim-flow"
        "vim-pug"
        "hexmode"
      ]; }
    ];
  };
}
