SpellList.granted_powers_list["Air Domain"] = "Turn or destroy earth creatures as a good cleric turns undead." +
 "Rebuke, command, or bolster air creatures as an evil cleric rebukes undead." + 
 "Use these abilities a total number of times per day equal to 3 + your Charisma modifier."
SpellList.granted_powers_procs["Air Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Air Domain", "Cleric", [
["Obscuring Mist", "", "PH p258", "Fog surrounds you."],
["Wind Wall", "", "PH p302", "Deflects arrows, smaller creatures, and gases."],
["Gaseous Form", "", "PH p234", "Subject becomes insubstantial and can fly slowly."],
["Air Walk", "", "PH p196", "Subject treads on air as if solid (climb at 44-degree angle)."],
["Control Winds", "", "PH p214", "Change wind direction and speed."],
["Chain Lightning", "", "PH p208", "1d6/level damage; 1 secondary bolt/level each deals half damage."],
["Control Weather", "", "PH p214", "Changes weather in local area."],
["Whirlwind", "", "PH p301", "Cyclone deals damage and can pick up creatures."],
["Elemental Swarm", "", "PH p226", "Summons multiple elementals."]])


SpellList.granted_powers_list["Animal Domain"] = "You can use speak with animals once per day as a spell-like ability."
SpellList.granted_powers_procs["Animal Domain"] = %{Proc.new do|character, thisclass|
#Add Knowledge (nature) to your list of cleric class skills.
  thisclass.class_skills |= ["Knowledge(Nature)"]
end}
SpellList.load_spells("Animal Domain", "Cleric", [
["Calm Animals", "", "PH p207", "Calms (2d4 + level) HD of animals."],
["Hold Animal", "", "PH p241", "Paralyzes one animal for 1 round/level."],
["Dominate Animal", "", "PH p224", "Subject animal obeys silent mental commands."],
["Summon Nature's Ally IV", "", "PH p288", "Calls creature to fight."],
["Commune with Nature", "", "PH p211", "Learn about terrain for 1 mile/level."],
["Antilife Shell", "", "PH p199", "10-ft. field hedges out living creatures."],
["Animal Shapes", "", "PH p199", "One ally/level polymorphs into chosen animal."],
["Summon Nature's Ally VIII", "", "PH p289", "Calls creature to fight."],
["Shapechange", "", "PH p277", "Transforms you into any creature, and change forms once per round."]])


SpellList.granted_powers_list["Chaos Domain"] = "You cast chaos spells at +1 caster level."
SpellList.granted_powers_procs["Chaos Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Chaos Domain", "Cleric", [
["Protection from Law", "", "PH p266", "+2 to AC and saves, counter mind control, hedge out elementals and outsiders."],
["Shatter", "", "PH p278", "Sonic vibration damages objects or crystalline creatures."],
["Magic Circle against Law", "", "PH p250", "As protection spells, but 10-ft. radius and 10 min./level."],
["Chaos Hammer", "", "PH p208", "Damages and staggers lawful creatures."],
["Dispel Law", "", "PH p222", "+4 bonus against attacks by lawful creatures."],
["Animate Objects", "", "PH p199", "Objects attack your foes."],
["Word of Chaos", "", "PH p230", "Kills, confuses, stuns, or deafens nonchaotic subjects."],
["Cloak of Chaos", "", "PH p210", "+4 to AC, +4 resistance, SR 25 against lawful spells."],
["Summon Monster IX", "", "PH p288", "Calls extraplanar creature to fight for you."]])


