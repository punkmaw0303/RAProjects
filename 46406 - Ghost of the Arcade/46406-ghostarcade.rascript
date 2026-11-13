// ~Homebrew~ Ghost of the Arcade
// #ID = 46406

//----- Memory Functions & Constants -----
//-- Global Functions --
// $C530: [16-bit] Current Screen
function get_curr_screen() => word(0xC530)
SCREEN_BOOT = 0x0000
SCREEN_INTRO_CARD = 0x5aec
SCREEN_TITLE = 0x6328
SCREEN_MAIN_MENU = 0x6490
SCREEN_ARCADE_INTRO_1 = 0x6c9c
SCREEN_ARCADE_INTRO_2 = 0x6c74
SCREEN_ARCADE_OVERWORLD = 0x5d91
SCREEN_PAUSE = 0x527c
SCREEN_TOKIPON_MACHINE = 0x4fac
SCREEN_TOKIPON_C = 0x6d00
SCREEN_TOKIPON_U = 0x6e71
SCREEN_TOKIPON_R = 0x6fd9
SCREEN_TOKIPON_SR = 0x7141
SCREEN_DEATH = 0x53e4
SCREEN_CONVO_MONSTER_BULLIES = 0x79b1
SCREEN_CONVO_BULLIES_G = 0x7b19
SCREEN_CONVO_GHOST = 0x554c
SCREEN_CONVO_G_GHOST = 0x56b4
SCREEN_CONVO_GHOST_DUSTIN = 0x581c
SCREEN_CONVO_GHOST_TIM = 0x5984
SCREEN_CONVO_GHOST_GOGGLES = 0x7c81
SCREEN_CONVO_GHOST_VIOLETA = 0x4e44
SCREEN_CONVO_GHOST_TAURIPHENA = 0x7de9
SCREEN_CONVO_MONSTER_TAURIPHENA = 0x72aa
SCREEN_ENDING = 0x6695
SCREEN_CREDITS_1 = 0x5f24
SCREEN_CREDITS_2 = 0x68c8
SCREEN_CREDITS_3 = 0x6a30
SCREEN_CREDITS_4 = 0x6b98
SCREEN_CREDITS_5 = 0x6794
SCREEN_CREDITS_6 = 0x68fc
SCREEN_HELL_TITLE = 0x7411
SCREEN_HELL_STAGE = 0x6c14
SCREEN_HELL_HEAVEN = 0x608c
SCREEN_TRUCK_TITLE = 0x7579
SCREEN_TRUCK_DEST = 0x662c
SCREEN_TRUCK_BEACH_CARD = 0x65f8
SCREEN_TRUCK_BEACH_STAGE = 0x6db2
SCREEN_TRUCK_WINDY_CARD = 0x6760
SCREEN_TRUCK_WINDY_STAGE = 0x6b06
SCREEN_TRUCK_ICE_CARD = 0x6a64
SCREEN_TRUCK_ICE_STAGE = 0x705e
SCREEN_TRUCK_NIGHT_CARD = 0x6bcc
SCREEN_TRUCK_NIGHT_STAGE = 0x75b6
SCREEN_TRUCK_SANDS_CARD = 0x6d34
SCREEN_TRUCK_SANDS_STAGE = 0x7862
SCREEN_TRUCK_LAVA_CARD = 0x6e9c
SCREEN_TRUCK_LAVA_STAGE = 0x730a
SCREEN_TRUCK_REPAIR = 0x757a
SCREEN_MONSTER_TITLE = 0x76e1
SCREEN_MONSTER_STAGE = 0x6a7a
SCREEN_MONSTER_WARN = 0x5c54
SCREEN_MONSTER_VICTORY = 0x5dbc
SCREEN_MONSTER_CYAN = 0x7492
SCREEN_MONSTER_MAGENTA = 0x6cb6
SCREEN_MONSTER_YELLOW = 0x76ce
SCREEN_NESSI_TITLE = 0x7849
SCREEN_NESSI_TURTLE = 0x5cd8
SCREEN_NESSI_DOLPHIN = 0x6e6c
SCREEN_NESSI_OCTO = 0x4802
SCREEN_NESSI_NARWHAL = 0x5996
SCREEN_NESSI_SERPENT = 0x6b2a
SCREEN_NESSI_SHARK = 0x6e0c
SCREEN_NESSI_WIN = 0x61f4
SCREEN_NESSI_LOSE = 0x64c4
SCREEN_NESSI_UPGRADE = 0x635c
SCREEN_MUMMY_TITLE = 0x6101
SCREEN_MUMMY_STAGE = 0x4009
SCREEN_GAME_OVER = 0x5114
SCREEN_NAME_ENTRY = 0x72a9

// All of the screens within each arcade game (excluding title screens).
ARRAY_SCREENS_HELL = [
    SCREEN_HELL_STAGE,
    SCREEN_HELL_HEAVEN
]
ARRAY_SCREENS_TRUCK = [
    SCREEN_TRUCK_DEST,
    SCREEN_TRUCK_BEACH_CARD,
    SCREEN_TRUCK_BEACH_STAGE,
    SCREEN_TRUCK_WINDY_CARD,
    SCREEN_TRUCK_WINDY_STAGE,
    SCREEN_TRUCK_ICE_CARD,
    SCREEN_TRUCK_ICE_STAGE,
    SCREEN_TRUCK_NIGHT_CARD,
    SCREEN_TRUCK_NIGHT_STAGE,
    SCREEN_TRUCK_SANDS_CARD,
    SCREEN_TRUCK_SANDS_STAGE,
    SCREEN_TRUCK_LAVA_CARD,
    SCREEN_TRUCK_LAVA_STAGE,
    SCREEN_TRUCK_REPAIR
]
ARRAY_SCREENS_MONSTER = [
    SCREEN_MONSTER_STAGE,
    SCREEN_MONSTER_WARN,
    SCREEN_MONSTER_CYAN,
    SCREEN_MONSTER_MAGENTA,
    SCREEN_MONSTER_YELLOW
]
ARRAY_SCREENS_NESSI = [
    SCREEN_NESSI_TURTLE,
    SCREEN_NESSI_DOLPHIN,
    SCREEN_NESSI_OCTO,
    SCREEN_NESSI_NARWHAL,
    SCREEN_NESSI_SERPENT,
    SCREEN_NESSI_SHARK,
    SCREEN_NESSI_WIN,
    SCREEN_NESSI_LOSE,
    SCREEN_NESSI_UPGRADE
]
ARRAY_SCREENS_MUMMY = [
    SCREEN_MUMMY_STAGE
]

