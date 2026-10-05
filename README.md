# PimpMyLinux

# 🐧 Pop!_OS ASUS ROG - Setup & Dotfiles

Acest repository conține documentația, reparațiile și configurațiile necesare pentru un mediu de lucru perfect optimizat pe un laptop ASUS ROG (grafică NVIDIA) rulând **Pop!_OS 22.04 LTS**.

## 📋 Cuprins

Am împărțit procesul de configurare în trei module principale:

1. **[Reparații Sistem & Stabilitate NVIDIA](01-system-fixes.md)**
   * Rezolvarea ecranului negru la ieșirea din Sleep/Suspend.
   * Optimizarea boot-ului și eliminarea blocajului cu tasta Space.

2. **[Pimp My Terminal (Customizare CLI)](02-terminal-setup.md)**
   * Instalare Starship, Fastfetch, Btop, Eza.
   * Configurare `.bashrc` și alias-uri utile.

3. **[Hardware Specifics (Tastatura RGB)](03-hardware-rgb.md)**
   * Controlul iluminării Aura direct din linia de comandă, fără utilitare bloatware.

---
*Proiect creat pentru a salva timp la reinstalări și pentru a păstra un istoric curat al modificărilor de sistem.*

Pentru a rula acest script pe o mașină nouă, trebuie doar să îi dai permisiuni de execuție și să îl pornești:

```bash
chmod +x install.sh
./install.sh
