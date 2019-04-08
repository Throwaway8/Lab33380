library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity mul9x9 is 
	port(Mc: in std_logic_vector(8 downto 0);
		  Mp: in std_logic_vector(8 downto 0);
		  clk: in std_logic;
		  St: in std_logic;
		  Prod: out std_logic_vector(17 downto 0);
		  Done: out std_logic);
end mul9x9;

architecture char of mul9x9 is

signal state: integer range 0 to 13;

procedure Addvec(variable Add1, Add2: in std_logic_vector; variable Cin: in std_logic;
					  variable Sum: out std_logic_vector; variable Cout: out std_logic;
					  n: in positive) is
variable C: std_logic;
begin	
	C := Cin;
	for i in 0 to n-1 loop
		Sum(i) := Add1(i) xor Add2(i) xor C;
		C := (Add1(i) and Add2(i)) or (Add1(i) and C) or (Add2(i) and C);
	end loop;
	Cout := C;
end Addvec;

procedure multiply(variable X, Y: in std_logic_vector(2 downto 0); variable P: out std_logic_vector(5 downto 0)) is

variable C10: std_logic; --:= (X(0) and Y(0)) and (X(1) and Y(0));

variable S11: std_logic; --:= C10 xor (X(1) and Y(1)) xor (X(2) and Y(0));

variable c11: std_logic; --:= (C10 and (X(2) and Y(0))) or (C10 and (X(1) and Y(1))) or ((X(1) and Y(1)) and (X(2) and Y(0)));

variable C20: std_logic; --:= S11 and (X(0) and Y(2));

variable S12: std_logic; --:= (X(2) and Y(1)) xor C11;

variable C12: std_logic; --:= C11 and X(2) and Y(1);;

variable C21: std_logic; --:= ((X(1) and Y(2)) and S12) or ((X(1) and Y(2)) and C20) or (C20 and S12);

begin

C10 := (X(0) and Y(1)) and (X(1) and Y(0));

S11 := C10 xor (X(1) and Y(1)) xor (X(2) and Y(0));

c11 := (C10 and (X(2) and Y(0))) or (C10 and (X(1) and Y(1))) or ((X(1) and Y(1)) and (X(2) and Y(0)));

C20 := S11 and (X(0) and Y(2));

S12 := (X(2) and Y(1)) xor C11;

C12 := C11 and X(2) and Y(1);

C21 := ((X(1) and Y(2)) and S12) or ((X(1) and Y(2)) and C20) or (C20 and S12);

P(0) := X(0) and Y(0);

P(1) := (X(0) and Y(1)) xor (X(1) and Y(0));

P(2) := (X(0) and Y(2)) xor S11;

P(3) := (X(1) and Y(2)) xor S12 xor C20;

P(4) := C12 xor C21 xor (X(2) and Y(2));

P(5) := (X(2) and Y(2) and C12) or (X(2) and Y(2) and C21) or (C12 and C21);

	
end multiply;

begin 


		
	process(clk)
