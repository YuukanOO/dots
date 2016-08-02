sudo dnf upgrade

curl -Lo min_1.4.1.deb  https://github.com/minbrowser/min/releases/download/v1.4.1/min_1.4.1_amd64.deb
sudo dnf copr enable mkrawiec/i3desktop
sudo dnf install compton zsh ruby ranger alien feh rxvt-unicode-256color

alien -r min_1.4.1.deb
sudo dnf install ./min-1.4.1-2.x86_64.rpm
