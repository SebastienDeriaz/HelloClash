# HelloClash

The goal of this project is to demonstrate a simple Clash program that can be synthetized and flashed on a DE1-SoC developpement board

## Requirements

- Nix (if used)

## Installation

```bash
git clone https://github.com/SebastienDeriaz/HelloClash

# With Nix
direnv allow
```

## Usage (using Nix)

```bash
# Flash (VHDL + build + flash)
nix run .#flash

# Build VHDL only
nix build .#vhdl

# Build binary only
nix build
```

## Usage (without using Nix)

```bash
# 1) VHDL
./vhdl.sh

# 2) Synthesize
./build.sh

# 3) Flash
./flash.sh
```
