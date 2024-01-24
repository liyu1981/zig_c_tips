const std = @import("std");

pub extern fn set(name: [*c]const u8) ?*anyopaque;
pub extern fn set_all(names: [*c][*c]const u8, howmany: c_int) ?*anyopaque;
pub extern fn hello(h: ?*anyopaque) void;
pub extern fn hello_all(h: ?*anyopaque) void;

pub fn main() !void {
    {
        var h = set("hello");
        _ = &h;
        hello(h);
    }
    {
        const names = [_][]const u8{ "hello", "world" };
        var names_for_c: [2][*c]const u8 = undefined;
        names_for_c[0] = names[0].ptr;
        names_for_c[1] = names[1].ptr;
        var h = set_all(names_for_c[0..].ptr, 2);
        _ = &h;
        hello_all(h);
    }
}
