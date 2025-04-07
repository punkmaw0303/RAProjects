// ~Homebrew~ ~Demo~ New Adventures of Sonic the Hedgehog, The
// #ID = 31955
// prev = value on previous frame (delta), prior = previous DIFFERENT value

//--- RAM Getters ---
// $C0BA: [16-bit] Player X-Position
function Player_GetXPosition() => word(0x00C0BA)

// $C0BC: [16-bit] Player Y-Position
function Player_GetYPosition() => word(0x00C0BC)

/* $DA5A: [16-bit] Player X-Velocity
          The player's current horizontal movement speed and direction. Value persists when a menu is open, despite the player not moving.
                     0x0000 = No horizontal movement
            0x0001 - 0x0029 = Moving right (higher numbers = faster)
            0xffd6 - 0xffff = Moving left (lower numbers = faster) */
function Player_GetXVelocity() => word(0x00DA5A)

/* $DA5C: [16-bit] Player Y-Velocity
          The player's current vertical movement speed and direction. Value persists when a menu is open, despite the player not moving.
            0x0007 = No vertical movement (game is likely applying some downward force to keep player grounded, even when at a standstill).
            0x0000 - 0x0055 = Descending (higher numbers = faster)
            0xffbf - 0xffff = Ascending (lower numbers = faster) */
function Player_GetYVelocity() => word(0x00DA5C)

/* $C0BE: [Lower4] Player Facing Direction
          Changes between 0x0 and 0x1 while in menus. */
function Player_GetFacingDirection() => byte(0x00C0BE)

/* $C0C4: [8-bit] Player's Current Sprite
          Will increment through the animation frames dictated by 0x00c0c5 and 0x00c0c6.
          Also continues incrementing when a text box is active and during transitions. */
function Player_GetSprite() => byte(0x00C0C4)

// $C0C5: [8-bit] Player Animation - First Frame
function Player_GetAnimationStart() => byte(0x00C0C5)

// $C0C6: [8-bit] Player Animation - Loop Point
function Player_GetAnimationEnd() => byte(0x00C0C6)

/* $C0C9: [Lower4] Player Action State
          The player's current action. Will also switch between 0x0, 0x1, and 0x2 in certain menus. */
function Player_GetAction() => byte(0x00C0C9)

// $C582: [8-Bit] Player Control State
function Player_GetControl() => byte(0x00C582)

//- Text Box-
// $C838: [8-Bit] Text Box Control State
function Tbox_GetControl() => byte(0x00C838)

// $C987: [8-bit] Text Box Current Y-Position
function Tbox_GetYPosition() => byte(0x00C987)

// $C988: [8-bit] Text Box Target Y-Position
function Tbox_GetTargetYPosition() => byte(0x00C988)

// $C9AA: [8-Bit] Text Box Message ID
function Tbox_GetMessageID() => byte(0x00C9AA)

/* $DEB6: [8-bit] Text Box Cursor Position (TITLE SCREEN ONLY)
          NOTE: This address technically refers to certain sprites or pixels being display, but can be used to check the position of the cursor on the title screen. */
function Tbox_GetTitleCursorPosition() => byte(0x00DEB6)

//- Other -
/* $C680: [8-bit][Bitflags] Input
          Stores the currently pressed input. Also see 0x00c684 for current input (matches this value) and 0x00c685 for previous input. */
function Input_Get() => byte(0x00C680)

// $C58F: [8-bit] Current Screen/Level
function Screen_Get() => byte(0x00C58F)

/* $D984: [16-bit] Ring Collection?
          0x00d984 - 0x00d98e all seem to be linked to ring collection. 0x00d984 is the most consistent for detecting when a ring is collected.
          USE THE RingCollected() FUNCTION INSTEAD OF THIS FOR ACHIEVEMENT LOGIC!!! */
function Rings_GetCollectionValue() => word(0x00D984)

/* $C0A3: [16-bit] Frame Counter
          Freezing this (or at least, the first bit of this) will cause certain game logic to also freeze and stop functioning until unfrozen. */
function FrameCounter_Get() => word(0x00C0A3)

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
        "z3a1"   : 0x0A,
        "z3a2"   : 0x0B,
        "clear1" : 0x0C,
        "clear2" : 0x05,
        "clear3" : 0x0E,
        "clear4" : 0x0F,
        "credits": 0x04
    }
    return obj[value]
}

