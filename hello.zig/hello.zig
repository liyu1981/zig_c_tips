const std = @import("std");

pub export fn hello(buf: [*c]u8, buf_len: usize) u8 {
    const h = "hello";
    const to_copy_len = @min(buf_len, h.len);
    for (0..to_copy_len) |i| buf[i] = h[i];
    return to_copy_len;
}

pub export fn test1(allocator: std.mem.Allocator) void {
    _ = allocator;
}
