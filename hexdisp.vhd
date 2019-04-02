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
				H <= "1111110";
			when "001" =>
				H <= "0110000"; 
			when "010" =>
				H <= "1101101";
			when "011" =>
				H <= "1111001";
			when "100" =>
				H <= "0110011";
			when "101" =>
				H <= "1011011";
			when "110" =>
				H <= "1011111";
			when "111" =>
				H <= "1110000";
	end case;
	end process;	
end char;