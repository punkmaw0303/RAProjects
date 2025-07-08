// ~Homebrew~ ~Demo~ New Adventures of Sonic the Hedgehog, The
// #ID = 31955

// prev = delta, prior = previous DIFFERENT value

/*
player_action
player_control
tbox_control
tbox_ypos
tbox_trigger
screen
ringcollect
framecounter*/

//--- RAM Getters ---
// $c0ba: [16-bit] Player X-Position
function get_player_xposition() => word(0xc0ba)

// $c0bc: [16-bit] Player Y-Position
function get_player_yposition() => word(0xc0bc)

/* $da5a: [16-bit] Player X-Velocity
          The player's current horizontal movement speed and direction.
          This value persists when a text box/menu is open, despite the player not moving.
          0x0000          = No horizontal movement
          0x0001 - 0x0029 = Moving right (higher numbers = faster)
          0xffd6 - 0xffff = Moving left (lower numbers = faster) */
function get_player_xvelocity() => word(0xda5a)

function get_player_action() => byte(0xc0c9)

function get_player_control() => byte(0xc582)

/* $c984: [8-bit] Text Box Trigger Collision
          Tracks which text box trigger the player is colliding with, if any.
          0x00 = Act 1: intro text, Act 2: goal text
          0x01 = Act 1: goal text
          0xff = No collision detected or not in an Act. */
function get_tbox_trigger_collision() => byte(0xc984)

function get_screen() => byte(0xc58f)

function get_ring_collection_value() => word(0xd984)

function get_frame_ticker() => word(0xc0a3)

//--- Lookup Dictionaries ---
lookup_player_action = {
    "stand_r": 1,
    "stand_l": 3,
    "jump_r" : 2,
    "jump_l" : 0,
    "run_r"  : 5,
    "run_l"  : 7
}

lookup_player_action_symbol = {
    1: "🧍",
    3: "🧍",
    2: "🦘",
    0: "🦘",
    5: "🏃",
    7: "🏃"
}

lookup_player_control = {
    "disabled"  : 0x01,
    "enabled"   : 0x03,
    "transition": 0x17
}

lookup_tbox_trigger = {
    "intro" : 0x00,
    "clear2": 0x00,
    "clear1": 0x01,
    "none"  : 0xff
}

lookup_screen = {
    "credits": 0x04,
    "clear2" : 0x05,
    "z1a1"   : 0x06,
    "z1a2"   : 0x07,
    "z2a1"   : 0x08,
    "z2a2"   : 0x09,
    "z3a1"   : 0x0a,
    "z3a2"   : 0x0b,
    "clear1" : 0x0c,
    "splash" : 0x0d,
    "clear3" : 0x0e,
    "clear4" : 0x0f,
    "title"  : 0x10,
}

lookup_screen_symbol = {
    0x0D: "",
    0x10: "",
    0x0C: "🏁",
    0x05: "🏁",
    0x0E: "🏁",
    0x0F: "🏁",
    0x04: "⏿"
}

lookup_screen_text = {
    lookup_screen["splash"] : "is on the splash screen.",
    lookup_screen["title"]  : "is on the title screen.",
    lookup_screen["credits"]: "is viewing the credits.",
    lookup_screen["z1a1"]   : "Peridot Coast, Act 1",
    lookup_screen["z1a2"]   : "Peridot Coast, Act 2",
    lookup_screen["z2a1"]   : "Marble Valley, Act 1",
    lookup_screen["z2a2"]   : "Marble Valley, Act 2",
    lookup_screen["z3a1"]   : "Robotropolis, Act 1",
    lookup_screen["z3a2"]   : "Robotropolis, Act 2",
    lookup_screen["clear1"] : "has cleared a Zone!",
    lookup_screen["clear2"] : "has cleared a Zone!",
    lookup_screen["clear3"] : "has cleared a Zone!",
    lookup_screen["clear4"] : "has cleared a Zone!"
    
    /*0x04: "is viewing the credits.",
    0x05: "has cleared a Zone!",
    0x06: "Peridot Coast, Act 1",
    0x07: "Peridot Coast, Act 2",
    0x08: "Marble Valley, Act 1",
    0x09: "Marble Valley, Act 2",
    0x0a: "Robotropolis, Act 1",
    0x0b: "Robotropolis, Act 2",
    0x0c: "has cleared a Zone!",
    0x0d: "is on the splash screen.",
    0x0e: "has cleared a Zone!",
    0x0f: "has cleared a Zone!",
    0x10: "is on the title screen."*/
}

