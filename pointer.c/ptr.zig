const std = @import("std");
pub export fn hello(str: [*c]const u8, len: usize) void {
    std.debug.print("{s}\n", .{str[0..len]});
}
pub export fn hello_all(msgs: [*c][*c]const u8, len: usize) void {
    for (0..len) |i| {
        var msg_ptr = msgs[i];
        var j: usize = 0;
        while (true) : (j += 1) {
            if (msg_ptr[j] == 0) {
                break;
            }
        }
        std.debug.print("{s}\n", .{msg_ptr[0..j]});
    }
}
