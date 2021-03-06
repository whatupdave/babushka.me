---
title: Finding deps
---

## Searching for Deps

TODO

## Trust

Deps can run any ruby code. Since ruby can shell out, a dep can run any code at all. A maliciously written dep could add your machine to a botnet, or email your ssh key to a mobster, or anything crafty or untoward you can think of.

(This is true of any software you run on your machine. If you run it, you're trusting it.)

Babushka has no security features at all. This is by design, because the only real type of security is a network of trust. As Linus Torvalds said, "anything else is masturbation".

The upshot: Only run deps written by people you trust to get them right, or deps whose code you've inspected beforehand.

In particular, `--dry-run` is not a contract. It's an honour system, and a badly written dep could change your system even when using it.

Dep sources are shared using git, so you can rely on their immutability once you've checked the ref IDs, like any git repo.


## Dep Sources

A dep source is just a git repo, with some deps in it. There's no structure to a dep source - the `.rb` files within it can have any names and be within any directory structure you like.

As a convention, I tend to keep related deps together in top-level `.rb` files, and use a top-level `templates/` directory for meta deps. But the layout of the files and directories doesn't affect the way babushka makes the deps & templates available, so use whatever convention you like.

## Custom Sources

TODO

## Dep Locations

TODO