//--- Helper Functions ---
// Bool
function is_between(value, min, max) => min <= value && value <= max

// Logic: Returns logic for when the screen changes.
function screen_switch(from, to)
{
    screen = get_screen()
    return prev(screen) == from && screen == to
}

function primer()
{
    screen = get_screen()
    return once(screen != prev(screen))
}

function touched_goal(screen)
{
    col = get_tbox_trigger_collision()
    
    // Set "id" to 1 when in Act 1, and 0 when in Act 2.
    id = 1
    if (screen % 2 == 1)
        id = 0
        
    return col != prev(col) && col == id
}

function ring_collected()
{
    r = get_ring_collection_value()
    c = get_player_control() == lookup_player_control["enabled"]
    return c && r != prev(r)
}

function tally_rings(screen) => repeated(8, get_screen() == screen && ring_collected())

//--- Achievements ---
//- Functions -
function cheevo_all_clear()
{
    screen = get_screen()
    clear = lookup_screen["clear1"]
    cond = []
    
    // Add logic for each Zone.
    for zone in range(1, 3)
    {    
        // Act 1: track when switching to the next screen (Act 2).
        act = lookup_screen["z" + zone + "a1"]
        next = screen_switch(act, act + 1)
        array_push(cond, once(next))
        
        // Act 2: track when switching to the first clear screen.
        act = lookup_screen["z" + zone + "a2"]
        next = screen_switch(act, clear)
        array_push(cond, once(next))
    }
    
    // Measure the total number of clears.
    goal = measured(tally(6, cond[0], cond[1], cond[2], cond[3], cond[4], cond[5]))
    // Pause when not in an Act or on the first clear screen.
    pause = unless(lookup_screen["z1a1"] > screen || screen > lookup_screen["clear1"])
    
    achievement(
        title = "All Clear", points = 1, type = "win_condition",
        description = "Reach every goal post, in a single emulator session.",
        trigger = pause && goal
    )
}

function cheevo_zone_rings(ach_title, zone_name, act1_str)
{
    act1 = lookup_screen[act1_str]
    act2 = act1 + 1
    screen = get_screen()
    
    // Reset when not in the correct Zone.
    reset = never(screen < act1 || screen > act2)
    //Complete when 8 rings are collected in each Act.
    goal = measured(tally(16, tally_rings(act1), tally_rings(act2)))
    
    achievement(
        title = ach_title, points = 2,
        description = "Collect all the rings across both Acts of "
            + zone_name + " in a single run.",
        trigger = reset && goal
    )
}

function cheevo_repeat_intro()
{
    screen = get_screen()
    
    // Reset if not in Act 1 of any Zone.
    acts = []
    for zone in range(1, 3)
        array_push(acts, lookup_screen["z" + zone + "a1"])
    reset = never(screen != acts[0] && screen != acts[1] && screen != acts[2])
    
    // Complete when the intro text box displays a second time.
    col = get_tbox_trigger_collision()
    goal = repeated(2, col != prev(col) && col == lookup_tbox_trigger["intro"])
    
    achievement(
        title = "Can You Repeat That?", points = 0,
        description = "Reactivate the intro text in the first Act of any Zone.",
        trigger = reset && goal
    )
}

function cheevo_no_fall()
{
    screen = get_screen()
    act = lookup_screen["z1a1"]
    player_y = get_player_yposition()
    ground_y = 0x1e8f
    
    /* The player begins the stage slightly above the ground, so check for the second
       time they touch the ground. */
    ground_col = player_y != prev(player_y) && player_y >= ground_y
    reset = never(screen != act || repeated(2, ground_col))
    
    // Primes the achievement and makes an indicator appear upon entering the Act.
    start = primer()
    
    // Complete upon collecting all 8 rings. 
    goal = trigger_when(tally_rings(act))
    
    achievement(
        title = "Ouch! Hot, Hot Sand!", points = 2,
        description = "Collect all the rings in Peridot Coast, Act 1 without returning " +
            "to solid ground after jumping.",
        trigger = reset && start && goal
    )
}

