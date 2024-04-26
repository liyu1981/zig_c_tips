const std = @import("std");

fn getFirstName() []const u8 {
    comptime var buf: [5]u8 = undefined;
    @memcpy(&buf, "hello");
    return &buf;
}

fn getLastName() []const u8 {
    comptime var buf: [5]u8 = undefined;
    @memcpy(&buf, "world");
    const final_name = buf;
    return &final_name;
}

const Name = struct {
    first: []const u8,
    last: []const u8,
};

fn getName() []const []const u8 {
    comptime {
        var names: [2][]const u8 = undefined;
        names[0] = getFirstName();
        names[1] = getLastName();
        const names_const = names;
        return &names_const;
    }
}

pub fn main() !u8 {
    std.debug.print("{s} {s}\n", .{ getName()[0], getName()[1] });
    return 0;
}
