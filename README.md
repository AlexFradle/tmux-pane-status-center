# tmux-pane-status-center

Centers the pane border status.

## Usage

Add `#(pane_status_center TEXT)` to the `pane-border-format` tmux option:

```bash
set -g pane-border-format '#(pane_status_center #{pane_index})'
```

## Customisation

Change the left and right characters:

```bash
set -g @padd_surround_l "|"
set -g @padd_surround_r "|"
```

## Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'AlexFradle/tmux-pane-status-center'

Hit `prefix + I` to fetch the plugin and source it. You should now be able to
use the plugin.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/AlexFradle/tmux-pane-status-center ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/center.tmux

Reload TMUX environment with: `$ tmux source-file ~/.tmux.conf`.
You should now be able to use the plugin.

