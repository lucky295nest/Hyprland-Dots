# Lukysek's dots
### my Hyprland dotfiles

My Hyprland configuration — meant as a backup, but feel free to use it however you like!\
I'll be adding themes and scripts over time, so pick whatever suits you!

#### Requirements

##### 100% needed
```
hyprland
rofi
waybar
kitty
```

##### you probably should have these
```
thunar
mako
awww
```

##### you don't exactly need those but they are cool!
```
hyprshot
oh-my-posh
zsh
ttf-jetbrains-mono-nerd
ttf-iosevkaterm-nerd
ttf-iosevka-nerd
nwg-look
Graphite-gtk-theme
bibata-cursor-theme
```

| Thingie    | What it is           |
|------------|----------------------|
| hyprland   | window manager       |
| rofi       | application launcher |
| waybar     | bar                  |
| kitty      | terminal             |
| thunar     | file browser         |
| mako       | notification daemon  |
| awww       | wallpaper manager    |
| hyprshot   | screenshot taker     |
| oh-my-posh | prompt theme engine  |
| zsh        | shell                |
| nerdfonts  | very cool fonts      |

> If you discover that any dependencies are missing please let me know <3

## Instructions

### ❗ Important ❗
#### before using this config
set up your monitors.conf to fit your monitor \
or uncomment this line: `# monitor= , preferred, auto, 1` \
and delete or comment this line: `monitor=DP-3,2560x1440@165,0x0, 1`

###### STEP 1
Clone into your home folder (or wherever you want <3)

```shell
cd ~
git clone --depth=1 --branch main https://github.com/lucky295nest/Hyprland-dots.git dotfiles
```

###### STEP 2

Either copy or symlink everything to your `.config` folder. \
I recommend to symlink (so if you copy you're on your own :3).

```shell
# Make sure to create a backup and remove the folders if they already exist
# like .config/hypr/ since we will be symlinking it from ~/dotfiles 
ln -sf ~/dotfiles/themes/ ~/.config/lucky-themes
ln -sf ~/dotfiles/wallpapers/ ~/.config/lucky-wallpapers
ln -sf ~/dotfiles/lucky-scripts ~/.config/lucky-scripts
ln -sf ~/dotfiles/hypr ~/.config/hypr
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/mako ~/.config/mako
ln -sf ~/dotfiles/oh-my-posh ~/.config/oh-my-posh
ln -sf ~/dotfiles/rofi ~/.config/rofi
ln -sf ~/dotfiles/waybar ~/.config/waybar
```

###### STEP 3

Give the scripts proper rights.

```shell
chmod +x ~/dotfiles/awww-set.sh
chmod +x ~/dotfiles/wallpaper-picker.sh
chmod +x ~/dotfiles/theme-switcher.sh
chmod +x ~/dotfiles/theme-picker.sh
```

You should probably run `~/dotfiles/theme-switcher.sh warm-gray` or whatever theme you'd want \
because the symlinks are not present by default and your setup will show up broken.

###### STEP 4

To setup a wallpaper create a wallpapers directory (if it doesn't exist yet) `~/dotfiles/wallpapers/` \
then you can put your wallpapers inside `~/dotfiles/wallpapers/theme-name/`.

> I didn't want to include the wallpapers on github since I don't know if it is safe to do so.

Then you can simply use `SUPER + W` and choose it

To switch themes use `SUPER + T`

## Themes

<details>
<summary><b>warm gray</b></summary>
<br>

![warm gray](./screenshots/warm-gray.png)

![warm gray rofi](./screenshots/warm-gray-rofi.png)

wallpaper link [here](https://wallpapercave.com/w/wp13908816)

</details>

<details>
<summary><b>peachy delight</b></summary>
<br>

![peachy delight](./screenshots/peachy-delight.png)

![peachy delight rofi](./screenshots/peachy-delight-rofi.png)

wallpaper link [here](https://www.uhdpaper.com/2026/02/nikke-x-stellar-blade-4k-2625m.html)

</details>

---

Rofi theme based on [rofi-themes-selection](https://github.com/newmanls/rofi-themes-collection) by [newmanls](https://github.com/newmanls) — modified by lucky295nest.\
Released under GPL-3.0, see LICENSE.