SpellList.granted_powers_list["Death Domain"] = "You may use a death touch once per day. Your death touch is a supernatural ability that produces a death effect. You must succeed on a melee touch attack against a living creature (using the rules for touch spells). When you touch, roll 1d6 per cleric level you possess. If the total at least equals the creature's current hit points, it dies (no save)."
SpellList.granted_powers_procs["Death Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Death Domain", "Cleric", [
["Cause Fear", "", "PH p208", "One creature of 5HD or less flees for 1d4 rounds."],
["Death Knell", "", "PH p217", "Kills dying creature; you gain 1d8 temporary hp, +2 Strength, & 1 lvl"],
["Animate Dead", "", "PH p198", "Creates undead skeletons and zombies."],
["Death Ward", "", "PH p217", "Grants immunity to death spells and negative energy effects."],
["Slay Living", "", "PH p280", "Touch attack kills target."],
["Create Undead", "", "PH p215", "Create ghouls, ghasts, mummies, or mohrgs."],
["Destruction", "", "PH p218", "Kills subject and destroys remains."],
["Create Greater Undead", "", "PH p215", "Creates shadows, wraiths, spectres, or devourers."],
["Wail of the Banshee", "", "PH p298", "Kills one creature per level."]])


SpellList.granted_powers_list["Destruction Domain"] = "You gain the smite power, the supernatural ability to make a single melee attack with a +4 bonus on attack rolls and a bonus on damage rolls equal to your cleric level (if you hit). You must declare the smite before making the attack. This ability is usable once per day."
SpellList.granted_powers_procs["Destruction Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Destruction Domain", "Cleric", [
["Inflict Light Wounds", "", " p244", "Touch deals 1d8 damage +1 per level (max +5)."],
["Shatter", "", " p278", "Sonic vibration damages objects or crystalline creatures."],
["Contagion", "", " p213", "Infects subject with chosen disease."],
["Inflict Critical Wounds", "", " p244", "Touch attack, 4d8 + 1 per level (max +20)."],
["Inflict Light Wounds, Mass", "", " p244", "Deals 1d8 + 1 / level to many creatures."],
["Harm", "", " p239", "Deals 10 hp per level to target"],
["Disintegrate", "", " p222", "Makes one creature or object vanish."],
["Earthquake", "", " p225", "Intense tremor shakes 5' per level radius."],
["Implosion", "", " p243", "Kills one creature per round"]])


SpellList.granted_powers_list["Earth Domain"] = "Turn or destroy air creatures as a good cleric turns undead. Rebuke, command, or bolster earth creatures as an evil cleric rebukes undead. Use these abilities a total number of times per day equal to 3 + your Charisma modifier. This granted power is a supernatural ability."
SpellList.granted_powers_procs["Earth Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Earth Domain", "Cleric", [
["Magic Stone", "", "PH p251", "Three stones become +1 projectiles, 1d6+1 damage."],
["Soften Earth and Stone", "", "PH p280", "Turns stone to clay or dirt to sand or mud."],
["Stone Shape", "", "PH p284", "Sculpts stone into any shape."],
["Spike Stones", "", "PH p283", "Creatures in area take 1d8 damage, may be slowed."],
["Wall of Stone", "", "PH p299", "Creates a stone wall that can be shaped."],
["Stoneskin", "", "PH p284", "Ignore 10 points of damage per attack."],
["Earthquake", "", "PH p225", "Intense tremor shakes 5' per level radius."],
["Iron Body", "", "PH p245", "You body becomes living iron."],
["Elemental Swarm (earth)", "", "PH p226", "Summons 2d4 Large, 1d4 Huge Earth Elementals."]])


SpellList.granted_powers_list["Evil Domain"] = "You cast evil spells at +1 caster level."
SpellList.granted_powers_procs["Evil Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Evil Domain", "Cleric", [
["Protection from Good", "", "PH p266", "+2 bonus to AC & saves against good, counters mind control, & hedges out elementals & outsiders."],
["Desecrate", "", "PH p218", "Fills area with negative energy, making undead stronger."],
["Magic Circle against Good", "", "PH p250", "As Protection from Good, but 10' radius and 10 minutes per level."],
["Unholy Blight", "", "PH p297", "Damages and sickens good creatures."],
["Dispel Good", "", "PH p222", "+4 bonus against attacks by good creatures."],
["Create Undead", "", "PH p215", "Create ghouls, ghasts, mummies, or mohrgs."],
["Blasphemy", "", "PH p205", "Kills, paralyzes, weakens, or dazes non-evil subjects."],
["Unholy Aura", "", "PH p297", "+4 to AC, +4 resistance, SR25 against good spells."],
["Summon Monster IX (evil)", "", "PH p288", "Calls an Evil extraplanar creature to fight for you."]])



