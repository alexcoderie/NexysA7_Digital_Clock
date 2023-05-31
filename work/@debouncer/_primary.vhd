library verilog;
use verilog.vl_types.all;
entity Debouncer is
    port(
        btn             : in     vl_logic;
        clk             : in     vl_logic;
        debounced_btn   : out    vl_logic
    );
end Debouncer;
