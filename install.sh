#!/bin/bash

# Oprește scriptul dacă apare o eroare critică
set -e

echo "🚀 Începem instalarea utilitarelor pentru Pimp My Terminal (Pop!_OS)..."

# 1. Fastfetch & Btop
echo "📦 Adăugăm PPA-ul pentru Fastfetch și actualizăm sistemul..."
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
sudo apt update
sudo apt install fastfetch btop curl -y

# 2. Eza (modern ls)
echo "📦 Configurăm repository-ul pentru Eza..."
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# 3. Starship
echo "⭐ Instalăm Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "🎨 Aplicăm tema Gruvbox Rainbow pentru Starship..."
mkdir -p ~/.config
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# 4. Configurare .bashrc
echo "⚙️ Configurăm ~/.bashrc..."

# Verificăm dacă setările există deja pentru a evita duplicarea
if ! grep -q "# --- Pop\!_OS Custom Terminal Setup ---" ~/.bashrc; then
cat << 'EOF' >> ~/.bashrc

# --- Pop!_OS Custom Terminal Setup ---
fastfetch
eval "$(starship init bash)"

# Alias-uri
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --octal-permissions --group-directories-first"
alias tree="eza --tree --icons"
alias update='sudo apt update && sudo apt upgrade -y'
alias top='btop'
alias cls='clear'
alias ..='cd ..'
EOF
    echo "✅ Alias-urile și uneltele au fost adăugate în ~/.bashrc."
else
    echo "⚠️ Setările există deja în ~/.bashrc. Se omite duplicarea."
fi

echo "🎉 Instalare completă! Fontul JetBrains Mono Nerd Font trebuie instalat manual din setările terminalului."
echo "🔄 Rulează 'source ~/.bashrc' sau redeschide terminalul pentru a vedea magia."
