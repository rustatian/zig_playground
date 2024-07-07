const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdIn().writer();
    try stdout.print("Hello, {s}!\n", .{"world"});
}
