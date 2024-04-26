pub fn main() !u8 {
    const x = comptime @as(u32, 123); // mark 1
    var ptr: *const u32 = undefined;
    ptr = &x;
    if (ptr.* != 123) return error.TestFailed;
    return 0;
}
