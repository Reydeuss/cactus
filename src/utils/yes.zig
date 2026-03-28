const std = @import("std");

const RETURN_SUCCESS: u8 = 0;
const RETURN_FAIL: u8 = 1;
const BUFSIZE: usize = 128 * 1024;

pub fn run() void {
    var buf: [BUFSIZE]u8 = undefined;
    constructBuf(&buf, 'y');

    const stdout = std.fs.File.stdout();
    while(true) {
        stdout.writeAll(&buf) catch |err| {
            if (err == error.BrokenPipe) {
                break;
            }

            std.debug.print("yes: {}\n", .{err});
            std.process.exit(RETURN_FAIL);
        };
    }

    std.process.exit(RETURN_SUCCESS);
}

fn constructBuf(buf: *[BUFSIZE]u8, c: u8) void {
    var i: usize = 0;
    while (i < BUFSIZE) : (i += 2) {
        buf[i] = c;
        buf[i+1] = '\n';
    }
}