function Screen_MetaLookup(category, value)
{
    obj = {
        "zoneName": {
            Screen_Lookup("splash"): "splash",
            Screen_Lookup("title"): "title",
            Screen_Lookup("z1a1"): "Peridot Coast",
            Screen_Lookup("z1a2"): "Peridot Coast",
            Screen_Lookup("z2a1"): "Marble Valley",
            Screen_Lookup("z2a2"): "Marble Valley",
            Screen_Lookup("z3a1"): "Robotropolis",
            Screen_Lookup("z3a2"): "Robotropolis",
            Screen_Lookup("clear1"): "clear 1",
            Screen_Lookup("clear2"): "clear 2",
            Screen_Lookup("clear3"): "clear 3",
            Screen_Lookup("clear4"): "clear 4",
            Screen_Lookup("credits"): "credits"
        },
        "fullName": {
            Screen_Lookup("splash"): "splash screen",
            Screen_Lookup("title"): "title screen",
            Screen_Lookup("z1a1"): "Peridot Coast, Act 1",
            Screen_Lookup("z1a2"): "Peridot Coast, Act 2",
            Screen_Lookup("z2a1"): "Marble Valley, Act 1",
            Screen_Lookup("z2a2"): "Marble Valley, Act 2",
            Screen_Lookup("z3a1"): "Robotropolis, Act 1",
            Screen_Lookup("z3a2"): "Robotropolis, Act 2",
            Screen_Lookup("clear1"): "Act Clear 1",
            Screen_Lookup("clear2"): "Act Clear 2",
            Screen_Lookup("clear3"): "Act Clear 3",
            Screen_Lookup("clear4"): "Act Clear 4",
            Screen_Lookup("credits"): "credits screen"
        }
    }
    return obj[category][value]
}

//--- Helper Functions ---
function IsBetween(value, min, max) => min <= value && value <= max

// Contains true when a ring is collected.
function RingCollected()
{
    r = Rings_GetCollectionValue()
    return Player_GetControl() == Player_Lookup("control", "enabled") && r != prev(r)
}

// Returns whether or not the specified button is currently pressed.
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
    isMenu = false
    menus = ["title", "clear1", "clear2", "clear3", "clear4", "credits"]
    for i in range (0, 5)
    {
        isMenu = isMenu || (screen == Screen_Lookup(menus[i]))
    }
    
    return isMenu
}

// Checks if the specified screen is an Act.
function Screen_IsAct(screen)
{
    return IsBetween(screen, Screen_Lookup("z1a1"), Screen_Lookup("z3a2"))
}

// Checks for when the specified Act is cleared.
function Screen_ActCleared(screen, actNum)
{
    corrScreen = screen == Screen_Get()
    
    pc = Player_GetControl()
    pcDisabledOnFrame = pc != prev(pc) && pc == Player_Lookup("control", "disabled")
    
    corrMsg = Tbox_GetMessageID() == Tbox_Lookup("messageID", "clear" + actNum)
    
    return corrScreen && pcDisabledOnFrame && corrMsg
}

// Keeps a tally for the number of rings collected on the specified screen.
function Screen_RingTally(screen)
{
    onScreen = Screen_Get() == screen
    return repeated(8, onScreen && RingCollected())
}

//--- Achievements ---
//- Functions -
function Cheevo_AllClear()
{
    s = Screen_Get()
    reset = never(Screen_IsOOR(s))
    pause = unless(Screen_IsMenu(s))
    
    // Tally each of the Acts cleared.
    c = []
    for i in range(1, 3)
    {
        for j in range(1, 2)
        {
            a = Screen_Lookup("z" + i + "a" + j)
            array_push(c, once(Screen_ActCleared(a, j)))
        }
    }
    goal = measured(tally(6, c[0], c[1], c[2], c[3], c[4], c[5]))
    
    achievement(
        title = "All Clear", points = 1, type = "win_condition",
        description = "Reach the goal post of every Act, in a single emulator session.",
        trigger = reset && pause && goal
    )
}

function Cheevo_ZoneRings(aTitle, a1Screen)
{
    a2Screen = a1Screen + 1
    s = Screen_Get()
    zName = Screen_MetaLookup("zoneName", a1Screen)
    
    // Reset when not in one of the Zone's Acts OR when going in an unexpected order.
    reset = never(s < a1Screen || s > a2Screen || 
        (Screen_OnSwitch(-1, a2Screen) && prev(s) != a1Screen))
    
    // Require entering Act 1 from the title screen.
    start = once(Screen_OnSwitch(Screen_Lookup("title"), a1Screen))
    
    // Complete when 8 rings are collected in each Act.
    goal = measured(tally(16, Screen_RingTally(a1Screen), Screen_RingTally(a2Screen)))
    
    achievement(
        title = aTitle, points = 2,
        description = "Collect all of the rings across both Acts of " + zName + ", in a single run.",
        trigger = reset && start && goal
    )
}

