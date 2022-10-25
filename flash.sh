#!/bin/sh

CABLE=''${CABLE:-$(quartus_pgm -l | grep -iv info: | head -n1 | sed 's/[^ ]* //')}
MODE=''${MODE:-JTAG}
echo "Flashing cable '$CABLE' with mode '$MODE'"
quartus_pgm \
--cable="$CABLE" \
--mode="$MODE" \
--operation='p;HelloClash.sof@2'

