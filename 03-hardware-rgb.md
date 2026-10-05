# 💡 3. Hardware Specifics (Tastatura Asus ROG)

Controlul efectelor Aura RGB de pe tastatura laptopului direct din terminal, folosind kernelul de Linux și `brightnessctl`, fără a depinde de utilitare terțe (precum asusctl sau OpenRGB).

## Schimbarea luminozității
```bash
# Instalare utilitar nativ de control luminozitate
sudo apt install brightnessctl

# Setarea luminozității (valori acceptate: de la 0 la 3)
brightnessctl --device='asus::kbd_backlight' set 3
```
Schimbarea efectelor (AURA Mode)
Comenzile interacționează direct cu modulul kernelului asus_wmi expus în /sys.

```bash
# 0 = Static
# 1 = Breathing
# 2 = Color Cycle
# 3 = Rainbow

# Exemplu pentru aplicarea modului Static (0):
echo 0 | sudo tee /sys/class/leds/asus::kbd_backlight/kbd_rgb_mode