// Used for the highscore achievement functions.
ARRAY_SCREENS_HELL_PLAY = [
    SCREEN_HELL_STAGE
]
ARRAY_SCREENS_TRUCK_PLAY = [
    SCREEN_TRUCK_BEACH_STAGE,
    SCREEN_TRUCK_WINDY_STAGE,
    SCREEN_TRUCK_ICE_STAGE,
    SCREEN_TRUCK_NIGHT_STAGE,
    SCREEN_TRUCK_SANDS_STAGE,
    SCREEN_TRUCK_LAVA_STAGE
]
ARRAY_SCREENS_MONSTER_PLAY = [
    SCREEN_MONSTER_STAGE,
    SCREEN_MONSTER_CYAN,
    SCREEN_MONSTER_MAGENTA,
    SCREEN_MONSTER_YELLOW
]
ARRAY_SCREENS_NESSI_PLAY = [
    SCREEN_NESSI_TURTLE,
    SCREEN_NESSI_DOLPHIN,
    SCREEN_NESSI_OCTO,
    SCREEN_NESSI_NARWHAL,
    SCREEN_NESSI_SERPENT,
    SCREEN_NESSI_SHARK,
    SCREEN_NESSI_LOSE
]
ARRAY_SCREENS_MUMMY_PLAY = [
    SCREEN_MUMMY_STAGE
]

// $C617: [8-bit][Bitflags] Current Input
//        The inputs held down during this current frame.
//        
//        Values:
//        Bit 0 = Right
//        Bit 1 = Left
//        Bit 2 = Up
//        Bit 3 = Down
//        Bit 4 = A
//        Bit 5 = B
//        Bit 6 = Select
//        Bit 7 = Start
function get_curr_input_bitflags() => byte(0xC617)

// $C61C: [8-bit][Bitflags] Previous Input
//        The inputs held down during the previous frame.
//        
//        Values:
//        Bit 0 = Right
//        Bit 1 = Left
//        Bit 2 = Up
//        Bit 3 = Down
//        Bit 4 = A
//        Bit 5 = B
//        Bit 6 = Select
//        Bit 7 = Start
function get_prev_input_bitflags() => byte(0xC61C)

// $C7CF: [8-bit] Pause State
//        
//        Values
//        0x01 = Paused
//        0x19 = Unpaused
function get_pause_state() => byte(0xC7CF)
function is_paused() => get_pause_state() == 0x01

// $C91E: [16-bit] Text Box State?
function get_text_box_state() => word(0xC91E)

// $C92B: [36 bytes] Text Box & UI Strings
//        The literal strings used within bottom UI and text boxes.
//        
//        Special Characters:
//        0x8e = Trophy
//        0x9e = Ticket
//        0x9f = Dokipon symbol
function get_ui_str() => byte(0xC92B)

// $CDA5: [8-bit] Current Violeta Conversation Loop
//        Does not include her introduction or the conversation about Tauriphena. Once the conversation with Tauriphena is available, none of these conversation will be.
//        
//        Value range = [0,3]
function get_curr_violeta_convo_loop() => byte(0xCDA5)
VIOLETA_CONVO_LOOP_FIRST = 0
VIOLETA_CONVO_LOOP_SECOND = 1
VIOLETA_CONVO_LOOP_THIRD = 2
VIOLETA_CONVO_LOOP_LAST = 3

// $CADC: [8-bit] Intro Message ID
//        
//        Values:
//        0 = Loss
//        1 = No Loss
function get_intro_msg_id() => byte(0xCADC)
INTRO_MSG_LOST = 0
INTRO_MSG_WON = 1

// $CC3F: [16-bit] Number of Highscores Beaten
function get_highscores_beaten() => word(0xCC3F)

// $CB9B: [16-bit] Tickets Held
function get_tickets() => word(0xCB9B)

// $CBBF: [16-bit] Current Score (All Games)
function get_curr_score() => word(0xCBBF)

//-- Player Functions --
// $C0A3: [16-bit] Frame Counter
//        When frozen, animations are unaffected, but game logic breaks.
function get_frame_counter() => word(0xC0A3)

// $C0BA: [16-bit] Player X-Position
function get_player_xposition() => word(0xC0BA)

// $C0BC: [16-bit] Player Y-Position
function get_player_yposition() => word(0xC0BC)

// $C0BE: [8-bit] Player Facing Direction
//        
//        Values:
//        0 = Down
//        1 = Right
//        2 = Up
//        3 = Left
//        
//        Values 4 - 7 result in the walking animation for the respective direction to be played, but is not available during gameplay.
//        For the addresses handling the player's animations, see @0x00c0c4 through @0x00c0c7. All other values result in garbage data.
function get_player_dir() => byte(0xC0BE)
PLAYER_DIR_DOWN = 0
PLAYER_DIR_RIGHT = 1
PLAYER_DIR_UP = 2
PLAYER_DIR_LEFT = 3

// $C0C4: [8-Bit] Player Animation - Current Frame
//        
//        Values:
//        0x00 - 0x05 = Facing Down
//        0x06 - 0x0b = Facing Right
//        0x0c - 0x11 = Facing Up
//        0x12 - 0x17 = Facing Left
//        0x18 - 0x1b = Moving Down
//        0x1c - 0x1d = Moving Right
//        0x1e - 0x21 = Moving Up
//        0x22 - 0x23 = Moving Left
function get_player_anim_curr_frame() => byte(0xC0C4)

// $C0C5: [8-Bit] Player Animation - Starting Frame (Inclusive)
//        
//        Values:
//        0x00 = Facing Down
//        0x06 = Facing Right
//        0x0c = Facing Up
//        0x12 = Facing Left
//        0x18 = Moving Down
//        0x1c = Moving Right
//        0x1e = Moving Up
//        0x22 = Moving Left
function get_player_anim_start_frame() => byte(0xC0C5)

// $C0C6: [8-Bit] Player Animation - Ending Frame (Exclusive)
//        
//        Values:
//        0x06 = Facing Down
//        0x0c = Facing Right
//        0x12 = Facing Up
//        0x18 = Facing Left
//        0x1c = Moving Down
//        0x1e = Moving Right
//        0x22 = Moving Up
//        0x24 = Moving Left
function get_player_anim_end_frame() => byte(0xC0C6)

// $C0C7: [8-bit] Player Animation - Playback Speed
//        Value = 0x0f
function get_player_anim_spd() => byte(0xC0C7)

// $C519: [8-bit] Player/Nessi Cursor Control State
//        Value may change to 0x01 on occasion, usually during a stutter, likely due to needing to load map/tile data on certain games.
//        
//        Values:
//        0x01 = Movement disabled
//        0x03 = Is moving
//        0x12 = Movement disabled during transition
//        0x15 = Is moving
//        0x1d = Can move, standing still
function get_player_control_state() => byte(0xC519)

function is_player_movement_disabled()
{
    state = get_player_control_state()
    return state == 0x01 || state == 0x12
}

function is_player_moving()
{
    state = get_player_control_state()
    return state == 0x03 || state == 0x15
}

function is_player_still()
{
    return get_player_control_state() == 0x1d
}


//-- Arcade Game Functions --
// $CBC1: [8-bit] Monster Truck Tour: Current Durability
//        Max value = 0x64 (100% Durability)
function get_truck_durability() => byte(0xCBC1)

// $C156: [16-bit] "M.O.N.S.T.E.R." Monster X-Position
function get_monster_x() => word(0xC156)

// $C158: [16-bit] "M.O.N.S.T.E.R." Monster Y-Position
function get_monster_y() => word(0xC158)