SpellList.granted_powers_list["Fire Domain"] = "Turn or destroy water creatures as a good cleric turns undead. Rebuke, command, or bolster fire creatures as an evil cleric rebukes undead. Use these abilities a total number of times per day equal to 3 + your Charisma modifier. This granted power is a supernatural ability."
SpellList.granted_powers_procs["Fire Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Fire Domain", "Cleric", [
["Burning Hands", "", "PH p207", "1d4 fire damage per level (max 5d4)."],
["Produce Flame", "", "PH p265", "1d6 damage + 1 per level, touch or thrown."],
["Resist Energy (fire or cold only)", "", "PH p246", "Ignores the first 10 (or more) points of damage per attack from a specified energy type."],
["Wall of Fire", "", "PH p298", "Deals 2d4 fire damage out to 10' and 1d4 out to 20'. Passing through wall deals 2d6 + 1 per level."],
["Fire Shield", "", "PH p230", "Creatures attacking you take 1d6 + 1 per level damage (fire damage for a Warm Shield, cold damage for a Chill Shield); you are protected from cold (in the case of a Warm Shield) or heat (for a Chill Shield)"],
["Fire Seeds", "", "PH p230", "Acorns and berries become grenades and bombs."],
["Fire Storm", "", "PH p231", "Deals 1d6/lvl fire damage."],
["Incendiary Cloud", "", "PH p244", "Cloud deals 4d6 fire damage per round."],
["Elemental Swarm (fire)", "", "PH p226", "Summons 2d4 Large, 1d4 Huge Fire Elementals."]])



SpellList.granted_powers_list["Good Domain"] = "You cast good spells at +1 caster level."
SpellList.granted_powers_procs["Good Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Good Domain", "Cleric", [
["Protection from Evil", "", "PH p266", "+2 bonus to AC & saves against evil, counters mind control, & hedges out elementals & outsiders."],
["Aid", "", "PH p196", "+1 on attack rolls, +1 on saves against fear, 1d8 temporary hp +1/lvl (max +10)"],
["Magic Circle against Evil", "", "PH p249", "As Protection from Evil, but 10' radius and 10 minutes per level."],
["Holy Smite", "", "PH p241", "Damages and blinds evil creatures."],
["Dispel Evil", "", "PH p222", "+4 bonus against attacks by evil creatures."],
["Blade Barrier", "", "PH p205", "Wall of blades deals 1d6 per level damage."],
["Holy Word", "", "PH p242", "Kills, paralyzes, blinds, or deafens non-good subjects."],
["Holy Aura", "", "PH p241", "+4 to AC, +4 resistance, SR25 against evil spells."],
["Summon Monster IX (good)", "", "PH p299", "Calls a Good extraplanar creature to fight for you."]])



SpellList.granted_powers_list["Healing Domain"] = "You cast healing spells at +1 caster level."
SpellList.granted_powers_procs["Healing Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Healing Domain", "Cleric", [
["Cure Light Wounds", "", "PH p215", "Cures 1d8 + 1 per level damage (max +5)."],
["Cure Moderate Wounds", "", "PH p216", "Cures 2d8 damage +1 per level (max +10)."],
["Cure Serious Wounds", "", "PH p216", "Cures 3d8 damage + 1 per level (max +15)."],
["Cure Critical Wounds", "", "PH p215", "Cures 4d8 + 1 per level (max. +20)."],
["Cure Light Wounds, Mass", "", "PH p216", "Cures 1d8 damage +1 per level for many creatures."],
["Heal", "", "PH p239", "Cures 10 points per level, all diseases and mental conditions."],
["Regenerate", "", "PH p270", "Subject's severed limbs grow back, cures 4d8 damage +1 per level (max +35)."],
["Cure Critical Wounds, Mass", "", "PH p215", "Cures 4d8 damage +1 per level (max +40) for many creatures."],
["Heal, Mass", "", "PH p215", "As Heal, but with several subjects."]])

