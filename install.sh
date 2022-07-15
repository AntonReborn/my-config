git clone https://github.com/AntonReborn/my-config.git
cd my-config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty

cp .tmux.conf ~/
cp init.vim ~/.config/nvim/
cp alacritty.yml ~/.config/alacritty
cp .zshrc ~/.zshrc
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

pip install pynvim
pip install jedi
cd ..
rm -r my-config
nvim +PlugInstall