function cheevo_entered_area(ach_title, num_points, desc, act_str,
    min_x, max_x, min_y, max_y)
{
    screen = get_screen()
    act = lookup_screen[act_str]
    player_x = get_player_xposition()
    player_y = get_player_yposition()
    
    // Check if the player was outside the area last frame, and entered on this frame.
    curr_in = is_between(player_x, min_x, max_x) && is_between(player_y, min_y, max_y)
    prev_out = !(is_between(prev(player_x), min_x, max_x) &&
                is_between(prev(player_y), min_y, max_y))
    
    goal = screen == act && curr_in && prev_out
    
    achievement(title = ach_title, points = num_points, description = desc, trigger = goal)
}

function cheevo_hold_right(ach_title, act_num)
{
    screen = get_screen()
    act = lookup_screen["z2a" + act_num]
    name = lookup_screen_text[act]
    velocity = get_player_xvelocity()
    
    /* Reset if on the incorrect screen, velocity drops below its previous value,
       or the player moves left (denoted by extremely high velocity values). */
    reset = never(screen != act || velocity < prior(velocity) || velocity >= 0xee0000)
    
    // Primes on screen switch.
    start = primer()
    
    goal = trigger_when(touched_goal(act))
    
    achievement(
        title = ach_title, points = 3,
        description = "Reach the goal post of Marble Valley, Act " + act_num +
            " without pressing left, letting go of right, nor colliding with any walls.",
        trigger = reset && start && goal
    )
}

function cheevo_speedrun(ach_title, screen_str, frame_limit)
{
    screen = get_screen()
    act = lookup_screen[screen_str]
    name = lookup_screen_text[act]
    
    ticker = get_frame_ticker()
    seconds = frame_limit / 60.00
    
    // Increase the time limit by one frame so that tieing with the target time also counts.
    time_limit = repeated(frame_limit + 1, ticker != prev(ticker))
    reset = never(screen != act || time_limit)
    
    start = primer()
    
    goal = trigger_when(touched_goal(act))
    
    achievement(
        title = ach_title, points = 5,
        description = "Collect all the rings and reach the goal post of " + name +
            " within " + seconds + " seconds.",
        trigger = reset && start && goal
    )
}

//- Declarations -
cheevo_all_clear()

cheevo_zone_rings("Ring Detector", "Peridot Coast", "z1a1")
cheevo_zone_rings("Gold Mine",     "Marble Valley", "z2a1")
cheevo_zone_rings("Ringtropolis",  "Robotropolis",  "z3a1")

cheevo_repeat_intro()

cheevo_no_fall()

cheevo_entered_area(
    "It's Green Hill, Not Blue Hill", 0,
    "Try (and fail) to land on the blue hill in Peridot Coast, Act 2.",
    "z1a2", 0x4c00, 0x4f00, 0x1b30, 0x1cb0
)

cheevo_hold_right("Hold Right to Win",           1)
cheevo_hold_right("Vaulting Through the Valley", 2)

cheevo_entered_area(
    "Welcome to Robotropolis!", 1,
    "Find the hidden statue in the background of Robotropolis, Act 2.",
    "z3a2", 0x7c00, 0x7e00, 0x1c40, 0x1e90
)

cheevo_speedrun("Quick and Easy",         "z1a1", 1200) // 20.00 seconds
cheevo_speedrun("Peridot Perfection",     "z1a2",  861) // 14.35 seconds
cheevo_speedrun("Speedy Treasure Hunter", "z2a1",  915) // 15.25 seconds
cheevo_speedrun("Marble Master",          "z2a2",  876) // 14.60 seconds
cheevo_speedrun("Robo Ring Rush",         "z3a1", 1194) // 19.90 seconds
cheevo_speedrun("Down to the Wire",       "z3a2",  870) // 14.50 seconds

//--- Leaderboards ---


