SpellList.granted_powers_list["Knowledge Domain"] = "You cast divination spells at +1 caster level."
SpellList.granted_powers_procs["Knowledge Domain"] = %{Proc.new do|character, thisclass|
#Add all Knowledge skills to your list of cleric class skills.
  knowledge = ["Military","Arcana","Architecture and Engineering","Dungeoneering","Geography",
		"History","Local","Nature","Nobility and Royalty","Psionics","Religion","The Planes"]
	knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
  thisclass.class_skills |= knowledge
end}
SpellList.load_spells("Knowledge Domain", "Cleric", [
["Detect Secret Doors", "", "PH p220", "Reveals hidden doors within 60'."],
["Detect Thoughts", "", "PH p220", "Allows 'listening' to surface thoughts."],
["Clairaudience/Clairvoyance", "", "PH p209", "Hear or see at a distance for 1 minute per level."],
["Divination", "", "PH p224", "Provides useful advice for specific proposed actions."],
["True Seeing", "", "PH p296", "See all things as they really are."],
["Find the Path", "", "PH p230", "Shows most direct way to a location."],
["Legend Lore", "", "PH p246", "Lets you learn tales about a person, place, or thing."],
["Discern Location", "", "PH p222", "Reveals the exact location of a creature or object."],
["Foresight", "", "PH p207", "'Sixth sense' warns of impending danger."]])

SpellList.granted_powers_list["Law Domain"] = "You cast law spells at +1 caster level."
SpellList.granted_powers_procs["Law Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Law Domain", "Cleric", [
["Protection from Chaos", "", "PH p266", "+2 bonus to AC & saves against chaos, counters mind control, & hedges out elementals & outsiders."],
["Calm Emotions", "", "PH p207", "Calms creatures, negating emotion effects."],
["Magic Circle against Chaos", "", "PH p249", "As Protection from Chaos, but 10' radius and 10 minutes per level."],
["Order's Wrath", "", "PH p258", "Damages and dazes chaotic creatures."],
["Dispel Chaos", "", "PH p222", "+4 bonus against attacks by chaotic creatures."],
["Hold Monster", "", "PH p241", "As Hold Person, but can effect any creature."],
["Dictum", "", "PH p220", "Kills, paralyzes, slows, or deafens non-lawful subjects."],
["Shield of Law", "", "PH p278", "+4 to AC, +4 resistance, SR25 against chaotic spells."],
["Summon Monster IX (law) ", "", "PH p288", "Calls a Lawful extraplanar creature to fight for you."]])

SpellList.granted_powers_list["Luck Domain"] = "You gain the power of good fortune, which is usable once per day. This extraordinary ability allows you to reroll one roll that you have just made before the game master declares whether the roll results in success or failure. You must take the result of the reroll, even if it's worse than the original roll."
SpellList.granted_powers_procs["Luck Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Luck Domain", "Cleric", [
["Entropic Shield", "", "PH p227", "Ranged attacks against you suffer 20% miss chance."],
["Aid", "", "PH p196", "+1 on attack rolls, +1 on saves against fear, 1d8 temporary hp +1/lvl (max +10)"],
["Protection from Energy", "", "PH p266", "Absorb 12damage per level from one kind of energy."],
["Freedom of Movement", "", "PH p233", "Subject moves normally despite impediments."],
["Break Enchantment", "", "PH p207", "Frees subject from enchantments, alterations, curses, and petrifaction."],
["Mislead", "", "PH p255", "Turns you invisible and creates illusory double."],
["Spell Turning", "", "PH p282", "", "Reflects 1d4+6 spell levels back at caster."],
["Moment of Prescience", "", "PH p255", "You gain insight bonus on a single attack roll, check , or save."],
["Miracle", "", "PH p254", "Requests a deity's intercession."]])

