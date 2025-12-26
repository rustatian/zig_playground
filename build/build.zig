const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});
    const exe = b.addExecutable(.{
        .name = "app",
        .use_llvm = true,
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/app.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    const version = b.option([]const u8, "version", "application version string") orelse "0.0.0";
    const enable_foo = detectWhetherToEnableLibFoo();

    const options = b.addOptions();

    options.addOption([]const u8, "version", version);
    options.addOption(bool, "have_libfoo", enable_foo);

    exe.root_module.addOptions("config", options);
    b.installArtifact(exe);
}

fn detectWhetherToEnableLibFoo() bool {
    return false;
}
