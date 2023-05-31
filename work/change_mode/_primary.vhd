library verilog;
use verilog.vl_types.all;
entity change_mode is
    port(
        reset           : in     vl_logic;
        change_mode_signal: in     vl_logic;
        mode            : out    vl_logic_vector(2 downto 0)
    );
end change_mode;