// $CBE3: [16-bit] Fuel/Time Remaining
//        The amount of fuel/time remaining in M.O.N.S.T.E.R. and Curse of the Mummy.
function get_time_remain() => word(0xCBE3)

// $C0EE: [16-bit] "Nessi: Ocean Racer" Opponent X-Position
function get_nessi_enemy_x() => word(0xC0EE)

// $C91B: [8-bit] __Nessi: Ocean Racer Upgrade Picker
//        ID of the current upgrade selected
function get_nessi_cursor_id() => byte(0xC91B)

// $CBD7: [16-bit] "Nessi: Ocean Racer" Lives Remaining
//        Value Range = [0, 3]
function get_nessi_lives() => word(0xCBD7)

// $CBD9: [16-bit] "Nessi: Ocean Racer" Speed Upgrades
//        Value range = [0, 4]
function get_nessi_spd_up() => word(0xCBD9)

// $CBDB: [16-bit] "Nessi: Ocean Racer" Jump Upgrades
//        Value range = [0, 4]
function get_nessi_jump_up() => word(0xCBDB)

// $CBDD: [16-bit] "Nessi: Ocean Racer" Double Jump Upgrade
//        
//        Values:
//        0 = Not Unlocked
//        1 = Unlocked
function get_nessi_djump_up() => word(0xCBDD)
function has_double_jump() => get_nessi_djump_up() == 1

//-- Tokipon Functions --
// $CBE5: [16-bit] Number Obtained: Unique Tokipon
function get_tokipon_obtained_unique() => word(0x00cbe5)

TOKIPON_ADDRESSES_START = 0xCBE7

// $CBE7: [16-bit] Number Obtained: Tokipon #1 Slomp
function get_tokipon_obtained_1() => word(TOKIPON_ADDRESSES_START)

// $CBE9: [16-bit] Number Obtained: Tokipon #2 Watiku
function get_tokipon_obtained_2() => word(0xCBE9)

// $CBEB: [16-bit] Number Obtained: Tokipon #3 Bikky
function get_tokipon_obtained_3() => word(0xCBEB)

// $CBED: [16-bit] Number Obtained: Tokipon #4 Sauros
function get_tokipon_obtained_4() => word(0xCBED)

// $CBEF: [16-bit] Number Obtained: Tokipon #5 Gazenta
function get_tokipon_obtained_5() => word(0xCBEF)

// $CBF1: [16-bit] Number Obtained: Tokipon #6 Wompy
function get_tokipon_obtained_6() => word(0xCBF1)

// $CBF3: [16-bit] Number Obtained: Tokipon #7 Gubbis
function get_tokipon_obtained_7() => word(0xCBF3)

// $CBF5: [16-bit] Number Obtained: Tokipon #8 Rokoskon
function get_tokipon_obtained_8() => word(0xCBF5)

// $CBF7: [16-bit] Number Obtained: Tokipon #9 Vabatto
function get_tokipon_obtained_9() => word(0xCBF7)

// $CBF9: [16-bit] Number Obtained: Tokipon #10 Tobongo
function get_tokipon_obtained_10() => word(0xCBF9)

// $CBFB: [16-bit] Number Obtained: Tokipon #11 Korybuko
function get_tokipon_obtained_11() => word(0xCBFB)

// $CBFD: [16-bit] Number Obtained: Tokipon #12 Kerhou
function get_tokipon_obtained_12() => word(0xCBFD)

// $CBFF: [16-bit] Number Obtained: Tokipon #13 Nantobo
function get_tokipon_obtained_13() => word(0xCBFF)

// $CC01: [16-bit] Number Obtained: Tokipon #14 Wivynda
function get_tokipon_obtained_14() => word(0xCC01)

// $CC03: [16-bit] Number Obtained: Tokipon #15 Slogiga
function get_tokipon_obtained_15() => word(0xCC03)

// $CC05: [16-bit] Number Obtained: Tokipon #16 Wagando
function get_tokipon_obtained_16() => word(0xCC05)

// $CC07: [16-bit] Number Obtained: Tokipon #17 Wemolo
function get_tokipon_obtained_17() => word(0xCC07)

// $CC09: [16-bit] Number Obtained: Tokipon #18 Liflodra
function get_tokipon_obtained_18() => word(0xCC09)

// $CC0B: [16-bit] Number Obtained: Tokipon #19 Tutosta
function get_tokipon_obtained_19() => word(0xCC0B)

// $CC0D: [16-bit] Number Obtained: Tokipon #20 Floctoxo
function get_tokipon_obtained_20() => word(0xCC0D)

// $CC0F: [16-bit] Number Obtained: Tokipon #21 Papeladi
function get_tokipon_obtained_21() => word(0xCC0F)

// $CC11: [16-bit] Number Obtained: Tokipon #22 Drakiro
function get_tokipon_obtained_22() => word(0xCC11)

// $CC13: [16-bit] Number Obtained: Tokipon #23 Bruspekor
function get_tokipon_obtained_23() => word(0xCC13)

// $CC15: [16-bit] Number Obtained: Tokipon #24 Orkuni
function get_tokipon_obtained_24() => word(0xCC15)

// $CC17: [16-bit] Number Obtained: Tokipon #25 Vyndraho
function get_tokipon_obtained_25() => word(0xCC17)

// $CC19: [16-bit] Number Obtained: Tokipon #26 Axophyni
function get_tokipon_obtained_26() => word(0xCC19)

// $CC1B: [16-bit] Number Obtained: Tokipon #27 Lonferno
function get_tokipon_obtained_27() => word(0xCC1B)

// $CC1D: [16-bit] Number Obtained: Tokipon #28 Hortoxas
function get_tokipon_obtained_28() => word(0xCC1D)

// $CC1F: [16-bit] Number Obtained: Tokipon #29 Skorkorta
function get_tokipon_obtained_29() => word(0xCC1F)

// $CC21: [16-bit] Number Obtained: Tokipon #30 Fenigladis
function get_tokipon_obtained_30() => word(0xCC21)

// $CC23: [16-bit] Number Obtained: Tokipon #31 Ruswampos
function get_tokipon_obtained_31() => word(0xCC23)

// $CC25: [16-bit] Number Obtained: Tokipon #32 Epidralon
function get_tokipon_obtained_32() => word(0xCC25)

// Gets the specific Tokipon with the specified ID#.
function get_tokipon_obtained(id)
{
    address = TOKIPON_ADDRESSES_START + ((id - 1) * 2)
    return word(address)
}


//-- Highscore Functions --
// $CC61: [8-bit] Name Entry Screen: First Letter
//        Characters loop after 0x1a (0x1a = "Z", 0x1b = " ", 0x1c = "A", etc.)
function get_name_entry_letter_1() => byte(0xCC61)

// $CC63: [8-bit] Name Entry Screen: Second Letter
//        Characters loop after 0x1a (0x1a = "Z", 0x1b = " ", 0x1c = "A", etc.)
function get_name_entry_letter_2() => byte(0xCC63)

// $CC65: [8-bit] Name Entry Screen: Third Letter
//        Characters loop after 0x1a (0x1a = "Z", 0x1b = " ", 0x1c = "A", etc.)
function get_name_entry_letter_3() => byte(0xCC65)

