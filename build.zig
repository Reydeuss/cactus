const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const utilsModule = b.createModule(.{
        .root_source_file = b.path("src/utils/mod.zig"),
        .target = target,
        .optimize = optimize,
        .strip = true,
    });

    const exe = b.addExecutable(.{
        .name = "cactus",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .imports = &.{
                .{ .name = "utils", .module = utilsModule },
            },
            .target = target,
            .optimize = optimize,
            .strip = true,
        }),
    });

    b.installArtifact(exe);
}
