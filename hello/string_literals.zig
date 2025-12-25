const print = @import("std").debug.print;
const assert = @import("std").debug.assert;
const mem = @import("std").mem;

const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
const message2: [5]u8 = .{ 'h', 'e', 'l', 'l', 'o' };

comptime {
    assert(mem.eql(u8, &message, &message2));
}

const message22 = "hello";

pub fn main() !void {
    const bytes = "heelo";
    print("{}\n", .{@TypeOf(bytes)});
}
