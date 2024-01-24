pub extern fn hello_c(str: [*c]const u8) void;
pub extern fn hello_all_c(msgs: [*c][*c]const u8, howmany: c_int) void;

pub fn main() void {
    const msg = "world";
    hello_c(msg.ptr);

    var msgs = [_][]const u8{ "hello", "world" };
    _ = &msgs;
    var msgs_for_c: [2][*c]const u8 = undefined;
    msgs_for_c[0] = msgs[0].ptr;
    msgs_for_c[1] = msgs[1].ptr;
    hello_all_c(msgs_for_c[0..].ptr, 2);
}
