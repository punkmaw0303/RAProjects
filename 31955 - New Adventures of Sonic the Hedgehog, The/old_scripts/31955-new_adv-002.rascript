// ~Homebrew~ ~Demo~ New Adventures of Sonic the Hedgehog, The
// #ID = 31955

//--- RAM Functions and Enums ---
// $C0A3: Frame Counter (First 2 Bits)
//        [8-bit]
//        Freezing this causes certain things to freeze and stop functioning.
function FrameCount_Ones() => byte(0x00C0A3)

// $C0A4: Frame Counter (Last 2 Bits)
//        [8-bit]
//        Increments each time 0x00c0a3 passes ff. Freezing this does not seem to affect the game in any meaningful way.
function FrameCount_Hundreds() => byte(0x00C0A4)

// $C0BA: [16-bit] Player X-Position
function Player_Pos_X() => word(0x00C0BA)

// $C0BC: [16-bit] Player Y-Position
function Player_Pos_Y() => word(0x00C0BC)

// $C0BE: [2-bit] Player Facing Direction
//        Changes between 0x0 and 0x1 while in menus (usually is 0x0 during transitions and on the credits screen.)
//        0x1 = Right
//        0x3 = Left
function Player_GetFacingDir() => byte(0x00C0BE)
Player_FacingDir_Right = 0x1
Player_FacingDir_Left = 0x3

// $C0C4: [8-bit] Player's Current Sprite
//        Will increment through the animation frames dictated by 0x00c0c5 and 0x00c0c6. Also continue incrementing when a text box is active and during transitions.
//        0x00 - 0x03 = Spin Jump, left
//        0x04 = Standing, facing right
//        0x05 - 0x08 = Spin Jump, right
//        0x09 = Standing, facing left
//        0x0b - 0x0c = Runinng, right
//        0x0f - 0x10 = Running, left
function Player_Sprite() => byte(0x00C0C4)

// $C0C5: [8-bit] Player Animation - First Frame
//        The first frame of the player's current animation; see 0x00c0c4.
function Player_Anim_Frame1() => byte(0x00C0C5)

// $C0C6: [8-bit] Player Animation - Loop Point
//        The sprite after the final frame of the player's current animation. Loops back to first frame before reaching this value. See 0x00c0c4.
function Player_Anim_LoopPoint() => byte(0x00C0C6)

// $C0C9: [4-bit] Player Action State
//        The player's current action. Will also switch between 0x0, 0x1, and 0x2 in certain menus.
//        0x0 = Spin Jump, left
//        0x1 = Standing, right
//        0x2 = Spin Jump, right
//        0x3 = Standing, left
//        0x5 = Running, right
//        0x7 = Running, left
function Player_ActionState() => byte(0x00C0C9)
Player_ActionState_JumpLeft      = 0x0
Player_ActionState_StandRight = 0x1
Player_ActionState_JumpRight     = 0x2
Player_ActionState_StandLeft  = 0x3
Player_ActionState_RunRight  = 0x5
Player_ActionState_RunLeft   = 0x7

// $C582: [8-bit] Player Control State
//        0x01 = Disabled, usually due to a text box or menu being controlled.
//        0x03 = Enabled, player can be controlled.
//        0x17 = Unknown, used during screen transitions.
function Player_ControlState() => byte(0x00C582)
Player_ControlState_Disabled = 0x1
Player_ControlState_Enabled  = 0x3

// $C58F: [8-bit] Current Screen/Level
//        OASYS Splash Screen = 0x0d
//        Title = 0x10
//        Zone 1, Act 1 = 0x06
//        Zone 1, Act 2 = 0x07
//        Zone 2, Act 1 = 0x08
//        Zone 2, Act 2 = 0x09
//        Zone 3, Act 1 = 0x0a
//        Zone 3, Act 2 = 0x0b
//        Zone Clear 1 (Thanks) = 0x0c
//        Zone Clear 2 (Active development) = 0x05
//        Zone Clear 3 (Featuring) = 0x0e
//        Zone Clear 4 (Starring) = 0x0f
//        Credits = 0x04
function Screen() => byte(0x00C58F)
Screen_Splash  = 0x0d
Screen_Title   = 0x10
Screen_Z1A1    = 0x06
Screen_Z1A2    = 0x07
Screen_Z2A1    = 0x08
Screen_Z2A2    = 0x09
Screen_Z3A1    = 0x0a
Screen_Z3A2    = 0x0b
Screen_Clear1  = 0x0c
Screen_Clear2  = 0x05
Screen_Clear3  = 0x0e
Screen_Clear4  = 0x0f
Screen_Credits = 0x04

