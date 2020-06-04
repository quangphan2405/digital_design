-- VHDL Entity alien_game_lib.c5_t2_w_rdy.symbol
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 15:15:54 05/30/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t2_w_rdy IS
   PORT( 
      clk        : IN     std_logic;
      frame_done : IN     std_logic;
      rst_n      : IN     std_logic;
      w_rdy      : OUT    std_logic
   );

-- Declarations

END c5_t2_w_rdy ;

--
-- VHDL Architecture alien_game_lib.c5_t2_w_rdy.fsm
--
-- Created:
--          by - USER.UNKNOWN (QUANG-PHAN)
--          at - 15:15:54 05/30/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c5_t2_w_rdy IS

   TYPE STATE_TYPE IS (
      init,
      toggle_low,
      wait_2_cycles
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

   -- Declare Wait State internal signals
   SIGNAL csm_timer : std_logic_vector(1 DOWNTO 0);
   SIGNAL csm_next_timer : std_logic_vector(1 DOWNTO 0);
   SIGNAL csm_timeout : std_logic;
   SIGNAL csm_to_wait_2_cycles : std_logic;

   -- Declare any pre-registered internal signals
   SIGNAL w_rdy_int : std_logic ;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      rst_n
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst_n = '0') THEN
         current_state <= init;
         csm_timer <= (OTHERS => '0');
         -- Default Reset Values
         w_rdy <= '1';
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
         csm_timer <= csm_next_timer;
         -- Registered output assignments
         w_rdy <= w_rdy_int;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      csm_timeout,
      current_state,
      frame_done
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default assignments to Wait State entry flags
      csm_to_wait_2_cycles <= '0';
      CASE current_state IS
         WHEN init => 
            IF (frame_done <= '0') THEN 
               next_state <= init;
            ELSIF (frame_done <= '1') THEN 
               next_state <= toggle_low;
            ELSE
               next_state <= init;
            END IF;
         WHEN toggle_low => 
            next_state <= wait_2_cycles;
            csm_to_wait_2_cycles <= '1';
         WHEN wait_2_cycles => 
            IF (csm_timeout = '1') THEN 
               next_state <= init;
            ELSE
               next_state <= wait_2_cycles;
            END IF;
         WHEN OTHERS =>
            next_state <= init;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      w_rdy_int <= '1';

      -- Combined Actions
      CASE current_state IS
         WHEN toggle_low => 
            w_rdy_int <= '0';
         WHEN wait_2_cycles => 
            w_rdy_int <= '0';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
   -----------------------------------------------------------------
   csm_wait_combo_proc: PROCESS (
      csm_timer,
      csm_to_wait_2_cycles
   )
   -----------------------------------------------------------------
   VARIABLE csm_temp_timeout : std_logic;
   BEGIN
      IF (unsigned(csm_timer) = 0) THEN
         csm_temp_timeout := '1';
      ELSE
         csm_temp_timeout := '0';
      END IF;

      IF (csm_to_wait_2_cycles = '1') THEN
         csm_next_timer <= "01"; -- no cycles(2)-1=1
      ELSE
         IF (csm_temp_timeout = '1') THEN
            csm_next_timer <= (OTHERS=>'0');
         ELSE
            csm_next_timer <= unsigned(csm_timer) - '1';
         END IF;
      END IF;
      csm_timeout <= csm_temp_timeout;
   END PROCESS csm_wait_combo_proc;

END fsm;