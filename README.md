# NixOS Configuration for kaimata9

This repository contains a NixOS configuration tailored for a system with:
- A **NixOS 26.11** base system
- **Home Manager** for user-specific configuration
- **Ollama** with ROCm support for AI model serving
- **Steam** with Proton and gaming optimizations
- **AMD GPU** support with Vulkan and ROCm
- **NetworkManager** for wireless and wired connections
- **Power management** with `power-profiles-daemon`
- **Disk mounting** for `/mnt/data`

---

## 📦 Features

- ✅ Full NixOS system configuration
- 🏠 Home Manager for user-specific settings
- 🧠 Ollama AI model server with ROCm support
- 🎮 Steam and gaming tools (Proton, Oversteer)
- 🖥️ KDE Plasma 6 desktop environment
- 🖥️ Vulkan and AMD GPU support
- 🔐 NetworkManager for Wi-Fi and Ethernet
- 🖥️ File system mounts with `ext4` support

---

## 🛠️ Setup Instructions

### 1. Clone the repository
```bash
 git clone https://github.com/kaimata9/nixos-config.git
cd nixos-config
```

### 2. Initialize NixOS
Ensure your system is set up with NixOS and has `nixpkgs` and `home-manager` flakes enabled.

### 3. Rebuild the system
```bash
 nixos-rebuild switch --flake .
```

### 4. Initialize Home Manager
```bash
 home-manager switch --flake .
```

---

## 📁 Configuration Files

- `flake.nix`: Main Nix Flakes configuration
- `configuration.nix`: Core NixOS system configuration
- `hardware-configuration.nix`: Hardware-specific settings (auto-generated)
- `home.nix`: Home Manager configuration for user `kaimata9`
- `vm.nix`: (Optional) NixOS VM configuration
- `flake.lock`: Locks NixOS and Home Manager versions

---

## 🔧 Key Configurations

### System Settings
- **Hostname**: `nixosmain`
- **Timezone**: `Europe/Sofia`
- **Locale**: `en_US.UTF-8` with additional Bulgarian locale support
- **Filesystem**: `/mnt/data` mounted with UUID `ca4000b3-d702-40d5-bd0a-2f02810b5736`

### Software
- **Kernel**: `linuxPackages_latest`
- **Graphics**: AMD with ROCm, Vulkan, and `lact` for GPU monitoring
- **Networking**: `NetworkManager` with `nm-applet`
- **Power**: `power-profiles-daemon` for power management
- **Sound**: `pipewire` with ALSA support
- **Steam**: With `Proton`, `Oversteer`, and `gamescope`

### Services
- **Ollama**: Enabled on port `11434`, configured for AMD ROCm GPUs
- **OpenSSH**: Enabled with default firewall rules
- **CUPS**: Enabled for printing
- **Bluetooth**: Enabled with `blueman`

---

## ⚠️ Notes

### NixOS Version
- This configuration targets **NixOS 26.11**. Update `system.stateVersion` in `configuration.nix` if you're using a different release.

### Allow Unfree Packages
- `nixpkgs.config.allowUnfree = true;` is enabled for Steam and other proprietary software. Use with caution.

### Locale Configuration
- Ensure locales are generated with:
  ```nix
  environment.systemPackages = with pkgs; [ locales ];
  ```

### AMD GPU Workarounds
- `HSA_OVERRIDE_GFX_VERSION = "10.1.0";` is set for compatibility with AMD 5700 XT GPUs.

---

## 📜 License

This configuration is licensed under the **MIT License**. You may use, copy, and modify it as needed for personal or internal use.

---

## 📌 TODOs
- [ ] Add a `README.md` for each hardware-specific module (e.g., `hardware-configuration.nix`)
- [ ] Add a section for troubleshooting common issues
- [ ] Add documentation for custom Home Manager modules

---

Let me know if you'd like to add a section for troubleshooting or deployment instructions!