// $CC67: [16-bit] Escape Hell: Highscore - Value
function get_hell_highscore() => word(0xCC67)

// $CC69: [8-bit] Escape Hell: Highscore - First Letter
function get_hell_letter_1() => byte(0xCC69)

// $CC6B: [8-bit] Escape Hell: Highscore - Second Letter
function get_hell_letter_2() => byte(0xCC6B)

// $CC6D: [8-bit] Escape Hell: Highscore - Third Letter
function get_hell_letter_3() => byte(0xCC6D)

// $CC6F: [16-bit] Monster Truck Tour: Highscore - Value
function get_truck_highscore() => word(0xCC6F)

// $CC71: [8-bit] Monster Truck Tour: Highscore - First Letter
function get_truck_letter_1() => byte(0xCC71)

// $CC73: [8-bit] Monster Truck Tour: Highscore - Second Letter
function get_truck_letter_2() => byte(0xCC73)

// $CC75: [8-bit] Monster Truck Tour: Highscore - Third Letter
function get_truck_letter_3() => byte(0xCC75)

// $CC77: [16-bit] M.O.N.S.T.E.R.: Highscore - Value
function get_monster_highscore() => word(0xCC77)

// $CC79: [8-bit] M.O.N.S.T.E.R.: Highscore - First Letter
function get_monster_letter_1() => byte(0xCC79)

// $CC7B: [8-bit] M.O.N.S.T.E.R.: Highscore - Second Letter
function get_monster_letter_2() => byte(0xCC7B)

// $CC7D: [8-bit] M.O.N.S.T.E.R.: Highscore - Third Letter
function get_monster_letter_3() => byte(0xCC7D)

// $CC7F: [16-bit] Curse of the Mummy: Highscore - Value
function get_mummy_highscore() => word(0xCC7F)

// $CC81: [8-bit] Curse of the Mummy: Highscore - First Letter
function get_mummy_letter_1() => byte(0xCC81)

// $CC83: [8-bit] Curse of the Mummy: Highscore - Second Letter
function get_mummy_letter_2() => byte(0xCC83)

// $CC85: [8-bit] Curse of the Mummy: Highscore - Third Letter
function get_mummy_letter_3() => byte(0xCC85)

// $CC87: [16-bit] Nessi: Ocean Racer: Highscore - Value
function get_nessi_highscore() => word(0xCC87)

// $CC89: [8-bit] Nessi: Ocean Racer: Highscore - First Letter
function get_nessi_letter_1() => byte(0xCC89)

// $CC8B: [8-bit] Nessi: Ocean Racer: Highscore - Second Letter
function get_nessi_letter_2() => byte(0xCC8B)

// $CC8D: [8-bit] Nessi: Ocean Racer: Highscore - Third Letter
function get_nessi_letter_3() => byte(0xCC8D)

//----- Helpers & Logic -----
function on_memory_change(address, from, to)
{
    return prev(address) == from && address == to
}

function is_between(value, min, max)
{
    return min <= value && value <= max
}

//----- Achievements -----
//-- Functions --
//achievement(title, description, points, trigger, id=0, badge="0", type="missable / progression / win_condition"")

function cheevo_won_intro()
{
    screen = get_curr_screen()
    player_y = get_player_yposition()
    cannot_move = is_player_movement_disabled()
    min_height = 13788
    
    // Reset when the player is no longer on the main "Escape Hell" screen.
    reset = never(screen != SCREEN_HELL_STAGE)
    
    // Start when the screen transitions from the main menu directly to the "Escape Hell" stage
    // OR when starting from arcade mode, if no file was loaded.
    start = once(
        on_memory_change(screen, SCREEN_MAIN_MENU, SCREEN_HELL_STAGE) ||
        get_hell_highscore() == 0
    )
    
    // Win when you cannot move and are above the specified height.
    // This is when you get called over by the bullies.
    // Lower y values are higher up.
    goal = cannot_move && player_y < min_height
    
    achievement(
        title = "One Small Step for Monster...",
        description = "Get called over by the bullies without falling back down to hell.",
        points = 2,
        trigger = reset && start && trigger_when(goal),
        id = 649897,
        badge = "742535",
        type = "missable"
    )
}

function cheevo_befriend_violeta()
{
    screen = get_curr_screen()
    msg = get_curr_violeta_convo_loop()
    
    goal = screen == SCREEN_CONVO_GHOST_VIOLETA &&
           on_memory_change(msg, VIOLETA_CONVO_LOOP_LAST, VIOLETA_CONVO_LOOP_FIRST)
    
    achievement(
        title = "Not All Humans Are Monsters",
        description = "Befriend Violeta.",
        points = 0,
        trigger = goal,
        id = 649900,
        badge = "742536",
        type = "missable"
    )
}

// play_screen_array MUST have 7 values, with 0 denoting unused values.
function cheevo_highscore(cheevo_name, game_name, user_name, init_score, highscore_mem,
    title_screen, first_screen, cheevo_id = 0, cheevo_badge = "0")
{
    screen = get_curr_screen()
    score = get_curr_score()
    
    // Reset when returning to the title screen or on the name entry screen.
    reset = never(screen == title_screen || screen == SCREEN_NAME_ENTRY)
    
    // Start when transitioning from the title screen to the first gameplay screen
    // and the highscore is still at its initial value.
    start = once(on_memory_change(screen, title_screen, first_screen) &&
        highscore_mem == init_score)
    
    // Win if the current score is higher than the highscore on the game over screen.
    // NOTE: If needed, check which screen the player comes from using the PLAY arrays.
    goal = screen == SCREEN_GAME_OVER && score > init_score
    
    achievement(
        title = cheevo_name,
        description = format("In \"{0},\" beat {1}'s highscore of {2} points.",
            game_name, user_name, init_score),
        points = 5,
        trigger = reset && start && trigger_when(goal),
        id = cheevo_id,
        badge = cheevo_badge,
        type = "progression"
    )
}

function cheevo_hell_heaven()
{    
    screen = get_curr_screen()
    score = get_curr_score()
       
    // Reset when not on the stage or heaven screens.
    reset = never(screen != SCREEN_HELL_STAGE && screen != SCREEN_HELL_HEAVEN)
    
    // Check for screen change and that 100 points were awarded.
    goal = tally(5,
        score == prior(score) + 100 &&
        on_memory_change(screen, SCREEN_HELL_STAGE, SCREEN_HELL_HEAVEN)
    )
    
    achievement(
        title = "Heaven and Heaven",
        description = "In \"Escape Hell,\" help 5 demons ascend to heaven in a single run.",
        points = 10,
        trigger = reset && measured(goal),
        id = 649905,
        badge = "742541"
    )
}