// $C680: [8-bit][Bitflags] Input
//        Stores the currently pressed input. Also see 0x00c684 for current input (matches this value) and 0x00c685 for previous input.
//        Bit 0 = Right
//        Bit 1 = Left
//        Bit 2 = Up
//        Bit 3 = Down
//        Bit 4 = A
//        Bit 5 = B
//        Bit 6 = Select
//        Bit 7 = Start
function Input() => byte(0x00C680)
function Input_Right() => bit0(0x00C680)
function Input_Left() => bit1(0x00C680)
function Input_Up() => bit2(0x00C680)
function Input_Down() => bit3(0x00C680)
function Input_A() => bit4(0x00C680)
function Input_B() => bit5(0x00C680)
function Input_Select() => bit6(0x00C680)
function Input_Start() => bit7(0x00C680)


// $C684: [8-bit][Bitflags] Current Input
//        Contains input for this frame. Matches 0x00c680, see that address for values.
function Input_Curr() => byte(0x00C684)

// $C685: [8-bit][Bitflags] Previous Input
//        Stores the input from the previous frame, see 0x00c684 for values.
function Input_Prev() => byte(0x00C685)

// $C838: [8-bit] Text Box Control State
//        0x01 = Enabled
//        0x19 = Disabled
function TBox_ControlState() => byte(0x00C838)
TBox_ControlState_Enabled  = 0x01
TBox_ControlState_Disabled = 0x19

// $C987: [8-bit] Text Box Current Y-Position
//        See 0x00c988 for common values.
function TBox_Pos_Y() => byte(0x00C987)

// $C988: [8-bit] Text Box Target Y-Position
//        The y-position the text box will slide to when active.
//        0x60 = 4 lines of text
//        0x70 = 2 lines of text
//        0x90 = Off-screen
function TBox_Pos_TargetY() => byte(0x00C988)

// $C9AA: [8-bit] Text Box Message ID
//        0x0a = Zone Selection
//        0x31 = Act 1 Cleared
//        0x32 = Act 2 Cleared
//        0x76 = Level Intro
function TBox_MessageID() => byte(0x00C9AA)
TBox_MessageID_ZSelect = 0x0a
TBox_MessageID_Clear1  = 0x31
TBox_MessageID_Clear2  = 0x32
TBox_MessageID_Intro   = 0x76

// $CAC2: Ring???
// $D980: 0x00d980 - 0x00d98f
//        Seems linked to rings, but...
// $D982: Unknown
//        [8-bit]
//        0x00 = Ring collected... usually.
//        0x01 = Goal post touched; not cleared when entering next Act.
//        0x02 = Ring collected, sometimes and only if in Zone 2.
//        0x10 = Set during transitions when a Zone is cleared.

// $D984: [16-bit] Ring Collection?
//        0x00d984 - 0x00d98e all seem to be linked to ring collection. 0x00d984 is the most consistent for detecting when a ring is collected.
//        May need to pause detection while a text box is active to prevent false positives.
function RingCollection() => word(0x00D984)

// $DA5A: [16-bit] Player X-Velocity
//        The player's current horizontal movement speed and direction. Value persists when a menu is open, despite the player not moving.
//        0x0000 = No horizontal movement
//        0x0001 - 0x0029 = Moving right (higher numbers = faster)
//        0xffd6 - 0xffff = Moving left (lower numbers = faster)
function Player_Vel_X() => word(0x00DA5A)
Player_Vel_X_MaxRight = 0x0029
Player_Vel_X_MaxLeft = 0xffd6

// $DA5B: Player X-Movement Direction
//        [8-bit]
//        The player's current horizontal direction.
//        See 0x00da5a [16-bit].
//        0x00 = Right (or None, if not moving horizontally)
//        0xff = Left
function Player_MoveDir_X() => byte(0x00DA5B)

