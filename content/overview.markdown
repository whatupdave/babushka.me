---
title: Overview
---


## What's it for?

When you spend time researching something new, it's pretty easy to forget what you found. That means next time, you have to re-research it again.

A lot of the tech jobs we do manually aren't challenging or fun, but they're finicky and have to be done just right--they're chores. Things that are important to do, but that are better automated than done manually.

That's what babushka is for. Once you describe a job using its DSL, babushka knows not only how to accomplish each part of the job, but also how to check if each part is already satisfied. For each component of the job, a test, along with the code to make that test pass--test-driven sysadmin.


## Sounds lofty.

I promise it isn't. The idea is to write little snippets of ruby that do those jobs you can never remember exactly off the cuff.

    dep 'public key' do
      met? { grep /^ssh-dss/, '~/.ssh/id_dsa.pub' }
      meet { log_shell "Generating a new key", "ssh-keygen -t dsa -f ~/.ssh/id_dsa -N ''" }
    end

That little chunk of ruby lets you do this:

    ⚡ babushka 'public key'
    public key {
      meet {
        Generating a new key... done.
      }
    } ✓ public key
    ⚡ 

And if we run it a second time:

    ⚡ babushka 'public key'
    public key {
    } ✓ public key
    ⚡

The first time, babushka ran the `met?` block, found that the dep wasn't met, and so ran the `meet` block to generate the key, as you can see above. Then it ran `met?` again to see if running the `meet` made the failing test pass. It did, so we see `✓ public key`.

The second time through, babushka ran the `met?` block like the first time, but found that the dep was already met and so exited.

Deps are written in a declarative style, which makes them a good reference too. Reading over the `'public key'` dep above, you check if you have a public key by inspecting `~/.ssh/id_dsa.pub`, and you generate a new one by running `ssh-keygen` with a certain set of options.

I've tried hard to focus on the idea of "no job too small", keeping things lo-fi and trusting the power of unix and git to solve problems for me where it makes sense.
