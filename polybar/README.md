# Polybar

Taken from [Polybar-5](https://github.com/adi1090x/polybar-themes#-polybar-5)

This one is made more specific for i3, as the original was oriented around openbox.

## Changes made and some tips if you face problems as a new user
mpd module switched out for an user made module called [Polybar-spotify](https://github.com/Jvanrhijn/polybar-spotify). Due to the auto hide features of polybar modules, it will appear only while running.

Changed the pacman implementation in the custom package update script to apt.

You will also have to make it more natural to your distro and system as a lot of the files are not dynamically defined.

If you can't properly implement the xbacklight(I couldn't), I'd recommend [Light](https://github.com/haikarainen/light).
I use nmtui with termite to configure network. Mainly wireless because I can't find the ssid of some networks.

Just in case you want to just copy it in and edit nothing, copy it into '~/.config/polybar/'
