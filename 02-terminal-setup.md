# 🎨 2. Pimp My Terminal

Configurația care transformă terminalul default într-unul ultra-rapid, cu suport pentru iconițe, culori, syntax highlighting și grafice detaliate.

## 📦 Utilitare instalate
* **Starship** - Prompt minimalist, ultra-rapid (Rust).
* **Fastfetch** - Afișează logo-ul OS și specificațiile sistemului (C).
* **Btop** - Monitorizare avansată resurse CPU/GPU (C++).
* **Eza** - Înlocuitor modern pentru `ls` cu culori și iconițe.
* **JetBrains Mono Nerd Font** - Fontul necesar pentru randarea iconițelor din terminal.

## ⚙️ Instrucțiuni de Instalare

**1. Instalare pachete de bază (Fastfetch, Btop):**
```bash
# Adăugare PPA pentru Fastfetch (pe Pop!_OS 22.04)
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
sudo apt update
sudo apt install fastfetch btop curl -y
```
2. Instalare Starship:

```bash
curl -sS [https://starship.rs/install.sh](https://starship.rs/install.sh) | sh -s -- -y
# Aplicare temă Gruvbox Rainbow (sau Pastel Powerline):
starship preset gruvbox-rainbow -o ~/.config/starship.toml
```
3. Instalare Eza (modern ls):

```bash
sudo mkdir -p /etc/apt/keyrings
wget -qO- [https://raw.githubusercontent.com/eza-community/eza/main/deb.asc](https://raw.githubusercontent.com/eza-community/eza/main/deb.asc) | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] [http://deb.gierens.de](http://deb.gierens.de) stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo apt update && sudo apt install -y eza
```
4. Configurare .bashrc (Integrare & Alias-uri):
Se adaugă următoarele linii la finalul fișierului ~/.bashrc:

```bash
# Încărcare aplicații la pornirea terminalului
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
