const std = @import("std");
const testing = std.testing;

fn formatName(writer: anytype, name: anytype) !void {
    const fmt = comptime brk: {
        var fmt_buf: [32 * 4]u8 = undefined;
        var fmt_len: usize = 0;
        for (0..name.len) |i| {
            if (i != 0) {
                fmt_buf[fmt_len] = ' ';
                fmt_len += 1;
            }
            @memcpy(fmt_buf[fmt_len .. fmt_len + 3], "{s}");
            fmt_len += 3;
        }
        break :brk fmt_buf[0..fmt_len];
    };

    try writer.print(fmt, name);
}

// fn formatName(writer: anytype, name: anytype) !void {
//     const fmt = comptime brk: {
//         var fmt_buf: [32 * 4]u8 = undefined;
//         var fmt_len: usize = 0;
//         for (0..name.len) |i| {
//             if (i != 0) {
//                 fmt_buf[fmt_len] = ' ';
//                 fmt_len += 1;
//             }
//             @memcpy(fmt_buf[fmt_len .. fmt_len + 3], "{s}");
//             fmt_len += 3;
//         }
//         var fmt_final: [fmt_len]u8 = undefined;
//         for (0..fmt_len) |i| fmt_final[i] = fmt_buf[i];
//         break :brk fmt_final;
//     };

//     try writer.print(&fmt, name);
// }

pub fn main() !u8 {
    var buf = std.ArrayList(u8).init(std.heap.page_allocator);
    defer buf.deinit();
    try formatName(buf.writer(), .{ "Samus", "Aran" });
    std.debug.print("{s}\n", .{buf.items});

    return 0;
}
