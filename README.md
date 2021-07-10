## My DotFiles Configuration

I wanted to encapsulate all of my .dotfiles in a repo as an easier way to setup new Linux environments. Previously I would `cp` my config files to my `~/.dotfiles` directory after I made a change. But no more! Now I am using GNU Stow to symlink my dotfiles in their default locations to my `~/.dotfiles` directory/repo where I can edit them and push my changes to GitHub without having to manually copy them over every time I make an edit and want to push the change. 

## How it works

Say you have a config folder in your home directory like `~/.config` and you have your Neovim config in there like `~/.config/nvim/init.vim`. All you need to do is create a directory you want, I used `~/.dotfiles`, and `mkdir` for every config you need. 

### For example:

`mkdir -p ~/.dotfiles/nvim/.config/nvim`

`mv ~/.config/nvim/init.vim ~/.dotfiles/nvim/.config/nvim/`

Now from within `~/.dotfiles` run:

`stow nvim`

and since the structure inside `~/.dotfiles/nvim` is `~/.config/nvim` stow knows to go up one directory from where you are (ie go to your home dir) and match the path `.config/nvim` and symlink every file that's in your `.dotfiles/nvim`. 

This means `~/.config/nvim/init.vim` uses `~/.dotfiles/nvim/.config/nvim/init.vim` as its source of truth and anything you do to the dotfile version will directly affect the actual config file version. 

Now if you go to `~/.config/nvim` you will see a file/directory representing everything that's in your `.dotfiles/nvim`. Now you can manage the dotfiles repo without having to move them around to update them. You manage it all from your `.dotfiles` directory.



