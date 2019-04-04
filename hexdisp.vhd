library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity hexdisp is
	port(A: in std_logic_vector(2 downto 0);
		  H: out std_logic_vector(6 downto 0));
end hexdisp;


architecture char of hexdisp is
begin
	process(A)
	begin
	case A is
			when "000" =>
				H <= "0000001";
			when "001" =>
				H <= "1001111"; 
			when "010" =>
				H <= "0010010";
			when "011" =>
				H <= "0000110";
			when "100" =>
				H <= "1001100";
			when "101" =>
				H <= "0100100";
			when "110" =>
				H <= "0100000";
			when "111" =>
				H <= "0001111";
	end case;
	end process;	
end char;
