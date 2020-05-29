-- VHDL Entity tb_lib.tb_serial_tx.symbol
--
-- Created:
--          by - kayra.UNKNOWN (QUANG-PHAN)
--          at - 15:06:14 05/31/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_serial_tx IS
-- Declarations

END tb_serial_tx ;

--
-- VHDL Architecture tb_lib.tb_serial_tx.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 15:36:56 05/29/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_serial_tx IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL bit_in   : std_logic;
   SIGNAL clk      : std_logic;
   SIGNAL ready    : std_logic;
   SIGNAL rst_n    : std_logic;
   SIGNAL s_clk    : std_logic;
   SIGNAL s_sda    : std_logic;
   SIGNAL transmit : std_logic;


   -- Component Declarations
   COMPONENT c4_t5_serial_data
   PORT (
      bit_in   : IN     std_logic ;
      clk      : IN     std_logic ;
      rst_n    : IN     std_logic ;
      transmit : IN     std_logic ;
      ready    : OUT    std_logic ;
      s_clk    : OUT    std_logic ;
      s_sda    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT tx_tester_struct
   PORT (
      ready    : IN     std_logic ;
      s_clk    : IN     std_logic ;
      s_sda    : IN     std_logic ;
      bit_in   : OUT    std_logic ;
      clk      : OUT    std_logic ;
      rst_n    : OUT    std_logic ;
      transmit : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c4_t5_serial_data USE ENTITY alien_game_lib.c4_t5_serial_data;
   FOR ALL : tx_tester_struct USE ENTITY tb_lib.tx_tester_struct;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : c4_t5_serial_data
      PORT MAP (
         bit_in   => bit_in,
         clk      => clk,
         rst_n    => rst_n,
         transmit => transmit,
         ready    => ready,
         s_clk    => s_clk,
         s_sda    => s_sda
      );
   U_1 : tx_tester_struct
      PORT MAP (
         ready    => ready,
         s_clk    => s_clk,
         s_sda    => s_sda,
         bit_in   => bit_in,
         clk      => clk,
         rst_n    => rst_n,
         transmit => transmit
      );

END struct;