// $DA5C: [16-bit] Player Y-Velocity
//        The player's current vertical movement speed and direction. Value persists when a menu is open, despite the player not moving.
//        0x0007 = No vertical movement (game is likely applying some downward force to keep player grounded, even when at a standstill).
//        0x0000 - 0x0055 = Descending (higher numbers = faster)
//        0xffbf - 0xffff = Ascending (lower numbers = faster)
function Player_Vel_Y() => word(0x00DA5C)
Player_Vel_Y_MaxUp = 0xffbf
Player_Vel_Y_MaxDown = 0x0055

// $DA5D: Player Y-Movement Direction
//        [8-bit]
//        The player's current vertical direction.
//        See 0x00da5a [16-bit].
//        0x00 = Down (or None, if not moving vertically)
//        0xff = Up
function Player_MoveDir_Y() => word(0x00DA5D)
Player_MoveDir_None  = 0x00
Player_MoveDir_Right = 0x00
Player_MoveDir_Left  = 0xff
Player_MoveDir_Down  = 0x00
Player_MoveDir_Up    = 0xff

// $DEB6: [8-bit] Text Box Cursor Position (TITLE SCREEN ONLY)
//        NOTE: This address technically refers to certain sprites or pixels being display, but can be used to check the position of the cursor on the title screen.
//        0x1 = Zone 1
//        0x2 = Zone 2
//        0x3 = Zone 3
//        0x4 = Credits
function TitleCursor_Pos() => byte(0x00DEB6)
TitleCursor_Pos_Z1      = 0x1
TitleCursor_Pos_Z2      = 0x2
TitleCursor_Pos_Z3      = 0x3
TitleCursor_Pos_Credits = 0x4

//--- Common Variables & Functions ---
ZoneName =
{
    Screen_Splash: "splash",
    Screen_Title: "title",
    Screen_Z1A1: "Peridot Coast",
    Screen_Z1A2: "Peridot Coast",
    Screen_Z2A1: "Marble Valley",
    Screen_Z2A2: "Marble Valley",
    Screen_Z3A1: "Robotropolis",
    Screen_Z3A2: "Robotropolis",
    Screen_Clear1: "Zone Clear",
    Screen_Clear2: "Zone Clear",
    Screen_Clear3: "Zone Clear",
    Screen_Clear4: "Zone Clear",
    Screen_Credits: "credits"
}

function ScreenSwitch(fromScreen, toScreen) => prev(Screen()) == fromScreen && Screen() == toScreen
function ScreenSwitchAny(screen) => Screen() != prev(Screen()) && Screen() == screen

function ScreenOutOfRange() => Screen() < Screen_Credits || Screen() == Screen_Splash || Screen() > Screen_Title

function PlayerWithinArea(minX, maxX, minY, maxY)
{
    return (
        minX <= Player_Pos_X() && Player_Pos_X() <= maxX &&
        minY <= Player_Pos_Y() && Player_Pos_Y() <= maxY
    )
}

function RingCollected() => Player_ControlState() == Player_ControlState_Enabled && RingCollection() != prev(RingCollection())

// Checks if the text box was activated this frame with a specific message.
// When lateTiming is false, checks using the text box's control state. When true, checks the player's control state.
function TBoxActivated(lateTiming)
{
    if (lateTiming)
        return Player_ControlState() != prev(Player_ControlState()) && Player_ControlState() == Player_ControlState_Disabled
    else
        return TBox_ControlState() != prev(TBox_ControlState()) && TBox_ControlState() == TBox_ControlState_Enabled
}

// When transitioning into an Act, reset its tally. 
function ActRingTally(screen)
{
    reset = never(Screen() != prev(Screen()) && Screen() == screen)
    return repeated(8, reset && Screen() == screen && RingCollected())
}

