# Hyper CapsLock Unified

> *Make CapsLock Consistently Great on MacOS and Windows!*

I'm an user switching between my work PC and my personal Mac for different coding projects. My goal is to create configurations so I can have an almost identical experience when on MacOS and Windows, with or without my small external ANSI 60 keyboard.

Extra features are introduced on the base of [Vonng/Capslock](https://github.com/Vonng/Capslock):

* Consistent shortcut combinations between MacOS and Windows with different keyboard layouts.
* Duplicated key combos for a greater redundancy, less typo and ease of use.
* Removed hard to reach and less used key combinations for better ergonomics.
* Remapped apps to keys accoding to their initials.
* Remapped frequent IDE functions to keys with close semantic meanings, such as <kbd>-</kbd> and <kbd>+</kbd> for `Fold` and `Unfold`.
* Remapped <kbd>#</kbd>, <kbd>£</kbd>, <kbd>`</kbd> and <kbd>~</kbd>, so they are typed in a consistent fashion across keyboard and OS.
* Simplified to have only one extra modifier, the left <kbd>Cmd</kbd> key, when <kbd>Hyper</kbd> is used.

------------------------

## ANSI 60 Key and Keycap change

![ansi-60](docs/img/ansi-60-remapped.png)

My external keyboard has a small ANSI 60 keys layout that is different from both my Mac and Windows laptop's UK ISO keyboards. It's reprogrammed with firmware to have the left modifier keys (<kbd>Ctrl</kbd>/<kbd>Win</kbd>/<kbd>Alt</kbd>) swapped to (<kbd>Ctrl_L</kbd>/<kbd>Alt</kbd>/<kbd>Ctrl_R</kbd>) to allow the same finger positions for the same Hyper shortcuts defined in both MacOS and Windows.

------------------------

## CapsLock Enhancement Windows

The additional `Ctrl_R` key gives a close <kbd>⌘</kbd> experience when in Windows, While the original `Ctrl_L` key on the left makes Windows users feel at home by keeping Windows `Ctrl+` shortcuts unchanged. 

Only the top `Hyper+` layer are kept for the middle `T/G/V/B` keys because they are difficult to reach for the `Hyper+Ctrl+` layer.

![hyper-win](docs/img/hyper-caps-lock-win.png)

------------------------

## CapsLock Enhancement Mac

Mac keyboard layout is designed slightly different than normal ANSI/ISO layouts. Its wider and slighly left moved <kbd>⌘</kbd> key is more ergonomics for usual <kbd>⌘</kbd>+<kbd>C</kbd> or <kbd>⌘</kbd>+<kbd>V</kbd>. And it allows slighly easier reach for `T/Y/G/V/B` keys when <kbd>CapsLock</kbd> and <kbd>⌘</kbd> are both pressed.

Use **Karabiner-Elements**'s simple rule to change `Ctrl_R` to `Cmd_Left` for the external ANSI keyboard only. All other complex rules defined in the JSON file can then be loaded for consistent Hyper features.

![hyper-mac](docs/img/hyper-caps-lock-mac.png)

------------------------


## Highlights (To be updated)

* **Powerful**: Transform Capslock into a great modifier: **Hyper(<kbd>✱</kbd>)**. (such as <kbd>⇧</kbd><kbd>⌃</kbd><kbd>⌥</kbd><kbd>⌘</kbd>)
* **Useful**: Navigation, mousekey, clipboard, win/term ctrl, shortcuts, etc... **Redefine the keyboard!**
* **Speed-Up**: Optimized for developers, high-frequency move **stay in hot zone**.
* **Extensible**: Work with existing modifiers, which introduce **16 extra control planes**.
* **MouseKey**: Manipulate mouse cursor and wheels with keyboard
* **Cross-Platform**: MacOS and Windows. Light-Weight and portable

------------------------

## Install (To be updated)

It only takes two steps to enable Capslock on your Mac: Download & Enable

1. [Download](https://github.com/pqrs-org/Karabiner-Elements/releases/download/v14.2.0/Karabiner-Elements-14.2.0.dmg)

   Download & Install [**Karabiner-Elements**](https://karabiner-elements.pqrs.org/).

   Following the wizard and grant required permissions (Settings - Security - Privacy)

2. [Enable](karabiner://karabiner/assets/complex_modifications/import?url=https://ke-complex-modifications.pqrs.org/json/caps_lock_enhancement.json)

   Open this [link](karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/Vonng/Capslock/master/mac_v3/capslock.json) with Safari. It will launch Karabiner-Elements and load configuration.

   `karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/Vonng/Capslock/master/mac_v3/capslock.json`

   > #### Alternative Links
   > * [Karabiner Gallery](karabiner://karabiner/assets/complex_modifications/import?url=https://ke-complex-modifications.pqrs.org/json/caps_lock_enhancement.json)：https://ke-complex-modifications.pqrs.org/json/caps_lock_enhancement.json
   > * [GitHub Repo](karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/Vonng/Capslock/master/mac_v3/capslock.json)： https://raw.githubusercontent.com/Vonng/Capslock/master/mac_v3/capslock.json
   > * [Capslock Website](karabiner://karabiner/assets/complex_modifications/import?url=https://vonng.com/capslock.json)： https://vonng.com/capslock.json
   > * Or download [**capslock.json**](mac_v3/capslock.json) to ` ~/.config/karabiner/assets/complex_modifications/` manually.

   Click `Enable All` for `Capslock Enhancement` on pop-up dialog. It will affect immediately.

   You can now try moving cursor with ⇪ + h,j,k,l , And exploring more features below.