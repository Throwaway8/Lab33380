library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity mulproc is
	port(X, Y: in std_logic_vector(2 downto 0);
		  P: out std_logic_vector(5 downto 0));
end mulproc;


architecture char of mulproc is

signal C10: std_logic;

signal S11: std_logic;

signal c11: std_logic;

signal C20: std_logic;

signal S12: std_logic;

signal C12: std_logic;

signal C21: std_logic;




begin

C10 <= (X(0) and Y(0)) and (X(1) and Y(0));

S11 <= C10 xor (X(1) and Y(1)) xor (X(2) and Y(0));

c11 <= (C10 and (X(2) and Y(0))) or (C10 and (X(1) and Y(1))) or ((X(1) and Y(1)) and (X(2) and Y(0)));

C20 <= S11 and (X(0) and Y(2));

S12 <= (X(2) and Y(1)) xor C11;

C12 <= C11 and X(2) and Y(1);

C21 <= ((X(1) and Y(2)) and S12) or ((X(1) and Y(2)) and C20) or (C20 and S12);

P(0) <= X(0) and Y(0);

P(1) <= (X(0) and Y(1)) xor (X(1) and Y(0));

P(2) <= (X(0) and Y(2)) xor S11;

P(3) <= (X(1) and Y(2)) xor S12 xor C20;

P(4) <= C12 xor C21 xor (X(2) and Y(2));

P(5) <= (X(2) and Y(2) and C12) or (X(2) and Y(2) and C21) or (C12 and C21);

	
end char;