// NOT WORKING - Collision detecting even if text box doesn't open.
function cheevo_hell_angels()
{
    screen = get_curr_screen()
    player_y = get_player_yposition()
    cannot_move = on_memory_change(get_pause_state(), 0x19, 0x01)
    
    // Y-position ranges for each angel.
    angel1 = is_between(player_y, 11228, 12500)
    angel2 = is_between(player_y, 8400, 9300)
    angel3 = is_between(player_y, 5468, 6748)
    angel4 = is_between(player_y, 2900, 3700)
    angel5 = is_between(player_y, 1628, 2450)
    
    // Collision detection for each angel.
    angel1_col = cannot_move && angel1
    angel2_col = cannot_move && angel2
    angel3_col = cannot_move && angel3
    angel4_col = cannot_move && angel4
    angel5_col = cannot_move && angel5
    
    // Reset when not on the stage screen.
    reset = never (screen != SCREEN_HELL_STAGE)
    
    // Tally each angel that was collided into.
    goal = tally(
        3,
        once(angel1_col),
        once(angel2_col),
        once(angel3_col),
        once(angel4_col),
        once(angel5_col)
    )
    
    achievement(
        title = "Hell and Hell",
        description = "In \"Escape Hell,\" collide with 3 angels on your descent back down to hell.",
        points = 10,
        trigger = reset && measured(goal),
        id = 650238,
        badge = "742712"
    )
}

function cheevo_truck_tracks()
{
    screen = get_curr_screen()
    
    // Check when a track has been cleared.
    beach_clear = on_memory_change(screen, SCREEN_TRUCK_BEACH_STAGE, SCREEN_TRUCK_REPAIR)
    windy_clear = on_memory_change(screen, SCREEN_TRUCK_WINDY_STAGE, SCREEN_TRUCK_REPAIR)
    ice_clear = on_memory_change(screen, SCREEN_TRUCK_ICE_STAGE, SCREEN_TRUCK_REPAIR)
    night_clear = on_memory_change(screen, SCREEN_TRUCK_NIGHT_STAGE, SCREEN_TRUCK_REPAIR)
    sands_clear = on_memory_change(screen, SCREEN_TRUCK_SANDS_STAGE, SCREEN_TRUCK_REPAIR)
    lava_clear = on_memory_change(screen, SCREEN_TRUCK_LAVA_STAGE, SCREEN_TRUCK_REPAIR)
    
    goal = tally(
        6,
        once(beach_clear),
        once(windy_clear),
        once(ice_clear),
        once(night_clear),
        once(sands_clear),
        once(lava_clear)
    )
    
    achievement(
        title = "World Tour",
        description = "In \"Monster Truck Tour,\" clear all 6 tracks in a single session.",
        points = 10,
        trigger = measured(goal),
        id = 649907,
        badge = "742543"
    )
}

function cheevo_truck_no_repair()
{
    screen = get_curr_screen()
    durability = get_truck_durability()
    score = get_curr_score()
    target_score = 1000
    
    // Reset if durability increases or the player is on the game's title, game over, or name entry screens.
    reset = never(durability > prev(durability) || (screen == SCREEN_TRUCK_TITLE ||
        screen == SCREEN_GAME_OVER || screen == SCREEN_NAME_ENTRY))
    
    // Start when the arcade game is first booted up.
    start = once(on_memory_change(screen, SCREEN_TRUCK_TITLE, SCREEN_TRUCK_DEST))
    
    // Win the moment the score reaches the target score (or higher).
    goal = score >= target_score
    
    achievement(
        title = "On-Road Racer",
        description = "In \"Monster Truck Tour,\" reach 1000 points without repairing the truck.",
        points = 10,
        trigger = reset && start && trigger_when(goal),
        id = 650244,
        badge = "742718"
    )
}

function cheevo_monster_enemies()
{
    screen = get_curr_screen()
    score = get_curr_score()
    
    // Score increases after the screen changes.
    score_up = score == prev(score) + 50
    cyan_beat = prior(screen) == SCREEN_MONSTER_CYAN && screen == SCREEN_MONSTER_VICTORY
    magenta_beat = prior(screen) == SCREEN_MONSTER_MAGENTA && screen == SCREEN_MONSTER_VICTORY
    yellow_beat = prior(screen) == SCREEN_MONSTER_YELLOW && screen == SCREEN_MONSTER_VICTORY
    
    // Reset when on the game's title, game over, or name entry screens.
    reset = never(
        screen == SCREEN_MONSTER_TITLE || screen == SCREEN_GAME_OVER ||
        screen == SCREEN_NAME_ENTRY
    )
    
    // Start when switching from the title screen to the main gameplay screen.
    start = once(on_memory_change(screen, SCREEN_MONSTER_TITLE, SCREEN_MONSTER_STAGE))
    
    // Win once all 3 monster have been defeated at least once.
    goal = tally(
        3,
        once(cyan_beat && score_up),
        once(magenta_beat && score_up),
        once(yellow_beat && score_up)
    )
    
    achievement(
        title = "CMYKiller",
        description = "In \"M.O.N.S.T.E.R.,\" defeat all 3 unique boss monsters in a single run.",
        points = 10,
        trigger = reset && start && measured(goal),
        id = 650377,
        badge = "742846"
    )
}

function cheevo_monster_fuel()
{
    screen = get_curr_screen()
    fuel = get_time_remain()
    target_value = 150
    fcount = get_frame_counter()
    target_sec = 25 // target seconds * 60 frames
    
    // Reset if the screen is not the main stage screen or fuel falls below 150.
    reset = never(screen != SCREEN_MONSTER_STAGE || fuel < target_value)
    
    // Win once the counter reaches the target time (and freeze the counter when paused).
    goal = tally(
        target_sec * 60,
        prev(fcount) != fcount && get_pause_state() != 1
    )

    achievement(
        title = "Fueled by Carbohydrates",
        description = format("In \"M.O.N.S.T.E.R.,\" maintain a fuel level of at least {0} for {1} seconds while dodging meteors.",
            target_value, target_sec),
        points = 10,
        trigger = reset && measured(goal, format = "percent"),
        id = 650379,
        badge = "742848"
    )
}

function cheevo_nessi_powerups()
{
    screen = get_curr_screen()
    lv_spd = get_nessi_spd_up()
    lv_jump = get_nessi_jump_up()
    lv_djump = get_nessi_djump_up()
    
    // Reset if on the arcade game's title, game over, or name entry screen
    reset = never(screen == SCREEN_NESSI_TITLE || screen == SCREEN_GAME_OVER || screen == SCREEN_NAME_ENTRY)
    
    // Win once all 9 upgrades are purchased.
    goal = tally(9,
        repeated(4, prev(lv_spd) < lv_spd),
        repeated(4, prev(lv_jump) < lv_jump),
        repeated(1, prev(lv_djump) < lv_djump)
    )
    
    achievement(
        title = "Super Powered Up",
        description = "In \"Nessi: Ocean Racer,\" fully upgrade Nessi.",
        points = 5,
        trigger = reset && measured(goal),
        id = 650574,
        badge = "742855"
    )
}

