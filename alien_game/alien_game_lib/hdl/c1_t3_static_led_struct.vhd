-- VHDL Entity alien_game_lib.c1_t3_static_LED.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 00:45:28 02/11/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c1_t3_static_LED IS
   PORT( 
      color_BGR : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord   : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord   : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c1_t3_static_LED ;

--
-- VHDL Architecture alien_game_lib.c1_t3_static_LED.struct
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 00:45:28 02/11/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c1_t3_static_LED IS

   -- Architecture declarations

   -- Internal signal declarations



BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'constval'
   color_BGR <= "000000000000000011001100";

   -- ModuleWare code(v1.12) for instance 'U_1' of 'constval'
   x_coord <= "00000001";

   -- ModuleWare code(v1.12) for instance 'U_2' of 'constval'
   y_coord <= "00010000";

   -- Instance port mappings.

END struct;
