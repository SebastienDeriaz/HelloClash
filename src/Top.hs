-- Top-level file
-- Sébastien Deriaz
-- 07.10.2022
--
-- A simple project to display 0-1-2-3-4-5 on the HEX display of a De1-SoC
-- as well as light up LEDR0-3 with KEY0-3

import Clash.Prelude
import Clash.Sized.BitVector

{-# ANN topEntity
  (Synthesize
    { t_name   = "topEntity"
    , t_inputs =
        [ PortName "CLOCK_50"
        , PortName "SW_0"
        , PortName "KEY_N"
        ]
    , t_output = PortProduct "" [
        PortName "LEDR"
        ,PortName "HEX0_N"
        ,PortName "HEX1_N"
        ,PortName "HEX2_N"
        ,PortName "HEX3_N"
        ,PortName "HEX4_N"
        ,PortName "HEX5_N"
      ]
    }
  )#-}

topEntity
  :: Clock System
  -> Enable System
  -> Signal System (BitVector 4)
  -> Signal System (
    BitVector 10, -- LEDR
    Unsigned 7, -- HEX0_N
    Unsigned 7, -- HEX1_N
    Unsigned 7, -- HEX2_N
    Unsigned 7, -- HEX3_N
    Unsigned 7, -- HEX4_N
    Unsigned 7 -- HEX5_N
    )
topEntity clk en key = bundle (ledr, hex0, hex1, hex2, hex3, hex4, hex5)
  where
    -- ledr : 000000-key
    -- key are the 4 push buttons on the De1-SoC
    ledr = uncurry (++#) <$> bundle (0, complement <$> key)
    -- Segments light up when the value is 0
    hex5 = pure 0b1000000 -- 0
    hex4 = pure 0b1111001 -- 1
    hex3 = pure 0b0100100 -- 2
    hex2 = pure 0b0110000 -- 3
    hex1 = pure 0b0011001 -- 4
    hex0 = pure 0b0010010 -- 5

    
