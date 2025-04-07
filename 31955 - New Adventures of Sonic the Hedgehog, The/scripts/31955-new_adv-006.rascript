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

function Tbox_Lookup(component, value)
{
    obj = {
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
          prevent false-positives.
          USE THE "RingCollected()" FUNCTION INSTEAD OF THIS FOR CHEEVO LOGIC.*/
function RingCollectionValue_Get() => word(0xD984)


//--- Functions ---
// Returns if the first variable is between the second and third, inclusive.
function IsBetween(x, min, max) => min <= x && x <= max

// Returns true on the frame a ring is collected.
function RingCollected()
{
    r = RingCollectionValue_Get()
    return Player_GetControl() == PlayerLookup("control", "enabled") && r != prev(r)
}

// Checks if the player is currently within the specified bounds, inclusive.
function Player_IsWithinArea(minX, maxX, minY, maxY)
{
    x = Player_GetXPosition()
    y = Player_GetYPosition()
    
    return IsBetween(x, minX, maxX) && IsBetween(y, minY, maxY)
}

// Returns whether the specified button is currently pressed.
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

/* Returns true if the screen switched between the specified screens this frame.
   A value of -1 will act as a wildcard. */
function Screen_OnSwitch(from, to)
{
    curr = Screen_Get()
    pre = prev(curr)
    
    return curr != pre && (from == -1 || from == pre) && (to == -1 || to == curr)
}

/* Checks if the specified screen is out-of-range or is the splash screen.
   Used primarily for resetting achievement logic. */
function Screen_IsOOR(screen)
{
    return (screen < Screen_Lookup("credits") ||
        screen == Screen_Lookup("splash") ||
        screen > Screen_Lookup("title"))
}

// Checks if the specified screen is a menu.
function Screen_IsMenu(screen)
{
    return (screen == Screen_Lookup("credits") || screen == Screen_Lookup("clear2") ||
        IsBetween(screen, Screen_Lookup("clear3"), Screen_Lookup("title")))
}

// Checks if the specified screen is an Act.
function Screen_IsAct(screen)
{
    return IsBetween(screen, Screen_Lookup("z1a1"), Screen_Lookup("z3a2"))
}

/* Checks if the specified Act was cleared on this frame.
   Triggers after touching the goal post. */
function Screen_ActCleared(screen, actNum)
{
    onScreen = screen == Screen_Get()
    
    pControl = Player_GetControl()
    pDisabledThisFrame = pControl != prev(pControl) &&
        pControl == Player_Lookup("control", "disabled")
    
    correctMsg = Tbox_GetMessageID() == Tbox_Lookup("messageID", "clear" + actNum)
    
    return onScreen && pDisabledThisFrame && correctMsg
}

// Increases a tally when a ring is collected within the specified screen.
function Screen_RingTally(screen)
{
    reset = never(Screen_OnSwitch(-1, screen))
    onScreen = Screen_Get() == screen
    return repeated(8, reset && onScreen && RingCollected())
}

//--- Achievement Functions ---
function Cheevo_AllClear()
{
    s = Screen_Get()
    reset = never(Screen_IsOOR(s))
    pause = unless(Screen_IsMenu(s))
    
    c = []
    for z in range(1, 3)
    {
        for a in range(1, 2)
        {
            tmp = Screen_Lookup("z" + z + "a" + a)
            array_push(c, once(Screen_ActCleared(tmp, a)))
        }
    }
    goal = measured(tally(6, c[0], c[1], c[2], c[3], c[4], c[5]))
    
    achievement(
        title = "All Clear", points = 1, type = "win_condition",
        description = "Rech the goal post of every Act, in a single emulator session.",
        trigger = reset && pause && goal
    )
}
Cheevo_AllClear()

function Cheevo_ZoneRings(cTitle, a1Screen)
{
    a2Screen = a1Screen + 1
    s = Screen_Get()
    p = prev(s)
    
    reset = never ((s != a1Screen && s != a2Screen) ||
        (p != Screen_Lookup("title") && p != a1Screen && p != a2Screen) ||
        Screen_OnSwitch())
}
















