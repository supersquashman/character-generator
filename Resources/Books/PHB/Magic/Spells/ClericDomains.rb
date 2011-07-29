SpellList.granted_powers_list["Air Domain"] = "Turn or destroy earth creatures as a good cleric turns undead." +
 "Rebuke, command, or bolster air creatures as an evil cleric rebukes undead." + 
 "Use these abilities a total number of times per day equal to 3 + your Charisma modifier."
SpellList.granted_powers_procs["Air Domain"] = Proc.new{|character|}
SpellList.load_spells("Air Domain", "Cleric", [
["Obscuring Mist", "", "", "Fog surrounds you."],
["Wind Wall", "", "", "Deflects arrows, smaller creatures, and gases."],
["Gaseous Form", "", "", "Subject becomes insubstantial and can fly slowly."],
["Air Walk", "", "", "Subject treads on air as if solid (climb at 44-degree angle)."],
["Control Winds", "", "", "Change wind direction and speed."],
["Chain Lightning", "", "", "1d6/level damage; 1 secondary bolt/level each deals half damage."],
["Control Weather", "", "", "Changes weather in local area."],
["Whirlwind", "", "", "Cyclone deals damage and can pick up creatures."],
["Elemental Swarm", "", "", "Summons multiple elementals."]]

=begin
Animal Domain
Granted Powers
You can use speak with animals once per day as a spell-like ability.

Add Knowledge (nature) to your list of cleric class skills.

Animal Domain Spells
Calm Animals: Calms (2d4 + level) HD of animals.
Hold Animal: Paralyzes one animal for 1 round/level.
Dominate Animal: Subject animal obeys silent mental commands.
Summon Nature’s Ally IV*: Calls creature to fight.
Commune with Nature: Learn about terrain for 1 mile/level.
Antilife Shell: 10-ft. field hedges out living creatures.
Animal Shapes: One ally/level polymorphs into chosen animal.
Summon Nature’s Ally VIII*: Calls creature to fight.
Shapechange F: Transforms you into any creature, and change forms once per round.
*Can only summon animals.

Chaos Domain
Granted Power
You cast chaos spells at +1 caster level.

Chaos Domain Spells
Protection from Law: +2 to AC and saves, counter mind control, hedge out elementals and outsiders.
Shatter: Sonic vibration damages objects or crystalline creatures.
Magic Circle against Law: As protection spells, but 10-ft. radius and 10 min./level.
Chaos Hammer: Damages and staggers lawful creatures.
Dispel Law: +4 bonus against attacks by lawful creatures.
Animate Objects: Objects attack your foes.
Word of Chaos: Kills, confuses, stuns, or deafens nonchaotic subjects.
Cloak of Chaos F: +4 to AC, +4 resistance, SR 25 against lawful spells.
Summon Monster IX*: Calls extraplanar creature to fight for you.
*Cast as a chaos spell only.

Death Domain
Granted Power
You may use a death touch once per day. Your death touch is a supernatural ability that produces a death effect. You must succeed on a melee touch attack against a living creature (using the rules for touch spells). When you touch, roll 1d6 per cleric level you possess. If the total at least equals the creature’s current hit points, it dies (no save).

Death Domain Spells
Cause Fear: One creature of 5 HD or less flees for 1d4 rounds.
Death Knell: Kill dying creature and gain 1d8 temporary hp, +2 to Str, and +1 caster level.
Animate Dead M: Creates undead skeletons and zombies.
Death Ward: Grants immunity to death spells and negative energy effects.
Slay Living: Touch attack kills subject.
Create Undead M: Create ghouls, ghasts, mummies, or mohrgs.
Destruction F: Kills subject and destroys remains.
Create Greater Undead M: Create shadows, wraiths, spectres, or devourers.
Wail of the Banshee: Kills one creature/level.
Destruction Domain
Granted Power
You gain the smite power, the supernatural ability to make a single melee attack with a +4 bonus on attack rolls and a bonus on damage rolls equal to your cleric level (if you hit). You must declare the smite before making the attack. This ability is usable once per day.

Destruction Domain Spells
Inflict Light Wounds: Touch attack, 1d8 damage +1/level (max +5).
Shatter: Sonic vibration damages objects or crystalline creatures.
Contagion: Infects subject with chosen disease.
Inflict Critical Wounds: Touch attack, 4d8 damage +1/level (max +20).
Inflict Light Wounds, Mass: Deals 1d8 damage +1/level to any creatures.
Harm: Deals 10 points/level damage to target.
Disintegrate: Makes one creature or object vanish.
Earthquake: Intense tremor shakes 80-ft.-radius.
Implosion: Kills one creature/round.
Earth Domain
Granted Power
Turn or destroy air creatures as a good cleric turns undead. Rebuke, command, or bolster earth creatures as an evil cleric rebukes undead. Use these abilities a total number of times per day equal to 3 + your Charisma modifier. This granted power is a supernatural ability.

Earth Domain Spells
Magic Stone: Three stones become +1 projectiles, 1d6 +1 damage.
Soften Earth and Stone: Turns stone to clay or dirt to sand or mud.
Stone Shape: Sculpts stone into any shape.
Spike Stones: Creatures in area take 1d8 damage, may be lowed.
Wall of Stone: Creates a stone wall that can be shaped.
Stoneskin M: Ignore 10 points of damage per attack.
Earthquake: Intense tremor shakes 80-ft.-radius.
Iron Body: Your body becomes living iron.
Elemental Swarm*: Summons multiple elementals.
*Cast as an earth spell only.

Evil Domain
Granted Power
You cast evil spells at +1 caster level.

Evil Domain Spells
Protection from Good: +2 to AC and saves, counter mind control, hedge out elementals and outsiders.
Desecrate M: Fills area with negative energy, making undead stronger.
Magic Circle against Good: As protection spells, but 10-ft. radius and 10 min./level.
Unholy Blight: Damages and sickens good creatures.
Dispel Good: +4 bonus against attacks by good creatures.
Create Undead M: Create ghouls, ghasts, mummies, or mohrgs.
Blasphemy: Kills, paralyzes, weakens, or dazes nonevil subjects.
Unholy Aura F: +4 to AC, +4 resistance, SR 25 against good spells.
Summon Monster IX*: Calls extraplanar creature to fight for you.
*Cast as an evil spell only.

Fire Domain
Granted Power
Turn or destroy water creatures as a good cleric turns undead. Rebuke, command, or bolster fire creatures as an evil cleric rebukes undead. Use these abilities a total number of times per day equal to 3 + your Charisma modifier. This granted power is a supernatural ability.

Fire Domain Spells
Burning Hands: 1d4/level fire damage (max 5d4).
Produce Flame: 1d6 damage +1/ level, touch or thrown.
Resist Energy*: Ignores 10 (or more) points of damage/attack from specified energy type.
Wall of Fire: Deals 2d4 fire damage out to 10 ft. and 1d4 out to 20 ft. Passing through wall deals 2d6 damage +1/level.
Fire Shield: Creatures attacking you take fire damage; you’re protected from heat or cold.
Fire Seeds: Acorns and berries become grenades and bombs.
Fire Storm: Deals 1d6/level fire damage.
Incendiary Cloud: Cloud deals 4d6 fire damage/round.
Elemental Swarm**: Summons multiple elementals.
*Resist cold or fire only.

**Cast as a fire spell only.

Good Domain
Granted Power
You cast good spells at +1 caster level.

Good Domain Spells
Protection from Evil: +2 to AC and saves, counter mind control, hedge out elementals and outsiders.
Aid: +1 on attack rolls, +1 on saves against fear, 1d8 temporary hp +1/level (max +10).
Magic Circle against Evil: As protection spells, but 10-ft. radius and 10 min./level.
Holy Smite: Damages and blinds evil creatures.
Dispel Evil: +4 bonus against attacks by evil creatures.
Blade Barrier: Wall of blades deals 1d6/level damage.
Holy Word F: Kills, paralyzes, slows, or deafens nongood subjects.
Holy Aura: +4 to AC, +4 resistance, and SR 25 against evil spells.
Summon Monster IX*: Calls extraplanar creature to fight for you.
*Cast as a good spell only.

Healing Domain
Granted Power
You cast healing spells at +1 caster level.

Healing Domain Spells
Cure Light Wounds: Cures 1d8 damage +1/level (max +5).
Cure Moderate Wounds: Cures 2d8 damage +1/level (max +10).
Cure Serious Wounds: Cures 3d8 damage +1/level (max +15).
Cure Critical Wounds: Cures 4d8 damage +1/level (max +20).
Cure Light Wounds, Mass: Cures 1d8 damage +1/level (max +25) for many creatures.
Heal: Cures 10 points/level of damage, all diseases and mental conditions.
Regenerate: Subject’s severed limbs grow back, cures 4d8 damage +1/level (max +35).
Cure Critical Wounds, Mass: Cures 4d8 damage +1/level (max +40) for many creatures.
Heal, Mass: As heal, but with several subjects.
Knowledge Domain
Granted Power
Add all Knowledge skills to your list of cleric class skills.

You cast divination spells at +1 caster level.

Knowledge Domain Spells
Detect Secret Doors: Reveals hidden doors within 60 ft.
Detect Thoughts: Allows “listening” to surface thoughts.
Clairaudience/Clairvoyance: Hear or see at a distance for 1 min./level.
Divination M: Provides useful advice for specific proposed actions.
True Seeing M: Lets you see all things as they really are.
Find the Path: Shows most direct way to a location.
Legend Lore M F: Lets you learn tales about a person, place, or thing.
Discern Location: Reveals exact location of creature or object.
Foresight: “Sixth sense” warns of impending danger.
Law Domain
Granted Power
You cast law spells at +1 caster level.

Law Domain Spells
Protection from Chaos: +2 to AC and saves, counter mind control, hedge out elementals and outsiders.
Calm Emotions: Calms creatures, negating emotion effects.
Magic Circle against Chaos: As protection spells, but 10-ft. radius and 10 min./level.
Order’s Wrath: Damages and dazes chaotic creatures.
Dispel Chaos: +4 bonus against attacks by chaotic creatures.
Hold Monster: As hold person, but any creature.
Dictum: Kills, paralyzes, slows, or deafens nonlawful subjects.
Shield of Law F: +4 to AC, +4 resistance, and SR 25 against chaotic spells.
Summon Monster IX*: Calls extraplanar creature to fight for you.
*Cast as a law spell only.

Luck Domain
Granted Power
You gain the power of good fortune, which is usable once per day. This extraordinary ability allows you to reroll one roll that you have just made before the game master declares whether the roll results in success or failure. You must take the result of the reroll, even if it’s worse than the original roll.

Luck Domain Spells
Entropic Shield: Ranged attacks against you have 20% miss chance.
Aid: +1 on attack rolls, +1 against fear, 1d8 temporary hp +1/level (max +10).
Protection from Energy: Absorb 12 points/level of damage from one kind of energy.
Freedom of Movement: Subject moves normally despite impediments.
Break Enchantment: Frees subjects from enchantments, alterations, curses, and petrification.
Mislead: Turns you invisible and creates illusory double.
Spell Turning: Reflect 1d4+6 spell levels back at caster.
Moment of Prescience: You gain insight bonus on single attack roll, check, or save.
Miracle X: Requests a deity’s intercession.
Magic Domain
Granted Power
Use scrolls, wands, and other devices with spell completion or spell trigger activation as a wizard of one-half your cleric level (at least 1st level). For the purpose of using a scroll or other magic device, if you are also a wizard, actual wizard levels and these effective wizard levels stack.

Magic Domain Spells
Magic Aura: Alters object’s magic aura.
Identify: Determines properties of magic item.
Dispel Magic: Cancels magical spells and effects.
Imbue with Spell Ability: Transfer spells to subject.
Spell Resistance: Subject gains SR 12 + level.
Antimagic Field: Negates magic within 10 ft.
Spell Turning: Reflect 1d4+6 spell levels back at caster.
Protection from Spells M F: Confers +8 resistance bonus.
Mage’s Disjunction: Dispels magic, disenchants magic items.
Plant Domain
Granted Powers
Rebuke or command plant creatures as an evil cleric rebukes or commands undead. Use this ability a total number of times per day equal to 3 + your Charisma modifier. This granted power is a supernatural ability.

Add Knowledge (nature) to your list of cleric class skills.

Plant Domain Spells
Entangle: Plants entangle everyone in 40-ft.-radius.
Barkskin: Grants +2 (or higher) enhancement to natural armor.
Plant Growth: Grows vegetation, improves crops.
Command Plants: Sway the actions of one or more plant creatures.
Wall of Thorns: Thorns damage anyone who tries to pass.
Repel Wood: Pushes away wooden objects.
Animate Plants: One or more trees animate and fight for you.
Control Plants: Control actions of one or more plant creatures.
Shambler: Summons 1d4+2 shambling mounds to fight for you.
Protection Domain
Granted Power
You can generate a protective ward as a supernatural ability. Grant someone you touch a resistance bonus equal to your cleric level on his or her next saving throw. Activating this power is a standard action. The protective ward is an abjuration effect with a duration of 1 hour that is usable once per day.

Protection Domain Spells
Sanctuary: Opponents can’t attack you, and you can’t attack.
Shield Other F: You take half of subject’s damage.
Protection from Energy: Absorb 12 points/level of damage from one kind of energy.
Spell Immunity: Subject is immune to one spell per four levels.
Spell Resistance: Subject gains SR 12 + level.
Antimagic Field: Negates magic within 10 ft.
Repulsion: Creatures can’t approach you.
Mind Blank: Subject is immune to mental/emotional magic and scrying.
Prismatic Sphere: As prismatic wall, but surrounds on all sides.
Strength Domain
Granted Power
You can perform a feat of strength as a supernatural ability. You gain an enhancement bonus to Strength equal to your cleric level. Activating the power is a free action, the power lasts 1 round, and it is usable once per day.

Strength Domain Spells
Enlarge Person: Humanoid creature doubles in size.
Bull’s Strength: Subject gains +4 to Str for 1 min./level.
Magic Vestment: Armor or shield gains +1 enhancement per four levels.
Spell Immunity: Subject is immune to one spell per four levels.
Righteous Might: Your size increases, and you gain combat bonuses.
Stoneskin M: Ignore 10 points of damage per attack.
Grasping Hand: Large hand provides cover, pushes, or grapples.
Clenched Fist: Large hand provides cover, pushes, or attacks your foes.
Crushing Hand: Large hand provides cover, pushes, or crushes your foes.
Sun Domain
Granted Power
Once per day, you can perform a greater turning against undead in place of a regular turning. The greater turning is like a normal turning except that the undead creatures that would be turned are destroyed instead.

Sun Domain Spells
Endure Elements: Exist comfortably in hot or cold environments.
Heat Metal: Make metal so hot it damages those who touch it.
Searing Light: Ray deals 1d8/two levels, more against undead.
Fire Shield: Creatures attacking you take fire damage; you’re protected from heat or cold.
Flame Strike: Smite foes with divine fire (1d6/level damage).
Fire Seeds: Acorns and berries become grenades and bombs.
Sunbeam: Beam blinds and deals 4d6 damage.
Sunburst: Blinds all within 10 ft., deals 6d6 damage.
Prismatic Sphere: As prismatic wall, but surrounds on all sides.
Travel Domain
Granted Powers
For a total time per day of 1 round per cleric level you possess, you can act normally regardless of magical effects that impede movement as if you were affected by the spell freedom of movement. This effect occurs automatically as soon as it applies, lasts until it runs out or is no longer needed, and can operate multiple times per day (up to the total daily limit of rounds).

This granted power is a supernatural ability.

Add Survival to your list of cleric class skills.

Travel Domain Spells
Longstrider: Increases your speed.
Locate Object: Senses direction toward object (specific or type).
Fly: Subject flies at speed of 60 ft.
Dimension Door: Teleports you short distance.
Teleport: Instantly transports you as far as 100 miles/level.
Find the Path: Shows most direct way to a location.
Teleport, Greater: As teleport, but no range limit and no off-target arrival.
Phase Door: Creates an invisible passage through wood or stone.
Astral Projection M: Projects you and companions onto Astral Plane.
Trickery Domain
Granted Power
Add Bluff, Disguise, and Hide to your list of cleric class skills.

Trickery Domain Spells
Disguise Self: Disguise own appearance.
Invisibility: Subject invisible 1 min./level or until it attacks.
Nondetection M: Hides subject from divination, scrying.
Confusion: Subjects behave oddly for 1 round/level.
False Vision M: Fools scrying with an illusion.
Mislead: Turns you invisible and creates illusory double.
Screen: Illusion hides area from vision, scrying.
Polymorph Any Object: Changes any subject into anything else.
Time Stop: You act freely for 1d4+1 rounds.
War Domain
Granted Power
Free Martial Weapon Proficiency with deity’s favored weapon (if necessary) and Weapon Focus with the deity’s favored weapon.

War Domain Spells
Magic Weapon: Weapon gains +1 bonus.
Spiritual Weapon: Magical weapon attacks on its own.
Magic Vestment: Armor or shield gains +1 enhancement per four levels.
Divine Power: You gain attack bonus, +6 to Str, and 1 hp/level.
Flame Strike: Smite foes with divine fire (1d6/level damage).
Blade Barrier: Wall of blades deals 1d6/level damage.
Power Word Blind: Blinds creature with 200 hp or less.
Power Word Stun: Stuns creature with 150 hp or less.
Power Word Kill: Kills creature with 100 hp or less.
Water Domain
Granted Power
Turn or destroy fire creatures as a good cleric turns undead. Rebuke, command, or bolster water creatures as an evil cleric rebukes undead. Use these abilities a total number of times per day equal to 3 + your Charisma modifier. This granted power is a supernatural ability.

Water Domain Spells
Obscuring Mist: Fog surrounds you.
Fog Cloud: Fog obscures vision.
Water Breathing: Subjects can breathe underwater.
Control Water: Raises or lowers bodies of water.
Ice Storm: Hail deals 5d6 damage in cylinder 40 ft. across.
Cone of Cold: 1d6/level cold damage.
Acid Fog: Fog deals acid damage.
Horrid Wilting: Deals 1d6/level damage within 30 ft.
Elemental Swarm*: Summons multiple elementals.
*Cast as a water spell only.
=end