/*
achievement(
    title = "All Rings, All Zones, All Done!", points = 0,
    description = "Collect all of the rings in every Act, in a single session. (Returning to an Act will require you to recollect all of the rings for that Act.)",
    trigger = never(Screen_Get() < 0x04) && never(Screen_Get() == 0x0D) && never(Screen_Get() > 0x10) &&
              unless(Screen_Get() == 0x04) && unless(Screen_Get() == 0x05) && unless(Screen_Get() == 0x0C) &&
              unless((Screen_Get() >= 0x0E && Screen_Get() <= 0x10)) &&
              measured(tally(48, repeated(8,
                  Screen_Get() == 0x06 && Player_GetControl() == 0x03 &&
                  Rings_GetCollectionValue() != prev(Rings_GetCollectionValue()) &&
                  never(Screen_Get() != prev(Screen_Get()) && Screen_Get() == 0x06)), repeated(8,
                  Screen_Get() == 0x07 && Player_GetControl() == 0x03 &&
                  Rings_GetCollectionValue() != prev(Rings_GetCollectionValue()) &&
                  never(Screen_Get() != prev(Screen_Get()) && Screen_Get() == 0x07)), repeated(8,
                  Screen_Get() == 0x08 && Player_GetControl() == 0x03 &&
                  Rings_GetCollectionValue() != prev(Rings_GetCollectionValue()) &&
                  never(Screen_Get() != prev(Screen_Get()) && Screen_Get() == 0x08)), repeated(8,
                  Screen_Get() == 0x09 && Player_GetControl() == 0x03 &&
                  Rings_GetCollectionValue() != prev(Rings_GetCollectionValue()) &&
                  never(Screen_Get() != prev(Screen_Get()) && Screen_Get() == 0x09)), repeated(8,
                  Screen_Get() == 0x0A && Player_GetControl() == 0x03 &&
                  Rings_GetCollectionValue() != prev(Rings_GetCollectionValue()) &&
                  never(Screen_Get() != prev(Screen_Get()) && Screen_Get() == 0x0A)), repeated(8,
                  Screen_Get() == 0x0B && Player_GetControl() == 0x03 &&
                  Rings_GetCollectionValue() != prev(Rings_GetCollectionValue()) &&
                  never(Screen_Get() != prev(Screen_Get()) && Screen_Get() == 0x0B)))
              )
)
*/

/* RING RUSHES, 5 points each */

function Cheevo_RepeatIntro()
{
    s = Screen_Get()
    c = Tbox_GetControl()
    msg = Tbox_GetMessageID()
    
    // Reset if the screen is not Act 1 of any Zone.
    a = []
    for i in range(1, 3)
    {
        array_push(a, Screen_Lookup("z" + i + "a1"))
    }
    reset = never(s != a[0] && s != a[1] && s != a[2])
    
    // Start once the initial intro text box is displayed.
    sharedLogic = c != prev(c) && c == Tbox_Lookup("control", "enabled") &&
        msg == Tbox_Lookup("messageID", "intro")
    start = once(sharedLogic && msg != prev(msg))
    
    // Check for the frame in which the intro text box reappears.
    goal = once(sharedLogic && msg == prev(msg))
    
    achievement(
        title = "Can You Repeat That?", points = 0,
        description = "Reactivate the intro text in the first Act of any Zone.",
        trigger = reset && start && goal
    )
}

function Cheevo_NoFall()
{
    s = Screen_Get()
    a = Screen_Lookup("z1a1")
    yPos = Player_GetYPosition()
    yLimit = 0x1E80 - 10 // The starting position for the player, plus a little bit in case of errors.
    pControl = Player_GetControl()
    tControl = Tbox_GetControl()
    
    
    isFalling = yPos < prev(yPos)
    
    // Reset if the screen is incorrect OR if the player falls from above to below yLimit.
    reset = never(s != a || (prev(yPos) <= yLimit && yPos > yLimit))
    
    // Start only when the screen has switched to the correct Act.
    start = once(Screen_OnSwitch(-1, a))
    
    goal = trigger_when(Screen_RingTally(a))
    
    achievement(
        title = "CHALLENGE Z1A1: NO FALL", points = 2,
        description = "Collect all of the rings in Peridot Coast, Act 1 without returning to solid ground after jumping once.",
        trigger = reset && start && goal
    )
}

