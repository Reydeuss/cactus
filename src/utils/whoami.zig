const std = @import("std");

pub fn run() void {
    const user = std.posix.getenv("USER") orelse "nobody";
    const stdout = std.fs.File.stdout();
    var writer = stdout.writer(&.{}).interface;

    writer.print("{s}\n", .{user}) catch |err| {
        std.debug.print("whoami: {}\n", .{err});
        std.process.exit(1);
    };

    std.process.exit(0);
}
