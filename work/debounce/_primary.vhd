library verilog;
use verilog.vl_types.all;
entity debounce is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end debounce;