function ActClear(screen)
{
    correctScreen = Screen() == screen
    
    // Check if the player's control state is disabled.
    controlDisabled = Player_ControlState() != prev(Player_ControlState()) && Player_ControlState() == Player_ControlState_Disabled
    
    // Check if an appropriate text box message is used for the current Act.
    targetMessage = TBox_MessageID_Clear1
    if (screen % 2 == 1) { targetMessage = TBox_MessageID_Clear2 }
    
    return correctScreen && controlDisabled && (TBox_MessageID() == targetMessage)
}

//--- Achievements ---
function Cheevo_AllClear()
{
    goal = tally(6,
        ActClear(Screen_Z1A1), ActClear(Screen_Z1A2),
        ActClear(Screen_Z2A1), ActClear(Screen_Z2A2),
        ActClear(Screen_Z3A1), ActClear(Screen_Z3A2)
    )
    
    achievement(
        title = "All Clear", points = 1, type="win_condition",
        description = "Reach the goal post of every Act, in a single session.",
        trigger =
            // Reset if the screen is ever out-of-range or on the splash screen.
            never(ScreenOutOfRange()) &&
            
            // Pause while in menus.
            unless(Screen() == Screen_Credits || Screen() == Screen_Clear2 || (Screen_Clear3 <= Screen() && Screen() <= Screen_Title)) &&
            
            measured(goal)
    )
}
Cheevo_AllClear()

function Cheevo_ZoneRings(cheevoTitle, act1)
{
    act2 = act1 + 0x1

    // Track each Act's ring count separately, then tally them together.
    goal = tally(16, ActRingTally(act1), ActRingTally(act2))
    
    achievement(
        title = cheevoTitle, points = 2,
        description = "Collect all of the rings across both Acts of " + ZoneName[act1] + ", in a single run.",
        trigger =
            // Reset if the current screen is not Act 1 or Act 2 of the Zone and on any transitions to Act 1.
            never(Screen() < act1 || Screen() > act2 || ScreenSwitchAny(act1)) &&
            
            // Start only when the player enters the first Act.
            once(Screen() != prev(Screen()) && Screen() == act1) &&
            
            // Create alt groups for tracking the number of rings collected and triggering the achievement.
            (trigger_when(goal) || measured(goal))
    )
}
Cheevo_ZoneRings("ALL RINGS Z1 - PERIDOT COAST", Screen_Z1A1)
Cheevo_ZoneRings("ALL RINGS Z2 - MARBLE VALLEY", Screen_Z2A1)
Cheevo_ZoneRings("Ringtropolis", Screen_Z3A1)

achievement(
    title = "All Rings, All Zones, All Done!", points = 0,
    description = "Collect all of the rings in every Act, in a single session. (Returning to an Act will require you to recollect all of the rings for that Act.)",
    trigger =
        // Reset if the screen is out-of-range or on the splash screen.
        never(ScreenOutOfRange()) &&
        
        // Pause while on the title, credits, or zone clear screens.
        unless(Screen() == Screen_Credits || Screen() == Screen_Clear2 || Screen() == Screen_Clear1 ||
            (Screen_Clear3 <= Screen() && Screen() <= Screen_Title)) &&
        
        measured(tally(48,
            ActRingTally(Screen_Z1A1), ActRingTally(Screen_Z1A2),
            ActRingTally(Screen_Z2A1), ActRingTally(Screen_Z2A2),
            ActRingTally(Screen_Z3A1), ActRingTally(Screen_Z3A2))
        )
)

achievement(
    title = "Can You Repeat That?", points = 0,
    description = "Reactivate the intro text in the first Act of any Zone.",
    trigger = never((Screen() != Screen_Z1A1 && Screen() != Screen_Z2A1 && Screen() != Screen_Z3A1)) &&
              trigger_when(tally(2,
                  once(TBoxActivated(false) && TBox_MessageID() != prev(TBox_MessageID()) && TBox_MessageID() == 0x76),
                  once(TBoxActivated(false) && TBox_MessageID() == prev(TBox_MessageID()) && TBox_MessageID() == 0x76))
              )
)