function cheevo_nessi_no_powerups()
{
    screen = get_curr_screen()
    lv_spd = get_nessi_spd_up()
    lv_jump = get_nessi_jump_up()
    lv_djump = get_nessi_djump_up()
    lives = get_nessi_lives()
    target_score = 1000
    
    // Reset if on the arcade game's title, game over, or name entry screens OR if lives increase OR
    // any power-up are obtained.
    reset = never(screen == SCREEN_NESSI_TITLE || screen == SCREEN_GAME_OVER || screen == SCREEN_NAME_ENTRY ||
        lv_spd > 0 || lv_jump > 0 || lv_djump > 0 || prev(lives) < lives)
        
    start = once(on_memory_change(screen, SCREEN_NESSI_TITLE, SCREEN_NESSI_TURTLE))
    
    goal = get_curr_score() >= target_score
    
    achievement(
        title = "Nimble Nessi",
        description = format("In \"Nessi: Ocean Racer,\" earn a score of at least {0} points without upgrading or healing Nessi.",
            target_score),
        points = 10,
        trigger = reset && start && trigger_when(goal),
        id = 650575,
        badge = "742856"
    )
}

function cheevo_mummy_quick_kills()
{
    screen = get_curr_screen()
    score = get_curr_score()
    fcount = get_frame_counter()
    adv_points = 20
    target_sec = 5
    
    // Reset if not on the main game screen or the timer exceeds the target value (freeze during pause).
    reset = never(screen != SCREEN_MUMMY_STAGE ||
    (once(score == prev(score) + adv_points) &&
        repeated(target_sec * 60 + 1, fcount != prev(fcount) && get_pause_state() != 1)))
    
    start = once(score == prev(score) + adv_points)
    
    goal = repeated(2, score == prev(score) + adv_points)
    
    achievement(
        title = "Unrelenting Curse",
        description = "In \"Curse of the Mummy,\" quickly defeat 2 adventurers within 5 seconds of each other.",
        points = 5,
        trigger = reset && start && trigger_when(goal),
        id = 650576,
        badge = "742857"
    )
}

function cheevo_mummy_ankhs()
{
    screen = get_curr_screen()
    score = get_curr_score()
    
    // Reset when not on the mummy stage screen.
    reset = never(screen != SCREEN_MUMMY_STAGE)
    
    // Tally each time the score increases by 100 points (collected an ankh).
    goal = tally(2, on_memory_change(score, score - 100, score))
    
    achievement(
        title = "Second Life",
        description = "In \"Curse of the Mummy,\" collect 2 ankhs in a single run.",
        points = 5,
        trigger = reset && measured(goal),
        id = 649906,
        badge = "742542"
    )
}

function cheevo_ending_ascend()
{
    screen = get_curr_screen()
    
    goal = get_player_control_state() == 0x12 &&
        on_memory_change(screen, SCREEN_ENDING, SCREEN_CREDITS_1)
    
    achievement(
        title = "Great Gaming Beyond",
        description = "Move towards the light and leave this mortal coil.",
        points = 5,
        trigger = goal,
        type = "win_condition",
        id = 649898,
        badge = "742710"
    )
}

function cheevo_ending_revive()
{
    screen = get_curr_screen()
    
    goal = get_player_control_state() == 0x12 &&
        on_memory_change(screen, SCREEN_CONVO_MONSTER_TAURIPHENA, SCREEN_CREDITS_1)
    
    achievement
    (
        title = "Tauriphena's Blessing",
        description = "Be brought back and live to game another day.",
        points = 5,
        trigger = goal,
        type = "win_condition",
        id = 649899,
        badge = "742711"
    )
}

function cheevo_tokipon_collected(start_id, cheevo_name, rarity, points_awarded,
    cheevo_id = 0, cheevo_badge = "0")
{
    screen = get_curr_screen()
    
        
    // Create an array with all the relevant Tokipon addresses. 
    tokipon_array = []
    for i in range(start_id, start_id + 7)
    {
        array_push(tokipon_array, get_tokipon_obtained(i))
    }
    
    // Reset if the player is not obtaining a new Tokipon
    reset = never(get_curr_screen() != SCREEN_TOKIPON_MACHINE)
    
    // Check if any Tokipon's value has gone from 0 to 1.
    start = on_memory_change(tokipon_array[0], 0, 1) ||
        on_memory_change(tokipon_array[1], 0, 1) ||
        on_memory_change(tokipon_array[2], 0, 1) ||
        on_memory_change(tokipon_array[3], 0, 1) ||
        on_memory_change(tokipon_array[4], 0, 1) ||
        on_memory_change(tokipon_array[5], 0, 1) ||
        on_memory_change(tokipon_array[6], 0, 1) ||
        on_memory_change(tokipon_array[7], 0, 1)
    
    // Only tally Tokipon which have a value greater than 0.
    goal = tally
    (
        8,
        once(tokipon_array[0] > 0),
        once(tokipon_array[1] > 0),
        once(tokipon_array[2] > 0),
        once(tokipon_array[3] > 0),
        once(tokipon_array[4] > 0),
        once(tokipon_array[5] > 0),
        once(tokipon_array[6] > 0),
        once(tokipon_array[7] > 0)
    )
    
    achievement
    (
        title = cheevo_name,
        description = format("Collect all 8 {0}-rarity Tokipon figurines.", rarity),
        points = points_awarded,
        trigger = reset && start && measured(goal),
        id = cheevo_id,
        badge = cheevo_badge
    )
}

//-- Declarations --
// Missables
cheevo_won_intro()
cheevo_befriend_violeta()

// Escape Hell
cheevo_highscore("Heaven or Hell", "Escape Hell", "Violeta", 666,
    get_hell_highscore(), SCREEN_HELL_TITLE, SCREEN_HELL_STAGE,
    650240, "742714"
)
cheevo_hell_heaven()
cheevo_hell_angels()

// Monster Truck Tour
cheevo_highscore("Take That, Bully!", "Monster Truck Tour", "Jerry", 712,
    get_truck_highscore(), SCREEN_TRUCK_TITLE, SCREEN_TRUCK_DEST,
    650239, "742713"
)
cheevo_truck_tracks()
cheevo_truck_no_repair()

// M.O.N.S.T.E.R.
cheevo_highscore("Big Bully Beatdown", "M.O.N.S.T.E.R.", "Dustin", 681,
    get_monster_highscore(), SCREEN_MONSTER_TITLE, SCREEN_MONSTER_STAGE,
    650241, "742715"
)
cheevo_monster_enemies()
cheevo_monster_fuel()

// Nessi: Ocean Racer
cheevo_highscore("Friend of Dorrie", "Nessi: Ocean Racer", "Tim", 435,
    get_nessi_highscore(), SCREEN_NESSI_TITLE, SCREEN_NESSI_TURTLE,
    650243, "742717"
)
cheevo_nessi_powerups()
cheevo_nessi_no_powerups()

// Curse of the Mummy
cheevo_highscore("Immortalized", "Curse of the Mummy", "Mr. G", 493,
    get_mummy_highscore(), SCREEN_MUMMY_TITLE, SCREEN_MUMMY_STAGE,
    650242, "742716"
)
cheevo_mummy_quick_kills()
cheevo_mummy_ankhs()

cheevo_ending_ascend()
cheevo_ending_revive()

cheevo_tokipon_collected(1, "Common Collector", "common", 3, 649901, "742537")
cheevo_tokipon_collected(9, "Un-Commonality", "uncommon", 5, 649902, "742538")
cheevo_tokipon_collected(17, "How I Like My Steak", "rare", 10, 649903, "742539")
cheevo_tokipon_collected(25, "Not So Secret Now", "secret rare", 25, 649904, "742540")