function Cheevo_WithinArea(aTitle, numPoints, desc, screenName, minX, maxX, minY, maxY)
{
    s = Screen_Get()
    a = Screen_Lookup(screenName)
    x = Player_GetXPosition()
    y = Player_GetYPosition()
    
    reset = never(s != a)
    goal = once(IsBetween(x, minX, maxX) && IsBetween(y, minY, maxY))
    
    achievement(
        title = aTitle, points = numPoints,
        description = desc,
        trigger = reset && goal
    )
}

function Cheevo_HoldRight(aTitle, screenName, actNum)
{
    s = Screen_Get()
    a = Screen_Lookup(screenName)
    fullName = Screen_MetaLookup("fullName", a)
    v = Player_GetXVelocity()
    c = Player_GetControl()
    e = Player_Lookup("control", "enabled")
    
    // Reset if on the incorrect screen OR...
    reset = never(s != a || (v < prev(v) || v >= 0xEE00))
    
    // Pause if the player just regained control.
    pause = unless(c == e && c != prev(c))
    
    /* Require the screen changing and then the player moves right to begin.
       Separated so the primed icon can appear when loading into the level,
       without needing the press right for it to appear. */
    startPrimer = once(Screen_OnSwitch(-1, s))
    //start2 = once(prev(v) <= 0 && v > prev(v))
    
    // Trigger upon reaching the goal post.
    goal = once(Screen_ActCleared(a, actNum))
    
    achievement(
        title = aTitle, points = 3,
        description = "Reach the goal post of " + fullName + " without pressing left, letting go of right, nor colliding with any walls.",
        trigger = reset && pause && startPrimer && trigger_when(goal)
    )
}

function Cheevo_Credits()
{
    s = Screen_Get()
    
    achievement(
        title = "Credit to the Creators", points = 0,
        description = "View the credits.",
        trigger = Screen_OnSwitch(prev(s), s) && s == Screen_Lookup("credits")
    )
}

// Contains logic shared by both achievement and leaderboard speedruns.
function Speedrun_SharedLogic(screen, actNum)
{
    start = Screen_OnSwitch(-1, a)
    reset = screen != Screen_Get()
    goal = Screen_ActCleared(screen, actNum) && Screen_RingTally(screen)
    
    return start && reset && goal
}

//- Definitions -
Cheevo_AllClear()

Cheevo_ZoneRings("Metal Detector", Screen_Lookup("z1a1"))
Cheevo_ZoneRings("Gold Mine", Screen_Lookup("z2a1"))
Cheevo_ZoneRings("Ringtropolis", Screen_Lookup("z3a1"))

function Cheevo_Speedrun(aTitle, screenName, actNum, seconds)
{
    f = seconds * 60
    s = Screen_Get()
    a = Screen_Lookup(screenName)
    c = FrameCounter_Get()
    
    shared = Speedrun_SharedLogic(screen)
}

// RING RUSH Z1A1, "Quick and Easy"
// RING RUSH Z1A2, "Peridot Perfection"
// RING RUSH Z2A1, ""
// RING RUSH Z2A2, "Marble Master"
// RING RUSH Z3A1, "Robo Ring Rush"
// RING RUSH Z3A2, "Down to the Wire"

Cheevo_RepeatIntro()

Cheevo_NoFall()

Cheevo_WithinArea(
    "It's Green Hill, Not Blue Hill", 0,
    "Try (and fail) to land on the blue hill in Peridot Coast, Act 2.",
    "z1a2", 0x4C00, 0x4F00, 0x1B30, 0x1CB0
)

Cheevo_HoldRight("Hold Right to Win", "z2a1", 1)
Cheevo_HoldRight("Vaulting through the Valley", "z2a2", 2)

Cheevo_WithinArea(
    "Welcome to Robotropolis!", 1,
    "Find the hidden statue in the background of Robotropolis, Act 2.",
    "z3a2", 0x7C00, 0x7E00, 0x1C40, 0x1E90
)

Cheevo_Credits()


//--- Leaderboards ---


//--- Rich Presence ---

