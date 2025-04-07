// ~Homebrew~ ~Demo~ New Adventures of Sonic the Hedgehog, The
// #ID = 31955

//--- Enum Dictionaries ---
e_player = {
    "facingDir": {
        "unknown": 0, // Usually used during transitions and on the credits screen.
        "right":   1,
        "left":    3
    },
    /* Animation Frames:
       0x00 - 0x03 = Spin Jump, left
       0x04 = Standing, facing right
       0x05 - 0x08 = Spin Jump, right
       0x09 = Standing, facing left
       0x0b - 0x0c = Runinng, right
       0x0f - 0x10 = Running, left */
    "animStart": {
        "jumpL":  0x00,
        "standR": 0x04,
        "jumpR":  0x05,
        "standL": 0x09,
        "runR":   0x0b,
        "runL":   0x10
    },
    "animEnd": {
        "jumpL":  0x04,
        "standR": 0x05,
        "jumpR":  0x09,
        "standL": 0x0a,
        "runR":   0x0d,
        "runL":   0x11
    },
    "action": {
        "jumpL":  0,
        "standR": 1,
        "jumpR":  2,
        "standL": 3,
        "runR":   5,
        "runL":   7
    },
    "control": {
        "disabled": 0x01, // Usually due to a text box or menu being controlled.
        "enabled":  0x03, // Player can be controlled.
        "unknown":  0x17  // Mainly used during screen transitions.
    }
}

e_screen = {
    "splash":  0x0d,
    "title":   0x10,
    "z1a1":    0x06,
    "z1a2":    0x07,
    "z2a1":    0x08,
    "z2a2":    0x09,
    "z3a1":    0x0a,
    "z3a2":    0x0b,
    "clear1":  0x0c,
    "clear2":  0x05,
    "clear3":  0x0e,
    "clear4":  0x0f,
    "credits": 0x04
}

e_tbox = {
    "control": {
        "enabled":  0x01,
        "disabled": 0x19
    },
    "linesYPos": {
        0: 0x90,
        2: 0x70,
        4: 0x60
    },
    "messageID": {
        "select": 0x0a,
        "clear1": 0x31,
        "clear2": 0x32,
        "intro": 0x76
    },
    "titleCursor": {
        "z1":      1,
        "z2":      2,
        "z3":      3,
        "credits": 4
    }
}

//--- RAM ---
/* $C0A3: [16-bit] Frame Counter
          Freezing this (or at least the first bit of this) will cause certain game logic to also freeze and stop functioning until unfrozen. */
r_frameCounter = word(0x00C0A3)

/* $C0BA: [16-bit] Player X-Position
   $C0BC: [16-bit] Player Y-Position
   $C0BE: [Lower4] Player Facing Direction
          Changes between 0x0 and 0x1 while in menus.
   $C0C4: [8-bit] Player's Current Sprite
          Will increment through the animation frames dictated by 0x00c0c5 and 0x00c0c6. Also continue incrementing when a text box is active and during transitions.
   $C0C5: [8-bit] Player Animation - First Frame
          The first frame of the player's current animation; see 0x00c0c4.
   $C0C6: [8-bit] Player Animation - Loop Point
          The index after the final frame of the player's current animation. Loops back to first frame before reaching this value. See 0x00c0c4.
   $C0C9: [Lower4] Player Action State
          The player's current action. Will also switch between 0x0, 0x1, and 0x2 in certain menus.
   $C582: [8-Bit] Player Control State
   $DA5A: [16-bit] Player X-Velocity
          The player's current horizontal movement speed and direction. Value persists when a menu is open, despite the player not moving.
            0x0000 = No horizontal movement
            0x0001 - 0x0029 = Moving right (higher numbers = faster)
            0xffd6 - 0xffff = Moving left (lower numbers = faster)
   $DA5C: [16-bit] Player Y-Velocity
          The player's current vertical movement speed and direction. Value persists when a menu is open, despite the player not moving.
            0x0007 = No vertical movement (game is likely applying some downward force to keep player grounded, even when at a standstill).
            0x0000 - 0x0055 = Descending (higher numbers = faster)
            0xffbf - 0xffff = Ascending (lower numbers = faster)
   $DA5B: [8-bit] Player X-Movement Direction
          The player's current horizontal direction.
          See 0x00da5a [16-bit].
            0x00 = Right (or None, if not moving horizontally)
            0xff = Left
   $DA5D: [8-bit] Player Y-Movement Direction
          The player's current vertical direction.
          See 0x00da5a [16-bit].
            0x00 = Down (or None, if not moving vertically)
            0xff = Up */
r_player = {
        "positionX": word(0x00C0BA),
        "positionY": word(0x00C0BC),
        "velocityX": word(0x00DA5A),
        "velocityY": word(0x00DA5C),
        "moveDirX":  word(0x00DA5B), // check if size and address are correct.
        "moveDirY":  word(0x00DA5D), // check if size and address are correct.
        "facingDir": byte(0x00C0BE),
        "sprite":    byte(0x00C0C4),
        "animStart": byte(0x00C0C5),
        "animEnd":   byte(0x00C0C6),
        "action":    byte(0x00C0C9),
        "control":   byte(0x00C582)
}

// $C58F: [8-bit] Current Screen/Level
r_screen = byte(0x00C58F)

/* $C680: [8-bit][Bitflags] Input
          Stores the currently pressed input. Also see 0x00c684 for current input (matches this value) and 0x00c685 for previous input.
          Bit 0 = Right
          Bit 1 = Left
          Bit 2 = Up
          Bit 3 = Down
          Bit 4 = A
          Bit 5 = B
          Bit 6 = Select
          Bit 7 = Start */
r_input = byte(0x00C680)
r_buttonIsDown = {
    "right":  bit0(r_input) == 1,
    "left":   bit1(r_input) == 1,
    "up":     bit2(r_input) == 1,
    "down":   bit3(r_input) == 1,
    "a":      bit4(r_input) == 1,
    "b":      bit5(r_input) == 1,
    "select": bit6(r_input) == 1,
    "start":  bit7(r_input) == 1,
}

/* $C838: [8-Bit] Text Box Control State
   $C987: [8-bit] Text Box Current Y-Position
   $C988: [8-bit] Text Box Target Y-Position
          The y-position the text box will slide to when active.
   $C9AA: [8-Bit] Text Box Message ID
   $DEB6: [Lower4] Text Box Cursor Position (TITLE SCREEN ONLY)
          NOTE: This address technically refers to certain sprites or pixels being display, but can be used to check the position of the cursor on the title screen. */
r_tbox = {
    "controlState": byte(0xC838),
    "positionY": byte(0xC987),
    "positionYTarget": byte(0xC988),
    "messageID": byte(0xC9AA),
    "titleCursor": byte(0xDEB6)
}

/* $D984: [16-bit] Ring Collection?
          0x00d984 - 0x00d98e all seem to be linked to ring collection. 0x00d984 is the most consistent for detecting when a ring is collected.
          Use r_ringCollected for logic. */
r_ringCollVal = word(0xD984)
r_ringCollected = (r_player["control"] == e_player["control"] && r_ringCollVal != prev(r_ringCollVal))