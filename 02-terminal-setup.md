# 🎨 2. Pimp My Terminal

Configurația care transformă terminalul default într-unul ultra-rapid, cu suport pentru iconițe, culori, syntax highlighting și grafice detaliate.


## 🔤 Prerechizit: Instalarea fontului Nerd Font (Esențial pentru iconițe)

Pentru ca utilitarele precum `eza` și `Starship` să afișeze corect iconițele și să nu apară pătrățele (*tofu*), sistemul are nevoie de un font cu glife extinse.

### 1. Instalare automată din terminal
Rulează următoarele comenzi pentru a descărca și înregistra **JetBrainsMono Nerd Font** în sistem:

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLO [https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz)
tar -xf JetBrainsMono.tar.xz
rm JetBrainsMono.tar.xz
fc-cache -f -v
```

2. Activare în GNOME Terminal (Pop!_OS)
După instalare, fontul trebuie selectat manual în interfața terminalului:

Deschide terminalul și apasă pe butonul de Meniu (trei linii / hamburger) din dreapta sus -> Preferences.

În panoul din stânga, dă clic pe profilul tău activ.

Bifează căsuța Custom font.

Apasă pe caseta fontului, caută și selectează JetBrainsMono Nerd Font, apoi apasă Select.



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