//----- Leaderboards -----
//-- Functions --
function lb_speedrun()
{
    screen = get_curr_screen()
    
    // Reset if the player ever returns to the title menus.
    reset = screen == SCREEN_BOOT || screen == SCREEN_INTRO_CARD ||
        screen == SCREEN_TITLE || screen == SCREEN_MAIN_MENU
    
    // Start when beginning a new game.
    begin = on_memory_change(screen, SCREEN_MAIN_MENU, SCREEN_HELL_STAGE)
    
    // Submit upon reaching the credits.
    goal = (prev(screen) == SCREEN_ENDING || prev(screen) == SCREEN_CONVO_MONSTER_TAURIPHENA) &&
        screen == SCREEN_CREDITS_1
    
    leaderboard(
        title = "Afterlife Speedrun",
        description = "In a single session, clear from a new game as fast as possible.",
        start = begin, cancel = reset, submit = goal,
        value = always_true(), format = "FRAMES", lower_is_better = true,
        id = 176763
    )
}

function lb_highscore(game_name, title_screen, first_screen, lb_id = 0)
{
    screen = get_curr_screen()
    score = get_curr_score()
    
    // Reset on the game's title and name entry screens.
    reset = screen == title_screen || screen == SCREEN_NAME_ENTRY
    
    // Start once the game begins.
    begin = once(on_memory_change(screen, title_screen, first_screen))
    
    // Submit on game over.
    goal = screen == SCREEN_GAME_OVER
    
    leaderboard(
        title = format("{0} - Highscore", game_name),
        description = format("Highest score achieved in {0}.", game_name),
        start = begin, cancel = reset, submit = goal,
        value = get_curr_score(), format = "VALUE", lower_is_better = false,
        id = lb_id
    )
}

//-- Declarations --
lb_speedrun()

lb_highscore("Escape Hell", SCREEN_HELL_TITLE, SCREEN_HELL_STAGE, 176764)
lb_highscore("Monster Truck Tour", SCREEN_TRUCK_TITLE, SCREEN_TRUCK_DEST, 176765)
lb_highscore("M.O.N.S.T.E.R", SCREEN_MONSTER_TITLE, SCREEN_MONSTER_STAGE, 176766)
lb_highscore("Nessi: Ocean Racer", SCREEN_NESSI_TITLE, SCREEN_NESSI_TURTLE, 176767)
lb_highscore("Curse of the Mummy", SCREEN_MUMMY_TITLE, SCREEN_MUMMY_STAGE, 176768)

//----- Rich Presence -----
//-- Lookups --
mkid_str = "monster kid"
main_menu_str = "is haunting the main menu."
bullied_str = "is being picked on by the bullies."
toki_str = "is checking out his awesome Tokipon collection!"
credits_str = "is viewing the credits. Thanks for playing!"

lookup_screen_mkid = {
    SCREEN_MAIN_MENU: mkid_str, // This one only displays if it was the previous screen.
    SCREEN_DEATH: mkid_str,
    SCREEN_CONVO_MONSTER_BULLIES: mkid_str,
    SCREEN_ARCADE_INTRO_1: mkid_str,
    SCREEN_CONVO_MONSTER_TAURIPHENA: mkid_str,
    SCREEN_CREDITS_1: mkid_str,
    SCREEN_CREDITS_2: mkid_str,
    SCREEN_CREDITS_3: mkid_str,
    SCREEN_CREDITS_4: mkid_str,
    SCREEN_CREDITS_5: mkid_str,
    SCREEN_CREDITS_6: mkid_str
}

lookup_screen_text = {
    SCREEN_BOOT: main_menu_str,
    SCREEN_INTRO_CARD: main_menu_str,
    SCREEN_TITLE: main_menu_str,
    SCREEN_MAIN_MENU: main_menu_str,
    
    SCREEN_DEATH: bullied_str,
    SCREEN_CONVO_MONSTER_BULLIES: bullied_str,
    SCREEN_ARCADE_INTRO_1: bullied_str,
    
    SCREEN_HELL_TITLE: "ESCAPE HELL",
    SCREEN_TRUCK_TITLE: "MONSTER TRUCK TOUR",
    SCREEN_MONSTER_TITLE: "M.O.N.S.T.E.R", // A period will follow the text, so the last one isn't needed here.
    SCREEN_NESSI_TITLE: "NESSI: OCEAN RACER",
    SCREEN_MUMMY_TITLE: "CURSE OF THE MUMMY",
    
    SCREEN_HELL_STAGE: "is helping a demon ESCAPE HELL",
    SCREEN_HELL_HEAVEN: "has helped another demon ESCAPE HELL",
    
    SCREEN_TRUCK_DEST: "Choosing a destination…",
    SCREEN_TRUCK_REPAIR: "Choosing a destination…",
    SCREEN_TRUCK_BEACH_CARD: "Skyline Beach",
    SCREEN_TRUCK_BEACH_STAGE: "Skyline Beach",
    SCREEN_TRUCK_WINDY_CARD: "Windy Meadows",
    SCREEN_TRUCK_WINDY_STAGE: "Windy Meadows",
    SCREEN_TRUCK_ICE_CARD: "Frozen Fields",
    SCREEN_TRUCK_ICE_STAGE: "Frozen Fields",
    SCREEN_TRUCK_NIGHT_CARD: "Lights of the Night",
    SCREEN_TRUCK_NIGHT_STAGE: "Lights of the Night",
    SCREEN_TRUCK_SANDS_CARD: "Endless Sands",
    SCREEN_TRUCK_SANDS_STAGE: "Endless Sands",
    SCREEN_TRUCK_LAVA_CARD: "Lava Lake",
    SCREEN_TRUCK_LAVA_STAGE: "Lava Lake",
    
    SCREEN_MONSTER_STAGE: "through space.",
    SCREEN_MONSTER_WARN: "and approaching and enemy!",
    SCREEN_MONSTER_VICTORY: "and defeating an enemy!",
    SCREEN_MONSTER_CYAN: "while battling the cyan monster.",
    SCREEN_MONSTER_MAGENTA: "while battling the magenta monster.",
    SCREEN_MONSTER_YELLOW: "while battling the yellow monster.",
    
    SCREEN_NESSI_TURTLE: "rooting for NESSI: OCEAN RACER against a turtle!",
    SCREEN_NESSI_DOLPHIN: "rooting for NESSI: OCEAN RACER against a dolphin!",
    SCREEN_NESSI_OCTO: "rooting for NESSI: OCEAN RACER against a octopus!",
    SCREEN_NESSI_NARWHAL: "rooting for NESSI: OCEAN RACER against a narwhal!",
    SCREEN_NESSI_SERPENT: "rooting for NESSI: OCEAN RACER against a sea serpent!",
    SCREEN_NESSI_SHARK: "rooting for NESSI: OCEAN RACER against a shark!",
    SCREEN_NESSI_WIN: "celebrating with NESSI: OCEAN RACER!",
    SCREEN_NESSI_LOSE: "consoling NESSI: OCEAN RACER…",
    SCREEN_NESSI_UPGRADE: "upgrading NESSI: OCEAN RACER.",
    
    SCREEN_GAME_OVER: "has gotten a game over.",
    SCREEN_NAME_ENTRY: "has gotten a new highscore!",
    
    SCREEN_ENDING: "is ascending…",
    SCREEN_CONVO_MONSTER_TAURIPHENA: "has been brought back to life!",
    
    SCREEN_CREDITS_1: credits_str,
    SCREEN_CREDITS_2: credits_str,
    SCREEN_CREDITS_3: credits_str,
    SCREEN_CREDITS_4: credits_str,
    SCREEN_CREDITS_5: credits_str,
    SCREEN_CREDITS_6: credits_str,
    
    SCREEN_TOKIPON_C: toki_str,
    SCREEN_TOKIPON_U: toki_str,
    SCREEN_TOKIPON_R: toki_str,
    SCREEN_TOKIPON_SR: toki_str,
    SCREEN_TOKIPON_MACHINE: "is rolling the gacha!"
}

