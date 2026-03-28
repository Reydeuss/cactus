# Cactus

A minimal coreutils clone written in Zig, implementing:
- `yes` - print a line repeatedly
- `true` - exit with success
- `false` - exit with failure
- `whoami` - print current user

## Building
```bash
zig build
./zig-out/bin/cactus <command>
```

## Usage
```bash
./zig-out/bin/cactus yes
./zig-out/bin/cactus whoami
./zig-out/bin/cactus true
./zig-out/bin/cactus false
```

A learning project for Zig fundamentals.
