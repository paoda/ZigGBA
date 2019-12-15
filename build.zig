const Builder = @import("std").build.Builder;
usingnamespace @import("GBA/builder.zig");

pub fn build(b: *Builder) void {
    const first = addGBAExecutable(b, "first", "examples/first/first.zig");
    const mode3Draw = addGBAExecutable(b, "mode3draw", "examples/mode3draw/mode3draw.zig");
}