lookup_unlocked_symbol = {
    0: "❌",
    1: "✔"
}

//-- Function & Declaration --
function rp()
{
    screen = get_curr_screen()
    
    // Arcade Game Title Screens
    rich_presence_conditional_display(
        screen == SCREEN_HELL_TITLE || screen == SCREEN_TRUCK_TITLE ||
        screen == SCREEN_MONSTER_TITLE || screen == SCREEN_NESSI_TITLE ||
        screen == SCREEN_MUMMY_TITLE,
        "The ghost is on the title screen of {0}.",
        rich_presence_lookup("ScrnTxt", screen, lookup_screen_text)
    )
    
    // Escape Hell
    rich_presence_conditional_display(
        screen == SCREEN_HELL_STAGE || screen == SCREEN_HELL_HEAVEN,
        "The {0} {1}. • 🎯 {2} (🥇 {3})",
        rich_presence_lookup("MKid", prior(screen), lookup_screen_mkid, "ghost"),
        rich_presence_lookup("ScrnTxt", screen, lookup_screen_text),
        rich_presence_macro("Number", get_curr_score()),
        rich_presence_macro("Number", get_hell_highscore())
    )
    
    // Monster Truck Tour
    rich_presence_conditional_display(
        screen == SCREEN_TRUCK_DEST || screen == SCREEN_TRUCK_REPAIR ||
        screen == SCREEN_TRUCK_BEACH_CARD || screen == SCREEN_TRUCK_BEACH_STAGE ||
        screen == SCREEN_TRUCK_WINDY_CARD || screen == SCREEN_TRUCK_WINDY_STAGE ||
        screen == SCREEN_TRUCK_ICE_CARD || screen == SCREEN_TRUCK_ICE_STAGE ||
        screen == SCREEN_TRUCK_NIGHT_CARD || screen == SCREEN_TRUCK_NIGHT_STAGE ||
        screen == SCREEN_TRUCK_SANDS_CARD || screen == SCREEN_TRUCK_SANDS_STAGE ||
        screen == SCREEN_TRUCK_LAVA_CARD || screen == SCREEN_TRUCK_LAVA_STAGE,
        "The ghost is driving in a MONSTER TRUCK TOUR. • 🛣️ {0} • 🎯 {1} (🥇 {2}) • 🔧 {3}%",
        rich_presence_lookup("ScrnTxt", screen, lookup_screen_text),
        rich_presence_macro("Number", get_curr_score()),
        rich_presence_macro("Number", get_truck_highscore()),
        rich_presence_macro("Number", get_truck_durability())
    )
    
    // M.O.N.S.T.E.R.
    rich_presence_conditional_display(
        screen == SCREEN_MONSTER_STAGE || screen == SCREEN_MONSTER_WARN ||
        screen == SCREEN_MONSTER_VICTORY || screen == SCREEN_MONSTER_CYAN ||
        screen == SCREEN_MONSTER_MAGENTA || screen == SCREEN_MONSTER_YELLOW,
        "The ghost is flying a M.O.N.S.T.E.R. ship {0} • 🎯 {1} (🥇 {2}) • 🔥 {3}%",
        rich_presence_lookup("ScrnTxt", screen, lookup_screen_text),
        rich_presence_macro("Number", get_curr_score()),
        rich_presence_macro("Number", get_monster_highscore()),
        rich_presence_macro("Number", get_time_remain())
    )
    
    // Nessi: Ocean Racer
    rich_presence_conditional_display(
        screen == SCREEN_NESSI_TURTLE || screen == SCREEN_NESSI_DOLPHIN ||
        screen == SCREEN_NESSI_OCTO || screen == SCREEN_NESSI_NARWHAL ||
        screen == SCREEN_NESSI_SERPENT || screen == SCREEN_NESSI_SHARK ||
        screen == SCREEN_NESSI_WIN || screen == SCREEN_NESSI_LOSE ||
        screen == SCREEN_NESSI_UPGRADE,
        "The ghost is {0} • 🎯 {1} (🥇 {2}) • 🐋 {3} • ⏩ +{4} • 🔼 +{5} • ⏫ {6}",
        rich_presence_lookup("ScrnTxt", screen, lookup_screen_text),
        rich_presence_macro("Number", get_curr_score()),
        rich_presence_macro("Number", get_nessi_highscore()),
        rich_presence_macro("Number", get_nessi_lives()),
        rich_presence_macro("Number", get_nessi_spd_up()),
        rich_presence_macro("Number", get_nessi_jump_up()),
        rich_presence_lookup("Unlock", get_nessi_djump_up(), lookup_unlocked_symbol)
        
    )
    
    // Curse of the Mummy
    rich_presence_conditional_display(
        screen == SCREEN_MUMMY_STAGE,
        "The ghost is unleashing the CURSE OF THE MUMMY on foolish adventurers. • 🎯 {0} (🥇 {1}) • ⌛︎ {2}",
        rich_presence_macro("Number", get_curr_score()),
        rich_presence_macro("Number", get_mummy_highscore()),
        rich_presence_macro("Number", get_time_remain())
    )
    
    // Main Menu
    rich_presence_conditional_display(
        screen == SCREEN_BOOT || screen == SCREEN_INTRO_CARD || screen == SCREEN_TITLE ||
        screen == SCREEN_MAIN_MENU,
        "The ghost is haunting the main menu."
    )
    
    // Default - Intro, arcade overworld, most convos, pause menu, Tokipon collection,
    //           Tokipon machine
    rich_presence_display("The {0} {1} • 🏆 {2}/5 • 🎟️{3} • 🦖 {4}/32",
        rich_presence_lookup("MKid", screen, lookup_screen_mkid, "ghost"),
        rich_presence_lookup("ScrnTxt", screen, lookup_screen_text, "is haunting the arcade."),
        rich_presence_macro("Number", get_highscores_beaten()),
        rich_presence_macro("Number", get_tickets()),
        rich_presence_macro("Number", get_tokipon_obtained_unique())
    )
}

rp()