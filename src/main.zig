const std = @import("std");
const utils = @import("utils");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        std.debug.print("Usage: cactus <command>\n", .{});
        std.debug.print("Commands supported:\n", .{});
        for ([_][]const u8{"whoami", "yes", "true", "false"}) |cmd| {
            std.debug.print("> {s}\n", .{cmd});
        }
        std.process.exit(2);
    }

    if (args.len > 2) {
        std.debug.print("No arguments are supported currently!\n", .{});
        std.process.exit(2);
    }

    const command = args[1];

    if (streq(command, "yes")) {
        utils.yes.run();
    } else if(streq(command, "true")) {
        utils.@"true".run();
    } else if(streq(command, "false")) {
        utils.@"false".run();
    } else if(streq(command, "whoami")) {
        utils.whoami.run();
    } else {
        std.debug.print("Error: command {s} unknown\n", .{command});
    }
}

fn streq(a: []const u8, b: []const u8) bool {
    return std.mem.eql(u8, a, b);
}
