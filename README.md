# Shell Scripts

Useful Shell Scripts (sh, bash, zsh) for DevOps and every day tasks.

## Installation

The best way to use all the functions here is by sourcing the `.functions` file.
You can put it in `.zshrc` / `.bashrc` / `.bash_profile`, etc.

```bash
source .functions
```

## [`git`](./git/)

This repository contains useful shell scripts for Git operations and workflow automation.

- [`git-switch-branch-orphan.sh`](./git/git-switch-branch-orphan.sh): Create a new orphan git branch

```bash
cd repo
git-switch-branch-orphan new-branch
```

- [`git-checkout-branch-orphan.sh`](./git/git-checkout-branch-orphan.sh): Alternative for old git version to create a new orphan git branch.

```bash
cd repo
git-checkout-branch-orphan new-branch
```

## [`ffmpeg`](./ffmpeg/)

Usefull ffmpeg scripts

- [`ffmpeg-blur-pillarbox.sh`](./ffmpeg/ffmpeg-blur-pillarbox.sh): Convert vertical video (9:16) to horizontal video (16:9) by adding its copy as blurred background aka pillarboxing

```bash
ffmpeg-blur-pillarbox input.mp4 output.mp4
```
