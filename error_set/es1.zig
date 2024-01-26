const std = @import("std");

const MyErrorBase = error{WrongInput};

const MyError = error{
    WrongInput2,
} || MyErrorBase;

fn happy1(today_number: usize) !bool {
    if (today_number == 0) return MyError.WrongInput;
    return today_number != 13;
}

fn happy2(today_number: usize) anyerror!bool {
    if (today_number == 0) return MyError.WrongInput;
    return today_number != 13;
}

fn happy3(today_number: usize) !bool {
    _ = today_number;
    try std.io.getStdOut().writer().print("thinking...", .{});
    // return happy2(today_number);
    return false;
}

fn happy4(today_number: usize) MyErrorBase!bool {
    return happy1(today_number);
}

pub fn main() !void {
    // const n1 = happy1(5) catch |err| brk: {
    //     switch (err) {
    //         MyError.WrongInput => break :brk false,
    //     }
    // };
    // _ = n1;

    // const n2 = happy2(5) catch |err| brk: {
    //     switch (err) {
    //         MyError.WrongInput => break :brk false,
    //         else => break :brk false,
    //     }
    // };
    // _ = n2;

    // const n3 = happy1(5) catch |err| brk: {
    //     switch (err) {
    //         anyerror.WrongInput => break :brk false,
    //     }
    // };
    // _ = n3;

    // const n4 = happy1(5) catch |err| brk: {
    //     switch (err) {
    //         error.WrongInput => break :brk false,
    //     }
    // };
    // _ = n4;

    // const n5 = happy3(5) catch |err| brk: {
    //     switch (err) {
    //         MyError.WrongInput => break :brk false,
    //         else => break :brk true,
    //     }
    // };
    // _ = n5;

    const n6 = happy4(5) catch |err| brk: {
        switch (err) {
            MyErrorBase.WrongInput => break :brk false,
            else => break :brk true,
        }
    };
    _ = n6;
}