SpellList.granted_powers_list["Magic Domain"] = "Use scrolls, wands, and other devices with spell completion or spell trigger activation as a wizard of one-half your cleric level (at least 1st level). For the purpose of using a scroll or other magic device, if you are also a wizard, actual wizard levels and these effective wizard levels stack."
SpellList.granted_powers_procs["Magic Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Magic Domain", "Cleric", [
["Magic Aura", "", "PH p257", "Alters object's magic aura."],
["Identify", "", "PH p243", "Determines properties of a magic item."],
["Dispel Magic", "", "PH p223", "", "Cancels magical spells and effects."],
["Imbue with Spell Ability", "", "PH p243", "Transfer spells to subject."],
["Spell Resistance", "", "PH p282", "Subject gains Spell Resistance of 12 + 1 per level."],
["Antimagic Field", "", "PH p200", "Negates magic within 10'."],
["Spell Turning", "", "PH p282", "", "Reflects 1d4+6 spell levels back at caster."],
["Protection from Spells", "", "PH p266", "Confers +8 resistance bonus."],
["Mage's Disjunction", "", "PH p255", "Dispels magic, disenchants magic items."]])


SpellList.granted_powers_list["Plant Domain"] = "Rebuke or command plant creatures as an evil cleric rebukes or commands undead. Use this ability a total number of times per day equal to 3 + your Charisma modifier. This granted power is a supernatural ability."
SpellList.granted_powers_procs["Plant Domain"]= %{Proc.new do|character, thisclass|
#Add Knowledge (nature) to your list of cleric class skills.
  thisclass.class_skills |= ["Knowledge(Nature)"]
end}
SpellList.load_spells("Plant Domain", "Cleric", [
["Entangle", "", "PH p227", "Plants entangle everyone in a 40' radius."],
["Barkskin", "", "PH p202", "Grants +2 (or higher) enhancement to natural armor."],
["Plant Growth", "", "PH p236", "Grows vegetation, improves crops."],
["Command Plants", "", "PH p211", "Sway the actions of one or more plant creatures."],
["Wall of Thorns", "", "PH p300", "Thorns damage anyone who tries to pass."],
["Repel Wood", "", "PH p271", "Pushes away wooden objects."],
["Animate Plants", "", "PH p199", "One or more trees animate and fight for you."],
["Control Plants", "", "PH p213", "Control actions of one or more plant creatures."],
["Shambler", "", "PH p277", "Summons 1d4+2 shambling mounds to fight for you."]])

SpellList.granted_powers_list["Protection Domain"] = "You can generate a protective ward as a supernatural ability. Grant someone you touch a resistance bonus equal to your cleric level on his or her next saving throw. Activating this power is a standard action. The protective ward is an abjuration effect with a duration of 1 hour that is usable once per day."
SpellList.granted_powers_procs["Protection Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Protection Domain", "Cleric", [
["Sanctuary", "", "PH p274", "Opponents can't attack you and you can't attack."],
["Shield Other", "", "PH p278", "You take half of subject's damage."],
["Protection from Energy", "", "PH p266", "Absorb 12 damage per level from one kind of energy."],
["Spell Immunity", "", "PH p281", "Subject is immune to one spell per four levels."],
["Spell Resistance", "", "PH p282", "Subject gains Spell Resistance of 12 + 1 per level."],
["Antimagic Field", "", "PH p200", "Negates magic within 10'"],
["Repulsion", "", "PH p271", "Creatures can't approach you."],
["Mind Blank", "", "PH p253", "Subject is immune to mental/emotional magic and scrying."],
["Prismatic Sphere", "", "PH p264", "As Prismatic Wall, but surrounds on all sides."]])

