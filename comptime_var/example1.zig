const std = @import("std");
const testing = std.testing;

fn getName() []const u8 {
    comptime var buf: [9]u8 = undefined;
    // In practice there would likely be more complex logic here to populate `buf`.
    @memcpy(&buf, "some name");
    const final_name = buf;
    return &final_name;
}

pub fn main() !u8 {
    try testing.expectEqualSlices(u8, "some name", getName());
    return 0;
}
