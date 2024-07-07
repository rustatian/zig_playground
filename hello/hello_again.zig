const std = @import("std");
const std2 = @import("std");

/// A structure for storing a timestamp, with nanosecond precision (this is a
/// multiline doc comment).
const Timestamp = struct {
    seconds: i64,
    nano: u32,

    pub fn unixEpoch() Timestamp {
        return Timestamp{
            .seconds = 0,
            .nano = 0,
        };
    }
};

pub fn main() void {
    std.debug.print("Hello, world!\n", .{});
}
