Aurora is a warm neovim colorscheme for cozy morning coding.

Aurora is inspired by the [Nord colorscheme](https://www.nordtheme.com).

Aurora was designed as a cozy theme with a vibrant and coherent colorscheme.

## Installation

using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use 'crispybaccoon/aurora'
```

using [vim-plug](https://github.com/junegunn/vim-plug):

```Vim
Plug 'crispybaccoon/aurora'
```

## Configuration

```lua
require 'aurora'.setup {
  transparent_background = false,
  contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
  override_terminal = true,
  style = {
    search = { reverse = true },
  },
  overrides = { }, -- add custom overrides
}
```

### Overrides

Overrides can take all options passed to `vim.api.nvim_set_hl()`.

```lua
require 'aurora'.setup {
    overrides = {
        'Normal' = { '#fddce3', '#1d2021' } -- { 'fg', 'bg', bold = bool, italic = bool, ... }
    },
}
```

## Features

- Lots of style-customization options (contrast, color invertion etc.)
- Support for Treesitter highlighting.
- Support for transparent background.
- Supported plugins: [GitGutter][], [Telescope][].

  [gitgutter]: https://github.com/airblade/vim-gitgutter
  [telescope]: https://github.com/nvim-telescope/telescope

## License

[MIT/X11](https://en.wikipedia.org/wiki/MIT_License)
