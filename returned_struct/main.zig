const std = @import("std");

const MyBuf = struct {
    buf: [8]u8 = undefined,
    buf_ptr: [*]u8 = undefined,

    pub fn init() MyBuf {
        var b = MyBuf{};
        for (0..8) |i| b.buf[i] = 0;
        b.buf_ptr = &b.buf;
        return b;
    }
};

pub fn main() !u8 {
    var b = MyBuf.init();
    b.buf_ptr[0] = 'h';
    b.buf_ptr[1] = 'i';
    std.debug.print("1: {s}\n", .{b.buf_ptr[0..2]});
    std.debug.print("2: {s}\n", .{b.buf});
    return 0;
}
