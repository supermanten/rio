#Theme
source ~/.config/nushell/themes/catppuccin_latte.nu

# Create vendor directory if it doesn't exist
mkdir ($nu.data-dir | path join "vendor/autoload")

# Starship prompt
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Zoxide integration
if (which zoxide) {
    zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
    source ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
}

# Enhanced yazi command with better error handling
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# Quick directory navigation
def q [dir: string] {
    let target = match $dir {
        "d" => "~/Downloads",
        "c" => "~/.config",
        "p" => "~/Projects",
        "doc" => "~/Documents",
        _ => $dir
    }
    cd $target
}

# Enhanced git status with formatting
def gss [] {
    git status -s | lines | each {|line|
        let parts = ($line | split row ' ')
        let status = $parts.0
        let file = $parts.1
        match $status {
            "M" => { $"[(ansi green)modified(ansi reset)] ($file)" }
            "A" => { $"[(ansi yellow)added(ansi reset)] ($file)" }
            "D" => { $"[(ansi red)deleted(ansi reset)] ($file)" }
            "??" => { $"[(ansi blue)untracked(ansi reset)] ($file)" }
            _ => $line
        }
    }
}

# Quick directory listing with icons (simplified)
def lsg [] {
    ls | each {|file|
        let extension = ($file.name | path parse | get extension)
        let icon = match $extension {
            "nu" => "🐚",
            "rs" => "🦀", 
            "py" => "🐍",
            "js" => "📜",
            "ts" => "📘",
            "md" => "📝",
            "txt" => "📄",
            "zip" => "📦",
            "pdf" => "📕",
            _ => { if $file.type == "dir" { "📁" } else { "📄" } }
        }
        $"($icon) ($file.name)"
    }
}

# Simple calculator
def calc [expression: string] {
    python -c $"print(($expression))" 
}

# Show disk usage for current directory
def dus [] {
    du -h . | sort-by size | reverse
}

# --- Aliases (Organized by Category) ---

# Navigation
alias e = exit
alias . = cd ..
alias .. = cd ../.. 
alias ... = cd ../../..
alias p = pwd

# File Operations
alias l = lsd
alias ll = lsd -l
alias la = lsd -a
alias lla = lsd -la
alias lt = lsd --tree
alias cat = bat
alias tree = eza -T
alias rm-safe = rm -I  # safer remove with confirmation

# Editors
alias nv = neovide
alias v = nvim
alias vi = nvim
alias vim = nvim

# Git (Enhanced)
alias gc = git commit -m
alias gp = git push
alias ga = git add .
alias gpl = git pull
alias gs = git status
alias gss = gss  # Use our custom git status
alias gcl = git clone
alias gr = git restore
alias gi = git init
alias gd = git diff
alias gco = git checkout
alias gb = git branch
alias gl = git log --oneline --graph --all

# Package Management
alias pacman = paru
alias pi = paru -S
alias pss = paru -Ss
alias pu = paru -Sy
alias puu = paru -Syu
alias pr = paru -Rns
alias pq = paru -Q
alias pqi = paru -Qi
alias pe = paru -Qe
alias pclean = paru -Sc  # Clean package cache

# System Utilities
# alias df = df -h
# alias free = free -h
# alias top = btop
# alias htop = btop
# alias du = du -h

# Network
alias ip = ip -c a  # Colorized output
alias ping = ping -c 5
alias wget = wget -c  # Continue interrupted downloads

# Systemd
alias ss = systemctl status
alias sr = systemctl restart
alias ssr = systemctl start
alias ssp = systemctl stop
alias sen = systemctl enable
alias sdis = systemctl disable
alias journal = journalctl -xe

# Docker
alias dps = docker ps
alias di = docker images
alias dstart = docker start
alias dstop = docker stop
alias drm = docker rm
alias drmi = docker rmi
alias dcu = docker-compose up
alias dcd = docker-compose down

# Misc Utilities
alias hist = history
alias cls = clear
alias c = clear
alias time = timeit  # Nushell's built-in timing

# Application-specific
alias fs = fastfetch --logo ~/.config/fastfetch/fastfetch/space.png
alias ktheme = ~/.config/hypr/scripts/kitty-theme.sh
alias hint = ~/.config/hypr/scripts/key.sh
alias n-hint = ~/.config/nvim/lua/scripts/hint.sh
# Main configuration

# Environment variables
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.BAT_THEME = "TwoDark"
$env.MANPAGER = "sh -c 'col -bx | bat -l man -p'"
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false

$env.FZF_DEFAULT_OPTS = "
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8
--color=selected-bg:#45475A
--color=border:#6C7086,label:#CDD6F4"

# --- External Scripts ---
# source ~/.config/nushell/random-script.nu


#-----------------------------------------*******nvim******------------------------
def nvims [...args] {
  let items = ["rio", "kickstart", "LazyVim", "NvChad", "AstroNvim"]
  let config = ($items | to text | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)

  if ($config == null or $config == "") {
    print "Nothing selected"
    return
  }

  let appname = if $config == "rio" { "" } else { $config }

  with-env { NVIM_APPNAME: $appname } {
    nvim ...$args
  }
}

