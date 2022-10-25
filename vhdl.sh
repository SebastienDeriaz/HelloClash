#!/bin/sh
# Compile .hs -> .vhdl
clash --vhdl src/Top.hs

clash -odir . -hidir . --vhdl src/Top.hs
