const GBA = @import("core.zig").GBA;

pub const Input = struct {
    var previousInput: u16 = 0;
    var currentInput: u16 = 0;

    pub const Keys = struct {
        pub const A = 1 << 0;
        pub const B = 1 << 1;
        pub const Select = 1 << 2;
        pub const Start = 1 << 3;
        pub const Right = 1 << 4;
        pub const Left = 1 << 5;
        pub const Up = 1 << 6;
        pub const Down = 1 << 7;
        pub const R = 1 << 8;
        pub const L = 1 << 9;
    };

    pub fn readInput() void {
        previousInput = currentInput;
        currentInput = ~GBA.KEYINPUT.*;
    }

    pub inline fn isKeyDown(keys: u16) bool {
        return (currentInput & keys) == keys;
    }

    pub inline fn isKeyJustPressed(keys: u16) bool {
        return (previousInput & keys) == 0 and (currentInput & keys) == keys;
    }

    pub inline fn isKeyJustReleased(keys: u16) bool {
        return (previousInput & keys) == keys and (currentInput & keys) == 0;
    }

    pub inline fn isKeyUp(keys: u16) bool {
        return (currentInput & keys) == 0;
    }
};