variable ad: std_logic_vector(8 downto 0) := "000000000";
variable P1: std_logic_vector(11 downto 0) := "000000000000";
variable P2: std_logic_vector(11 downto 0) := "000000000000";
variable P3: std_logic_vector(11 downto 0) := "000000000000";
variable P4: std_logic_vector(11 downto 0) := "000000000000";
variable P5: std_logic_vector(11 downto 0) := "000000000000";
variable P6: std_logic_vector(11 downto 0) := "000000000000";
variable P7: std_logic_vector(11 downto 0) := "000000000000";
variable P8: std_logic_vector(11 downto 0) := "000000000000";
variable P9: std_logic_vector(11 downto 0) := "000000000000";
variable acc: std_logic_vector(20 downto 0) := "000000000000000000000";
variable ad2: std_logic_vector(11 downto 0) := "000000000000";
variable ad3: std_logic_vector(11 downto 0) := "000000000000";
variable ad4: std_logic_vector(11 downto 0) := "000000000000";
variable ad5: std_logic_vector(11 downto 0) := "000000000000";
variable ad6: std_logic_vector(11 downto 0) := "000000000000";
variable ad7: std_logic_vector(11 downto 0) := "000000000000";
variable a, b, c ,d, e, f, g, h, j, l, m, n, o: std_logic := '0';
variable acc2: std_logic_vector(11 downto 0) := "000000000000";
variable acc3: std_logic_vector(11 downto 0) := "000000000000";
variable acc4: std_logic_vector(11 downto 0) := "000000000000";
	begin

		if rising_edge(clk) then
		state <= 0;
			if St = '1' then
					case state is 
						when 0 =>
							done <= '0';
							acc(8 downto 0) := Mp(8 downto 0);
							ad(8 downto 0) := Mc(8 downto 0);
							--ad := "000000000";
							P1 := "000000000000";
							P2 := "000000000000";
							P3 := "000000000000";
							P4 := "000000000000";
							P5 := "000000000000";
							P6 := "000000000000";
							P7 := "000000000000";
							P8 := "000000000000";
							P9 := "000000000000";
							--acc := "000000000000000000000";
							ad2 := "000000000000";
							ad3 := "000000000000";
							ad4 := "000000000000";
							ad5 := "000000000000";
							ad6 := "000000000000";
							ad7 := "000000000000";
							a := '0'; b := '0'; c := '0'; d := '0'; e := '0'; f := '0'; g := '0'; h := '0'; j := '0'; l := '0'; m := '0'; n := '0'; o := '0';
							acc2 := "000000000000";
							acc3 := "000000000000";
							acc4 := "000000000000";
							state <= 1;
						when 1 =>
							multiply(ad(2 downto 0), acc(2 downto 0), P1(5 downto 0));
							multiply(ad(5 downto 3), acc(2 downto 0), P2(5 downto 0));
							multiply(ad(8 downto 6), acc(2 downto 0), P3(5 downto 0));
							state <= 2;
						when 2 => 
							P2(11 downto 0) := P2(8 downto 0) & "000";
							Addvec(P1, P2, a, ad2, b, 12);
							state <= 3;
						when 3 =>
							P3(11 downto 0) := P2(5 downto 0) & "000000";
							Addvec(ad2, P3, b, ad3, c, 12);
							state <= 4;
						when 4 =>
							acc2 := acc(20 downto 9);
							Addvec(acc2, ad3, c, acc2, d, 12);
							acc(20 downto 9) := acc2;
							acc(20 downto 0) := "000" & acc(20 downto 3);
							state <= 5;
						when 5 =>
							multiply(ad(2 downto 0), acc(2 downto 0), P4(5 downto 0));
							multiply(ad(5 downto 3), acc(2 downto 0), P5(5 downto 0));
							multiply(ad(8 downto 6), acc(2 downto 0), P6(5 downto 0));
							state <= 6;
						when 6 =>
							P5(11 downto 0) := P5(8 downto 0) & "000";
							Addvec(P4, P5, h, ad4, e, 12);
							state <= 7;
						when 7 =>
							P6(11 downto 0) := P6(5 downto 0) & "000000";
							Addvec(ad4, P6, e, ad5, f, 12);
							state <= 8;
						when 8 =>
							acc3 := acc(20 downto 9);
							Addvec(acc3, ad5, f, acc3, g, 12);
							acc(20 downto 9) := acc3;
							acc(20 downto 0) := "000" & acc(20 downto 3);
							state <= 9;
						when 9 =>
							multiply(ad(2 downto 0), acc(2 downto 0), P7(5 downto 0));
							multiply(ad(5 downto 3), acc(2 downto 0), P8(5 downto 0));
							multiply(ad(8 downto 6), acc(2 downto 0), P9(5 downto 0));
							state <= 10;
						when 10 =>
							P8(11 downto 0) := P8(8 downto 0) & "000";
							Addvec(P7, P8, l, ad6, j, 12);					
							state <= 11;
						when 11 =>
							P9(11 downto 0) := P9(5 downto 0) & "000000";
							Addvec(ad6, P9, j, ad7, m, 12);
							state <= 12;
						when 12 =>
							acc4 := acc(20 downto 9);
							Addvec(acc4, ad7, m, acc4, o, 12);
							acc(20 downto 9) := acc4;
							acc(20 downto 0) := "000" & acc(20 downto 3);
							state <= 13;
						when 13 =>
							done <= '1';
							prod <= acc(17 downto 0);
							if St = '0' then
							state <= 0;
							end if;
					end case;
				end if;
			end if;
	end process;
end char;
		
					
					
				

				
					
					
					