SpellList.granted_powers_list["Strength Domain"] = "You can perform a feat of strength as a supernatural ability. You gain an enhancement bonus to Strength equal to your cleric level. Activating the power is a free action, the power lasts 1 round, and it is usable once per day."
SpellList.granted_powers_procs["Strength Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Strength Domain", "Cleric", [
["Enlarge Person", "", "PH p226", "Humanoid creature doubles in size."],
["Bull's Strength", "", "PH p207", "Subject gains +4 Strength for 1 minute per level."],
["Magic Vestment", "", "PH p251", "Armor, shield, or clothes gain +1 enhancement per four levels."],
["Spell Immunity", "", "PH p281", "Subject is immune to one spell per four levels."],
["Righteous Might", "", "PH p273", "", "Your size increases and you gain combat bonuses."],
["Stoneskin", "", "PH p284", "Ignore 10 points of damage per attack."],
["Mage's Grasping Hand", "", "PH p204", "Hand provides cover, pushes, or grapples."],
["Mage's Clenched Fist", "", "PH p203", "Large hand provides cover, pushes, o attacks your foes."],
["Mage's Crushing Hand", "", "PH p203", "Large hand provides cover, pushes, or crushes your foes."]])

SpellList.granted_powers_list["Sun Domain"] = "Once per day, you can perform a greater turning against undead in place of a regular turning. The greater turning is like a normal turning except that the undead creatures that would be turned are destroyed instead."
SpellList.granted_powers_procs["Sun Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Sun Domain", "Cleric", [
["Endure Elements", "", "PH p226", "Exist comfortably in hot or cold environments."],
["Heat Metal", "", "PH p239", "Makes metal so hot it damages those who touch it."],
["Searing Light", "", "PH p275", "Ray deals 1d8 per two levels, more against undead."],
["Fire Shield", "", "PH p230", "Creatures attacking you take 1d6 + 1 per level damage (fire damage for a Warm Shield, cold damage for a Chill Shield); you are protected from cold (in the case of a Warm Shield) or heat (in the case of a Chill Shield)."],
["Flame Strike", "", "PH p231", "Smites foes with divine fire (1d6 / level)."],
["Fire Seeds", "", "PH p230", "Acorns and berries become grenades and bombs."],
["Sunbeam", "", "PH p289", "Beam blinds and deals 4d6 damage."],
["Sunburst", "", "PH p289", "Blinds all within 10', deals 6d6 damage."],
["Prismatic Sphere", "", "PH p264", "As Prismatic Wall, but surrounds on all sides."]])

SpellList.granted_powers_list["Travel Domain"] = "For a total time per day of 1 round per cleric level you possess, you can act normally regardless of magical effects that impede movement as if you were affected by the spell freedom of movement. This effect occurs automatically as soon as it applies, lasts until it runs out or is no longer needed, and can operate multiple times per day (up to the total daily limit of rounds). This granted power is a supernatural ability."
SpellList.granted_powers_procs["Travel Domain"]= %{Proc.new do|character, thisclass|
#Add Survival to your list of cleric class skills.
  thisclass.class_skills |= ["Survival"]
end}
SpellList.load_spells("Travel Domain", "Cleric", [
["Longstrider", "", "PH p249", "Increases your speed."],
["Locate Object", "", "PH p249", "Senses direction toward object (specific or type)."],
["Fly", "", "PH p232", "Subject flies at a speed of 60'."],
["Dimension Door", "", "PH p221", "Teleports you a short distance."],
["Teleport", "", "PH p292", "Instantly transports you as far as 100 miles per level."],
["Find the Path", "", "PH p230", "Shows most direct way to a location."],
["Teleport, Greater", "", "PH p292", "As Teleport, but no range limit and off-target arrival."],
["Phase Door", "", "PH p261", "Invisible passage through wood or stone."],
["Astral Projection", "", "PH p201", "Projects you and companions into the Astral Plane."]])

