const print = std.debug.print;
const std = @import("std");
const os = std.os;
const assert = std.debug.assert;

const S = struct {};

extern fn malloc(size: usize) ?[*]u8;

pub fn main() void {
    const one_plus_one: i33 = 1 + 1;
    print("1 + 1 = {}\n", .{one_plus_one});

    const seven_div_three: f32 = 7.0 / 3.0;
    print("7 / 3 = {}\n", .{seven_div_three});

    print("{}\n{}\n{}\n", .{
        true and false,
        true or false,
        !true,
    });

    var optional_value: ?[]const u8 = null;
    assert(optional_value == null);

    print("\noptional 1\n type: {}\nvalue: {?s}\n", .{
        @TypeOf(optional_value), optional_value,
    });

    optional_value = "hi";
    assert(optional_value != null);

    var number_or_error: anyerror!i32 = error.ArgNotFound;
    print("\nerror union 1\ntype: {}\nvalue: {!}\n", .{
        @TypeOf(number_or_error),
        number_or_error,
    });

    number_or_error = 1234;

    const ptr = malloc(1234) orelse return null;
    _ = ptr;
}