// Although the floor is at 0x1e8f, the player starts at 0x1e80. Since the offset is so little,
// 0x1e80 is used for checking when the player leaves the ground, in order to prevent issues when starting the level.
achievement(
    title = "CHALLENGE Z1A1: NO FALL", points = 0,
    description = "Collect all of the rings in Peridot Coast, Act 1 without returning to solid ground.",
    trigger = 
        // Reset when not on the correct screen.
        never(Screen() != Screen_Z1A1 || (prev(Player_Pos_Y()) < 0x1e80 && Player_Pos_Y() >= 0x1e80)) &&
        
        // The achievement is primed when the player switches to the correct screen and they leave the ground.
        once(ScreenSwitchAny(Screen_Z1A1)) && once(Player_Pos_Y() < 0x1e80) &&
        
        // After being primed, resets if the player gets close to the ground OR
        // succeeds after collecting all 8 rings in the Act.
        trigger_when(ActRingTally(Screen_Z1A1))
)

achievement(
    title = "It's Green Hill, Not Blue Hill", points = 0,
    description = "Try (and fail) to land on the blue hill in Peridot Coast, Act 2.",
    trigger = Screen() == Screen_Z1A2 && trigger_when(PlayerWithinArea(0x4C00, 0x4F00, 0x1B30, 0x1CB0))
)

function Cheevo_HoldRight(cheevoTitle, act)
{
    achievement(
        title = cheevoTitle, points = 0,
        description = "Reach the goal post of " + ZoneName[act] + ", Act " + ((act % 2) + 1) + ".",
        trigger =
            never(Screen() != act || Player_MoveDir_X() != Player_MoveDir_Right || Player_Vel_X() < prev(Player_Vel_X())) &&
            once(ScreenSwitchAny(act)) &&
            trigger_when(ActClear(act))
    )
}
Cheevo_HoldRight("CHALLENGE Z2A1: HOLD RIGHT", Screen_Z2A1)
Cheevo_HoldRight("CHALLENGE Z2A2: HOLD RIGHT", Screen_Z2A2)

achievement(
    title = "Welcome to Robotropolis!", points = 1,
    description = "Find the hidden statue in the background of Robotropolis, Act 2.",
    trigger = Screen() == Screen_Z3A2 && trigger_when(PlayerWithinArea(0x7C00, 0x7DFF, 0x1C40, 0x1E8F))
)

achievement(
    title = "Credit to the Creators", points = 0,
    description = "View the credits.",
    // Triggers on the frame the screen changes to the Credits screen.
    trigger = ScreenSwitchAny(Screen_Credits)
)

//--- Rich Presence ---
ActionLookup =
{
    Player_ActionState_StandRight: "in",
    Player_ActionState_StandLeft: "in",
    Player_ActionState_RunRight: "running through",
    Player_ActionState_RunLeft: "running through",
    Player_ActionState_JumpLeft: "jumping through",
    Player_ActionState_JumpRight: "jumping through"
}

MenuLookup =
{
    Screen_Splash: "is on the splash screen",
    Screen_Title: "is on the title screen",
    Screen_Clear1: "has cleared a Zone",
    Screen_Clear2: "has cleared a Zone",
    Screen_Clear3: "has cleared a Zone",
    Screen_Clear4: "has cleared a Zone",
    Screen_Credits: "is viewing the credits"
}

// If the player is in an Act, display their current action and which Act they are in.
rich_presence_conditional_display(
    Screen_Z1A1 <= Screen() && Screen() >= Screen_Z3A2,
    "Sonic is {0} {1}, Act {2}.",
    rich_presence_lookup("Action", Player_ActionState(), ActionLookup),
    rich_presence_lookup("Zone", Screen(), ZoneName),
    rich_presence_macro("Number", (Screen() % 2) + 1)
)

// If the player is on the title screen and have the level select dialogue open, display that they are selecting a level.
rich_presence_conditional_display(
    Screen() == Screen_Title && TBox_ControlState() == TBox_ControlState_Enabled,
    "Sonic is selecting a Zone..."
)

// When the player is in a menu, display which menu they are on.
rich_presence_conditional_display(
    (Screen_Credits <= Screen() && Screen() <= Screen_Clear2) || (Screen_Clear1 <= Screen() && Screen() <= Screen_Title),
    "Sonic is {0}.",
    rich_presence_lookup("Menu", Screen(), MenuLookup)
)

rich_presence_display("Sonic is booting up the game...")