// ~Homebrew~ Ghost of the Arcade
// #ID = 46406

//----- Memory Functions & Enums -----
//-- Global Functions --
// $C530: [16-bit] Current Screen
//        
//        Values:
//        Intro Card = 0x5aec
//        Title = 0x6328
//        Main Menu = 0x6490
//        Arcade = 0x6c9c
//        Pause Menu = 0x527c
//        Tokipon Collection - Commons = 0x6d00
//        Tokipon Collection - Uncommons = 0x6e71
//        Tokipon Collection - Rares = 0x6fd9
//        Tokipon Collection - Secret Rares = 0x7141
//        Death Cutscene = 0x53e4
//        Talking: Monster & Bullies = 0x79b1
//        Talking: Bullies & Mr. G = 0x7b19
//        Talking: Ghost, alone = 0x554c
//        Talking: Mr. G & Ghost = 0x56b4
//        Talking: Ghost & Dustin = 0x581c
//        Talking: Ghost & Tim = 0x5984
//        Talking: Ghost & Mr. G (goggles) = 0x7c81
//        Talking: Ghost & Violeta = 0x4e44
//        Talking: Ghost & Tauriphena = 0x7de9
//        Talking: Monster & Tauriphena = 0x72aa
//        Ending Hallway = 0x6695
//        Credits 1 = 0x5f24
//        Credits 2 = 0x68c8
//        Credits 3 = 0x6a30
//        Credits 4 = 0x6b98
//        Credits 5 = 0x6794
//        Credits 6 = 0x68fc
//        "Escape Hell" Title = 0x7411
//        "Escape Hell" Stage = 0x6c14
//        "Escape Hell" Heaven = 0x608c
//        "Monster Truck Tour" Title = 0x7579
//        "Monster Truck Tour" Next Destination = 0x662c
//        "Monster Truck Tour" Skyline Beach Card = 0x65f8
//        "Monster Truck Tour" Skyline Beach Stage = 0x6db2
//        "Monster Truck Tour" Windy Meadows Card = 0x6760
//        "Monster Truck Tour" Windy Meadows Stage = 0x6b06
//        "Monster Truck Tour" Frozen Fields Card = 0x6a64
//        "Monster Truck Tour" Frozen Fields Stage = 0x705e
//        "Monster Truck Tour" Lights of the Night Card = 0x6bcc
//        "Monster Truck Tour" Lights of the Night Stage = 0x75b6
//        "Monster Truck Tour" Endless Sands Card= 0x6d34
//        "Monster Truck Tour" Endless Sands Stage = 0x7862
//        "Monster Truck Tour" Lava Lake Card = 0x6e9c
//        "Monster Truck Tour" Lava Lake Stage = 0x730a
//        "Monster Truck Tour" Repair = 0x757a
//        "M.O.N.S.T.E.R." Title = 0x76e1
//        "M.O.N.S.T.E.R." Stage = 0x6a7a
//        "M.O.N.S.T.E.R." Warning = 0x5c54
//        "M.O.N.S.T.E.R." Cyan Enemy = 0x7492
//        "M.O.N.S.T.E.R." Magenta Enemy = 0x6cb6
//        "M.O.N.S.T.E.R." Yellow Enemy = 0x76ce
//        "Nessi: Ocean Racer" Title = 0x7849
//        "Nessi: Ocean Racer" Turtle = 0x5cd8
//        "Nessi: Ocean Racer" Dolphin = 0x6e6c
//        "Nessi: Ocean Racer" Octopus = 0x4802
//        "Nessi: Ocean Racer" Narwhal = 0x5996
//        "Nessi: Ocean Racer" Sea Serpent = 0x6b2a
//        "Nessi: Ocean Racer" Sunfish = 0x6e0c
//        "Nessi: Ocean Racer" Race Won = 0x61f4
//        "Nessi: Ocean Racer" Race Lost = 0x64c4
//        "Nessi: Ocean Racer" Upgrades = 0x635c
//        "Curse of the Mummy" Title = 0x6101
//        "Curse of the Mummy" Stage = 0x4009
//        Game Over = 0x5114
function get_curr_screen() => word(0xC530)
SCREEN_INTRO = 0x5aec
SCREEN_TITLE = 0x6328
SCREEN_MAIN_MENU = 0x6490
SCREEN_ARCADE = 0x6c9c
SCREEN_PAUSE = 0x527c
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
SCREEN_MONSTER_CYAN = 0x7492
SCREEN_MONSTER_MAGENTA = 0x6cb6
SCREEN_MONSTER_YELLOW = 0x76ce
SCREEN_NESSI_TITLE = 0x7849
SCREEN_NESSI_TURTLE = 0x5cd8
SCREEN_NESSI_DOLPHIN = 0x6e6c
SCREEN_NESSI_OCTO = 0x4802
SCREEN_NESSI_NARWHAL = 0x5996
SCREEN_NESSI_SERPENT = 0x6b2a
SCREEN_NESSI_SUNFISH = 0x6e0c
SCREEN_NESSI_WIN = 0x61f4
SCREEN_NESSI_LOSE = 0x64c4
SCREEN_NESSI_UPGRADE = 0x635c
SCREEN_MUMMY_TITLE = 0x6101
SCREEN_MUMMY_STAGE = 0x4009
SCREEN_GAME_OVER = 0x5114

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
function current_violeta_conversation_loop() => byte(0xCDA5)
VIOLETA_CONVO_LOOP_FIRST = 0
VIOLETA_CONVO_LOOP_SECOND = 1
VIOLETA_CONVO_LOOP_THIRD = 2
VIOLETA_CONVO_LOOP_LAST = 3

// $CADC: [8-bit] Intro Message ID
//        
//        Values:
//        0 = Loss
//        1 = No Loss
function get_intro_message_id() => byte(0xCADC)
function won_intro() => get_intro_message_id() == 1

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
function player_nessi_cursor_control_state() => byte(0xC519)

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

//----- Helper & Logic Functions -----



//----- Achievements -----
//achievement(title, description, points, trigger, id=0, badge="0", type="missable / progression / win_condition"")


//----- Leaderboards -----


//----- Rich Presence -----