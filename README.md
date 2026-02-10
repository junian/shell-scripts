# Shell Scripts

Useful shell scripts (`sh`, `bash`, `zsh`) for DevOps and everyday tasks.

## Installation

Clone this repository, preferably into your `$HOME` directory.

```bash
git clone https://github.com/junian/shell-scripts ~/shell-scripts
```

The best way to use all the functions provided here is by sourcing the `.functions` file.
You can add it to `.zshrc`, `.bashrc`, `.bash_profile`, or a similar shell configuration file.

```bash
source "$HOME/shell-scripts/.functions"
```

## [`git`](./git/)

This repository contains useful shell scripts for Git operations and workflow automation.

- [`git-switch-branch-orphan.sh`](./git/git-switch-branch-orphan.sh): Create a new orphan Git branch

```bash
cd repo
git-switch-branch-orphan new-branch
```

- [`git-checkout-branch-orphan.sh`](./git/git-checkout-branch-orphan.sh): An alternative for older Git versions to create a new orphan Git branch

```bash
cd repo
git-checkout-branch-orphan new-branch
```

## [`ffmpeg`](./ffmpeg/)

Useful FFmpeg scripts.

- [`ffmpeg-blur-pillarbox.sh`](./ffmpeg/ffmpeg-blur-pillarbox.sh): Convert a vertical video (9:16) to a horizontal video (16:9) by adding a blurred copy of the video as the background (pillarboxing)

```bash
ffmpeg-blur-pillarbox input.mp4 output.mp4
```
