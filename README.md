# FPGA VGA Controller – Verilog

This project implements a **VGA Controller using Verilog HDL** on an FPGA.

The design generates VGA synchronization signals and controls pixel data to display an image on a VGA monitor. The project demonstrates the implementation of display timing, pixel coordinate generation, memory addressing, and basic image processing using RTL logic.

## Overview

The VGA controller performs the following functions:

- Generates horizontal synchronization (`HSYNC`)
- Generates vertical synchronization (`VSYNC`)
- Generates pixel coordinates
- Reads pixel data from Block RAM
- Generates RGB output
- Displays images on a VGA monitor
- Supports basic image-processing operations

## Hardware Platform

- **FPGA Board:** Digilent Basys 3
- **FPGA:** Xilinx Artix-7
- **Display:** VGA Monitor
- **HDL:** Verilog
- **Development Tool:** Xilinx Vivado

## Block Diagram

```text
                       ┌─────────────────┐
                       │   Image Data    │
                       │      BRAM       │
                       └────────┬────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │     Pixel       │
                       │   Processing    │
                       └────────┬────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │ VGA Controller  │
                       │                 │
                       │ H Counter       │
                       │ V Counter       │
                       │ Sync Generator  │
                       └────────┬────────┘
                                │
                    ┌───────────┼───────────┐
                    │           │           │
                    ▼           ▼           ▼
                  HSYNC       VSYNC      RGB Data
                    │           │           │
                    └───────────┼───────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │   VGA Monitor   │
                       └─────────────────┘
