// ~Homebrew~ ~Demo~ New Adventures of Sonic the Hedgehog, The
// #ID = 31955

//--- Variables & Lookups ---
Player_Velocity_X_MaxRight = 0x0029
Player_Velcoity_X_MaxLeft = 0xFFD6

Player_FacingDirection = {
    "other": 0,
    "right": 1,
    "left" : 3
}

Player_ActionState = {
    "jump_left"  : 0,
    "stand_right": 1,
    "jump_right" : 2,
    "stand_left" : 3,
    "run_right"  : 5,
    "run_left"   : 7
}

Player_ActionStateRP = {
    Player_ActionState["stand_left"] : "in",
    Player_ActionState["stand_right"]: "in",
    Player_ActionState["run_left"]   : "running through",
    Player_ActionState["run_right"]  : "running through",
    Player_ActionState["jump_left"]  : "jumping through",
    Player_ActionState["jump_right"] : "jumping through"
}

Player_ControlState = {
    "disabled": 0x01,
    "enabled" : 0x03,
    "other"   : 0x17
}

Screen = {
    "splash" : 0x0D,
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

Screen_ZoneName = {
    Screen["splash"]: "splash screen",
    Screen["title"] :  "title screen",
    Screen["z1a1"]  : "Peridot Coast",
    Screen["z1a2"]  : "Peridot Coast",
    Screen["z2a1"]  : "Marble Valley",
    Screen["z2a2"]  : "Marble Valley",
    Screen["z3a1"]  :  "Robotropolis",
    Screen["z3a2"]  :  "Robotropolis",
}

Screen_FullName = {
    Screen["splash"] : "splash screen",
    Screen["title"]  : "title screen",
    Screen["z1a1"]   : "Peridot Coast, Act 1",
    Screen["z1a2"]   : "Peridot Coast, Act 2",
    Screen["z2a1"]   : "Marble Valley, Act 1",
    Screen["z2a2"]   : "Marble Valley, Act 2",
    Screen["z3a1"]   : "Robotropolis, Act 1",
    Screen["z3a2"]   : "Robotropolis, Act 2",
    Screen["clear1"] : "act clear screen #1",
    Screen["clear2"] : "act clear screen #2",
    Screen["clear3"] : "act clear screen #3",
    Screen["clear4"] : "act clear screen #4",
    Screen["credits"]: "credits screen"
}

Screen_MenuRP = {
    Screen["splash"]: "is on the splash screen",
    Screen["title"]: "is on the title screen",
    Screen["clear1"]: "has cleared a Zone",
    Screen["clear2"]: "has cleared a Zone",
    Screen["clear3"]: "has cleared a Zone",
    Screen["clear4"]: "has cleared a Zone",
    Screen["credits"]: "is viewing the credits"
}

TBox_ControlState = {
    "enabled" : 0x01,
    "disabled": 0x19
}

TBox_MessageID = {
    "select": 0x0a,
    "clear1": 0x31,
    "clear2": 0x32,
    "intro" : 0x76
}

//--- RAM Getters ---
/* $C0A3: [16-bit] Frame Counter
          If frozen (or most likely, if bit 0 is frozen), causes various game logic and other
          things also freeze and stop working until unfrozen. */
function Get_FrameCount() => word(0xC0A3)

// $C0BA: [16-bit] Player's X-Position
function Get_Player_Position_X() => word(0xC0BA)

// $C0BC: [16-bit] Player's Y-Position
function Get_Player_Position_Y() => word(0xC0BC)

/* $C0BE: [Lower4] Player's Facing Direction
          Changes between 0 and 1 while in menus.
          (Usually is set to 0 during transitions and while on the credits screen.)
          1 = Right
          3 = Left */
function Get_Player_FacingDirection() => byte(0xC0BE)

/* $DA5A: [16-bit] Player's X-Velocity
          Value persists while a menu is active, despite the player not moving.
                   0x0000 = No horizontal movement
          0x0001 - 0x0029 = Moving right (higher numbers = faster)
          0xFFD6 - 0XFFFF = Moving left  ( lower numbers = faster) */
function Get_Player_Velocity_X() => word(0xDA5A)

/* $DA5C: [16-bit] Player's Y-Velocity
          Value persists while a menu is active, despite the player not moving.
          The value will also be 0x0007 while grounded. The game is likely continuing to
          apply downward force, despite the player bring grounded.
          0x0001 - 0x0055 = Descending (higher numbers = faster)
          0xFFBF - 0XFFFF = Ascending  ( lower numbers = faster) */
function  Get_Player_Velocity_Y() => word(0xDA5B)

/* $C0C4: [8-bit] Player's Current Sprite
          Will increment through the animations frames between $C0C5 (inclusive) and
          $C0C6 (exclusive). Also continues incrementing when a text box is active and
          during screen transitions.
          0x00 - 0x03 = Spin Jump, Left
                 0x04 =  Standing, Right
          0x05 - 0x08 = Spin Jump, Right
                 0x09 =  Standing, Left
          0x0B - 0x0C =   Running, Right
          0x0F - 0x10 =   Running, Left
          */
function Get_Player_CurrentSprite() => byte(0xC0C4)

/* $C0C5: [8-bit] Player's Current Animation - First Frame
          The first frame of the player's current animation; see $C0C4. */
function Get_Player_Animation_FirstFrame() => byte(0xC0C5)

/* $C0C6: [8-bit] Player's Current Animation - Loop Point
          The index after the final frame of the player's animation; see $C0C4.
          Loops back to the first frame without displaying this frame. */
function Get_Player_Animation_LoopPoint() => byte(0xC0C6)

/* $C0C9: [Lower4] Player's Action State
          The player's current action; will also switch between 0x0 - 0x2 in certain menus.
          0 = Spin Jump, Left
          1 =  Standing, Right
          2 = Spin Jump, Right
          3 =  Standing, Left
          5 =   Running, Right
          7 =   Running, Left*/
function Get_Player_ActionState() => byte(0xC0C9)

/* $C582: [8-bit] Player Control State
          0x01 = Disabled, usually due to a text box or menu being controlled.
          0x03 = Enabled, player can be controlled.
          0x17 = Unknown, used during screen transitions. */
function Get_Player_ControlState() => byte(0xC582)

/* $C58F: [8-bit] Current Screen
          OASYS Splash Screen = 0x0D
          Title               = 0x10
          Zone 1, Act 1       = 0x06
          Zone 1, Act 2       = 0x07
          Zone 2, Act 1       = 0x08
          Zone 2, Act 2       = 0x09
          Zone 3, Act 1       = 0x0A
          Zone 3, Act 2       = 0x0B
          Zone Clear 1        = 0x0C
          Zone Clear 2        = 0x05
          Zone Clear 3        = 0x0E
          Zone Clear 4        = 0x0F
          Credits             = 0x04 */
function Get_Screen() => byte(0xC58F)

/* $C680: [8-bit][Bitflags] Input
          Stores the currently pressed input.
          Also see $C684 for the current input (always matches this value) and
          $C685 for the input on the previous frame.
          
          If the variable "button" is the name of a button, only returns whether that
          button is pressed as a 0 or 1. Otherwise, return the entire chunk of memory.
          
          Bit 0 = Right
          Bit 1 = Left
          Bit 2 = Up
          Bit 3 = Down
          Bit 4 = A
          Bit 5 = B
          Bit 6 = Select
          Bit 7 = Start
          */
function Get_Input() => byte(0xC680)

/* $C838: [8-bit] Text Box's Control State
          0x01 = Enabled
          0x19 = Disabled */
function Get_TBox_ControlState() => byte(0xC838)

// $C987: [8-bit] Text Box's Current Y-Position
function Get_TBox_Position_Y() => byte (0xC987)

/* $C988: [8-bit] Text Box's Target Y-Position
          The Y-position the text box will slide to.
          0x60 = 4 lines of text
          0x70 = 2 lines of text
          0x90 = Off-screen */
function Get_TBox_Position_TargetY() => byte(0xC988)

/* $C9AA: [8-bit] Text Box Message ID
          0x0a = Zone Selection
          0x31 = Act 1 Cleared
          0x32 = Act 2 Cleared
          0x76 = Level Intro */
function Get_TBox_MessageID() => byte(0xC9AA)

/* $D984: [16-bit] Ring Collection?
          $D984 - $D98E all seem to be linked to ring collection.
          $D984 is the most consistent for detecting when a ring is collected.
          May need to pause detection while a text box is active
          to prevent falsepositives. */
function Get_RingCollection_Value() => word(0xD984)

//--- Functions ---
/* Input Helper Function:
   Returns whether or not a particular button is currently pressed down. */
function Input_IsDown(button)
{
    input = Get_Input()
    
    if (button == "right")
        input = bit0(input)
    else if (button == "left")
        input = bit1(input)
    else if (button == "up")
        input = bit2(input)
    else if (button == "down")
        input = bit3(input)
    else if (button == "a")
        input = bit4(input)
    else if (button == "b")
        input = bit5(input)
    else if (button == "select")
        input = bit6(input)
    else if (button == "start")
        input = bit7(input)
    else
        input = 0
        
    return input == 1
}

/* Ring Collection Helper Function:
   Returns true when a ring is collected. */
function RingCollected() =>
    Get_Player_ControlState() == Player_ControlState["enabled"] &&
    Get_RingCollection_Value() != prev(Get_RingCollection_Value())

// Checks if the screen switched from one screen to another. Use -1 to represent any screen.
function Screen_Switch(from, to)
{
    curr = Get_Screen()
    pre = prev(Get_Screen())
    
    return curr != pre &&
        (from == -1 || from == pre) &&
        (to == -1 || to == curr)
}

// Checks if the screen is out-of-range; as in, any unknown value or on the splash screen.
function Screen_IsOOR()
{
    s = Get_Screen()
    return s < Screen["credits"] || s == Screen["splash"] || s > Screen["title"]
}

// Checks if the current screen is part of a menu (excludes the splash screen).
function Screen_IsMenu()
{
    s = Get_Screen()
    return s == Screen["credits"] || s == Screen["clear2"] || s == Screen["clear1"] ||
        (Screen["clear3"] <= s && s <= Screen["title"])
}

// Checks if the current screen is an Act.
function Screen_IsAct() => Get_Screen() >= Screen["z1a1"] && Get_Screen() <= Screen["z3a2"]


// Checks if the player is within the specified bounds
function Player_WithinArea(minX, maxX, minY, maxY) =>
    minX <= Get_Player_Position_X() && Get_Player_Position_X() <= maxX &&
    minY <= Get_Player_Position_Y() && Get_Player_Position_Y() <= maxY

// Checks if the specified Act was cleared on this frame; triggers after touching the goal post.
function Act_Cleared(screen, actNum)
{
    isCorrectScreen = screen == Get_Screen()
    
    // Check if the player's control was disabled this frame.
    pCState = Get_Player_ControlState()
    isControlDisabled = pCState != prev(pCState) && pCState == Player_ControlState["disabled"]
    
    // Check if the correct message is loaded in memory.
    isCorrectMsg = Get_TBox_MessageID() == TBox_MessageID["clear" + actNum]
    
    return isCorrectScreen && isControlDisabled && isCorrectMsg
}

// Increases a tally when a ring is collected within the specified Act.
function Act_RingTally(screen)
{
    reset = never(Screen_Switch(-1, Get_Screen()))
    return repeated(8, reset && Get_Screen() == screen && RingCollected())
}

//--- Achievements ---
function Cheevo_AllClear()
{
    reset = never(Screen_IsOOR())
    
    pause = unless(Screen_IsMenu())
    
    goal = tally(6,
        Act_Cleared(Screen["z1a1"], 1), Act_Cleared(Screen["z1a2"], 2),
        Act_Cleared(Screen["z2a1"], 1), Act_Cleared(Screen["z2a2"], 2),
        Act_Cleared(Screen["z3a1"], 1), Act_Cleared(Screen["z3a2"], 2)
    )
    
    achievement(
        title = "All Clear", points = 1, type="win_condition",
        description = "Reach the goal post of every Act, in a single session.",
        trigger = reset && pause && measured(goal)
    )
}
Cheevo_AllClear()

function Cheevo_ZoneRings(cheevoTitle, a1Screen)
{
    a2Screen = a1Screen + 1
    screen = Get_Screen()
    
    // Reset if the screen is not Act 1 or 2 of the Zone and upon entering Act 1.
    reset = never(screen < a1Screen || screen > a2Screen || Screen_Switch(-1, a1Screen))
    
    // Start only when the player enters the first Act.
    start = once(screen != prev(screen) && screen == a1Screen)
    
    // Track each Act's ring count separately, then tally them together
    goal = tally(16, Act_RingTally(a1Screen), Act_RingTally(a2Screen))
    
    achievement(
        title = cheevoTitle, points = 2,
        description = "Collect all of the rings across both Acts of "
            + Screen_ZoneName[a1Screen] + ", in a single run.",
        trigger = reset && start && measured(goal)
    )
}
Cheevo_ZoneRings("Ring Detector", Screen["z1a1"])
Cheevo_ZoneRings("ALL RINGS Z2 - MARBLE VALLEY", Screen["z2a1"])
Cheevo_ZoneRings("Ringtropolis", Screen["z3a1"])

function Cheevo_AllRings()
{
    reset = never(Screen_IsOOR())
    pause = unless(Screen_IsMenu())
    goal = tally(48,
        Act_RingTally(Screen["z1a1"]), Act_RingTally(Screen["z1a2"]),
        Act_RingTally(Screen["z2a1"]), Act_RingTally(Screen["z2a2"]),
        Act_RingTally(Screen["z3a1"]), Act_RingTally(Screen["z3a2"])
    )
    
    achievement(
        title = "All Rings, All Zones, All Done!", points = 0,
        description = "Collect all of the rings across every Act, in a single session. " +
        "(Returning to an Act will require you to recollect all of the rings in that Act.)",
        trigger = reset && pause && measured(goal)
    )
}
Cheevo_AllRings()

//Any A1: Repeat intro text

//Z1A1: No falling

//Z1A2: Find blue hill

//Z2A1 + Z2A2: Hold right

//Z3A2: Find statue

//Z1A1: Ring Rush - < 20 sec

//Z1A2: Ring Rush - < 14 ~ 14.1 sec

//Z2A1: Ring Rush - < 15 sec

//Z2A2: Ring Rush - < 14.1 ~ 14.2 sec

//Z3A1: Ring Rush - < 19.5 sec

//Z3A2: Ring Rush - < 14.25 ~ 14.5 sec

//--- Leaderboards ---
//Ring rushes

//--- Rich Presence ---
// While in an Act, display their current action and which Act the player is in.
rich_presence_conditional_display(
    Screen_IsAct(),
    "Sonic is {0} {1}, Act {2}.",
    rich_presence_lookup("ActionRP", Get_Player_ActionState(), Player_ActionStateRP),
    rich_presence_lookup("ZoneName", Get_Screen(), Screen_ZoneName),
    rich_presence_macro("Number", (Get_Screen() % 2) + 1)
)

// While on the title screen with the text box active, display a unique message.
rich_presence_conditional_display(
    Get_Screen() == Screen["title"] && Get_TBox_ControlState() == TBox_ControlState["enabled"],
    "Sonic is selecting a Zone..."
)

// While in a menu, display a customized lookup message.
rich_presence_conditional_display(
    Get_Screen() == Screen["splash"] || Screen_IsMenu(),
    "Sonic is {0}.",
    rich_presence_lookup("MenuRP", Get_Screen(), Screen_MenuRP)
)

// In all other cases, display a generic message.
rich_presence_display("Sonic is booting up the game...")