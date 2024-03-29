dotfiles_config="$HOME/.dotfiles/.config"
user_config="$HOME/.config"

for element in $(ls -A $dotfiles_config); do
    src_element="$dotfiles_config/$element"
    dest_element="$user_config/$element"
    
    if [ -d "$src_element" ]; then
        rsync -av "$src_element/" "$dest_element/"
    elif [ -f "$src_element" ]; then
        rsync -av "$src_element" "$dest_element"
    fi

    echo "Copied or updated to .config: $element"
done
