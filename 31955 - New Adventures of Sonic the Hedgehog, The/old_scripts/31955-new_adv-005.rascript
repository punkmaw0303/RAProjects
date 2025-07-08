// ~Homebrew~ ~Demo~ New Adventures of Sonic the Hedgehog, The
// #ID = 31955

//--- Lookup Functions ---
function Player_Lookup(component, value)
{
    obj = {
        "facingDirection": {
            "unknown": 0,
            "right"  : 1,
            "left"   : 3
        },
        "maxVelocity": {
            "right": 0x0029,
            "left" : 0xFFD6,
            "down" : 0x0055,
            "up"   : 0xFFBF
        },
        "animation": {
            "standR": [0x04, 0x05],
            "standL": [0x09, 0x0a],
            "jumpR" : [0x05, 0x09],
            "jumpL" : [0x00, 0x04],
            "runR"  : [0x0B, 0x0D],
            "runL"  : [0x0F, 0x11]
        },
        "action": {
            "standR": 1,
            "standL": 3,
            "jumpR" : 2,
            "jumpL" : 0,
            "runR"  : 5,
            "runL"  : 7,
        },
        "control": {
            "disabled": 0x01,
            "enabled" : 0x03,
            "unknown" : 0x17
        }
    }
    return obj[component][value]
}

function Screen_Lookup(value)
{
    obj = {
        "splash" : 0x0D, // Considered OOR for resetting achievements.
        "title"  : 0x10,
        "z1a1"   : 0x06,
        "z1a2"   : 0x07,
        "z2a1"   : 0x08,
        "z2a2"   : 0x09,
        "z3a1"   : 0x0a,
        "z3a2"   : 0x0b,
        "clear1" : 0x0C,
        "clear2" : 0x05,
        "clear3" : 0x0E,
        "clear4" : 0x0F,
        "credits": 0x04
    }
    return obj[value]
}
l_tbox = {
    "messageID": {
        "select": 0x0a,
        "clear1": 0x31,
        "clear2": 0x32,
        "intro" : 0x76
    },
    "control": {
        "enabled": 0x01,
        "disabled": 0x19
    }
}

//- RP -




//--- RAM Getters ---
//- Player -
// $C0BA: [16-bit] Player's X-Position
function Player_GetXPosition() => word(0xC0BA)

// $C0BC: [16-bit] Player's Y-Position
function Player_GetYPosition() => word(0xC0BC)

/* $C0BE: [Lower4] Player's Facing Direction
          Changes between 0 and 1 while in menus.
          (Usually is set to 0 during transitions and while on the credits screen.) */
function Player_GetFacingDirection() => byte(0xC0BE)

/* $DA5A: [16-bit] Player's X-Velocity
          Value persists while a menu is active, despite the player not moving. */
function Player_GetXVelocity() => word(0xDA5A)

/* $DA5C: [16-bit] Player's Y-Velocity
          Value persists while a menu is active, despite the player not moving.
          The value will also be 0x0007 while grounded. The game is likely continuing to
          apply downward force, despite the player bring grounded.*/
function Player_GetYVelocity() => word(0xDA5B)

/* $C0C4: [8-bit] Player's Sprite.
          increments through the frames in the range [$C0C5, $C0C6).
          Will also continue incrementing while a text box is active and during screen
          transitions. */
function Player_GetSprite() => byte(0xC0C4)

// $C0C5: [8-bit] Player's Animation - Start Frame
function Player_GetAnimationStart() => byte(0xC0C5)

// $C0C6: [8-bit] Player's Animation - End Frame
function Player_GetAnimationEnd() => byte(0xC0C6)

/* $C0C9: [Lower4] Player's Action
          The player's current action; will also switch between 0x0 - 0x2 in certain menus. */
function Player_GetAction() => byte(0xC0C9)

// $C582: [8-bit] Player's Control State
function Player_GetControl() => byte(0xC582)

//- Text Box -
// $C987: [8-bit] Text Box's Current Y-Position
function Tbox_GetYPosition() => byte (0xC987)

/* $C988: [8-bit] Text Box's Target Y-Position
          The Y-position the text box will slide to.*/
function Tbox_GetTargetYPosition() => byte(0xC988)

// $C9AA: [8-bit] Text Box Message ID
function Tbox_GetMessageID() => byte(0xC9AA)

// $C838: [8-bit] Text Box's Control State
function Tbox_GetControl() => byte(0xC838)

//- Other -
/* $C680: [8-bit][Bitflags] Input
          Stores the current combination of all inputs. */
function Input_Get() => byte(0xC680)

// $C58F: [8-bit] Current Screen
function Screen_Get() => byte(0xC58F)

/* $C0A3: [16-bit] Frame Counter
          If frozen (or at least, if bit 0 is frozen), causes various game logic and other
          things also freeze and stop working until unfrozen. */
function FrameCounter_Get() => word(0xC0A3)

/* $D984: [16-bit] Ring Collection?
          $D984 - $D98E all seem to be linked to ring collection.
          $D984 is the most consistent for detecting when a ring is collected.
          Need to pause detection while a text box is active in order to
          prevent false-positives. */
function RingCollectionValue_Get() => word(0xD984)


//--- Functions ---
function Input_IsDown(btn)
{
    i = Input_Get()
    obj = {
        "right" : bit0(i),
        "left"  : bit1(i),
        "up"    : bit2(i),
        "down"  : bit3(i),
        "a"     : bit4(i),
        "b"     : bit5(i),
        "select": bit6(i),
        "start" : bit7(i) 
    }
    
    return obj[btn] == 1
}

function RingCollected()
{
    r = RingCollectionValue_Get()
    return Player_GetControl() == PlayerLookup("control", "enabled") && r != prev(r)
}





