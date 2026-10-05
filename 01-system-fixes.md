# 🛠️ 1. Reparații Sistem & Stabilitate (NVIDIA)

Problemele clasice pe laptopurile hibride cu Pop!_OS și rezolvările lor definitive.

## Fix: Ecran negru la revenirea din Sleep / Suspend
Driverul NVIDIA corupe adesea memoria video la intrarea în repaus. Soluția este activarea serviciilor de sistem care forțează salvarea memoriei video (VRAM) în RAM-ul sistemului înainte de sleep.

```bash
# Activarea serviciilor de power management NVIDIA
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service

# Adăugarea parametrului de kernel pentru păstrarea alocărilor VRAM
sudo kernelstub -a "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
