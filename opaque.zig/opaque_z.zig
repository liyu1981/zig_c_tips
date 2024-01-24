const std = @import("std");

pub const struct_Op = opaque {};
// pub const struct_Op = extern struct {
//     name: [*c]u8,
//     names: [*c][*c]u8,
//     howmany: c_int,
// };

pub const Op_t = ?*struct_Op;
pub extern fn new_op(name: [*c]const u8) Op_t;
pub extern fn new_op_all(names: [*c][*c]const u8, howmany: c_int) Op_t;
pub extern fn free_op(op: Op_t) void;
pub extern fn hello(op: Op_t) void;
pub extern fn hello_all(op: Op_t) void;

pub fn main() !void {
    {
        const maybe_op: Op_t = new_op("world");
        if (maybe_op) |op| {
            hello(op);
            free_op(op);
        }
    }
    {
        const names = [_][]const u8{ "hello", "world" };
        var names_for_c: [2][*c]const u8 = undefined;
        names_for_c[0] = names[0].ptr;
        names_for_c[1] = names[1].ptr;
        const maybe_op: Op_t = new_op_all(names_for_c[0..].ptr, 2);
        if (maybe_op) |op| {
            hello_all(op);
            free_op(op);
        }
    }
    // {
    //     const names = [_][]const u8{ "hello", "world" };
    //     var zig: [3:0]u8 = undefined;
    //     zig[0] = 'z';
    //     zig[1] = 'i';
    //     zig[2] = 'g';
    //     zig[3] = 0;
    //     var names_for_c: [2][*c]const u8 = undefined;
    //     names_for_c[0] = names[0].ptr;
    //     names_for_c[1] = names[1].ptr;
    //     var maybe_op = new_op_all(names_for_c[0..].ptr, 2);
    //     _ = &maybe_op;
    //     if (maybe_op != null) {
    //         std.debug.print("{any}\n", .{maybe_op.?.names[2]});
    //         var zig_s = zig[0..3];
    //         _ = &zig_s;
    //         std.debug.print("{any}\n", .{zig_s});
    //         maybe_op.?.names[2] = zig_s.ptr;
    //         hello_all(maybe_op.?);
    //         //free_op(maybe_op.?);
    //     }
    // }
}