SpellList.granted_powers_list["Trickery Domain"] = ""
SpellList.granted_powers_procs["Trickery Domain"]= %{Proc.new do|character, thisclass|
#Add Bluff, Disguise, and Hide to your list of cleric class skills.
  thisclass.class_skills |= ["Bluff", "Disguise", "Hide"]
end}
SpellList.load_spells("Trickery Domain", "Cleric", [
["Disguise Self", "", "PH p222", "Changes your appearance."],
["Invisibility", "", "PH p245", "Subject is invisible for 1 minute per level or until it attacks."],
["Nondetection", "", "PH p257", "Hides subject from divination and scrying."],
["Confusion", "", "PH p212", "Makes subject behave oddly for 1 round per level."],
["False Vision", "", "PH p229", "Fools scrying with an illusion."],
["Mislead", "", "PH p255", "Turns you invisible and creates illusory double."],
["Screen", "", "PH p274", "Illusion hides area from vision, scrying."],
["Polymorph Any Object", "", "PH p263", "", "Changes any subject into anything else."],
["Time Stop", "", "PH p294", "You act freely for 1d4+1 rounds."]])

SpellList.granted_powers_list["War Domain"] = "Free Martial Weapon Proficiency with deity's favored weapon (if necessary) and Weapon Focus with the deity's favored weapon."
SpellList.granted_powers_procs["War Domain"]= %{Proc.new do|character, thisclass|
#Free Martial Weapon Proficiency with deity's favored weapon (if necessary) and Weapon Focus with the deity's favored weapon.
  if thisclass.class_level <= 1
    character.weapon_proficiencies |= [thisclass.deity_weapon]
    WeaponFocus.add(character)
    character.feats.last.title = "Weapon Focus(" + thisclass.deity_weapon + ")"
  end
end}
SpellList.load_spells("War Domain", "Cleric", [
["Magic Weapon", "", "PH p251", "Weapon gains +1 enhancement bonus."],
["Spiritual Weapon", "", "PH p283", "Magical weapon attacks on its own."],
["Magic Vestment", "", "PH p251", "Armor, shield, or clothes gain +1 enhancement per four levels."],
["Divine Power", "", "PH p224", "You gain attack bonus, +6 to Str, and 1 hp per level."],
["Flame Strike", "", "PH p231", "Smites foes with divine fire (1d6 / level)."],
["Blade Barrier", "", "PH p205", "Wall of blades deals 1d6 per level damage."],
["Power Word Blind", "", "PH p263", "Blinds creatures with 200 hp or less."],
["Power Word Stun", "", "PH p263", "Stuns creatures with 150 hp or less."],
["Power Word Kill", "", "PH p263", "Kills one creature with 100 hp or less."]])

SpellList.granted_powers_list["Water Domain"] = "Turn or destroy fire creatures as a good cleric turns undead. Rebuke, command, or bolster water creatures as an evil cleric rebukes undead. Use these abilities a total number of times per day equal to 3 + your Charisma modifier. This granted power is a supernatural ability."
SpellList.granted_powers_procs["Water Domain"] = %{Proc.new{|character, thisclass|}}
SpellList.load_spells("Water Domain", "Cleric", [
["Obscuring Mist", "", "PH p258", "Fog surrounds you."],
["Fog Cloud", "", "PH p232", "Fog obscures vision."],
["Water Breathing", "", "PH p300", "Subject can breathe underwater."],
["Control Water", "", "PH p214", "Raises, lowers bodies of water."],
["Ice Storm", "", "PH p243", "Hail deals 5d6 damage in cylinder 40' across."],
["Cone of Cold", "", "PH p212", "1d6 cold damage per level (max 15d6)."],
["Acid Fog", "", "PH p196", "Fog deals acid damage."],
["Horrid Wilting", "", "PH p242", "Deals 1d6 damage per level within 30'."],
["Elemental Swarm (water)", "", "PH p226", "Summons 2d4 Large, 1d4 Huge Water Elementals."]])
