SpellModel.all_spells["Bard"]= Hash.new([])
SpellModel.all_spells["Bard"][0] = SpellModel.spell_level([
["Dancing Lights", "Evocation [Light]", "PH p272", "Creates torches or other lights."],
["Daze", "Enchantment (Compulsion) [Mind-Affecting]", "PH p217", "Humanoid creature of 4 HD or less loses next action."],
["Detect Magic", "Divination", "PH p219", "Detects spells and magic items within 60 ft."],
["Flare", "Evocation [Light]", "PH p232", "Dazzles one creature (-1 on attack rolls)."],
["Ghost Sound", "Illusion (Figment)", "PH p235", "Figment sounds."],
["Know Direction", "Divination", "PH p246", "You discern north."],
["Light", "Evocation [Light]", "PH p248", "Object shines like a torch."],
["Lullaby", "Enchantment (Compulsion) [Mind-Affecting]", "PH p249", "Makes subject drowsy; -5 on Spot and Listen checks, -2 on Will saves against sleep."],
["Mage Hand", "Transmutation", "PH p249", "5-pound telekinesis."],
["Mending", "Transmutation", "PH p253", "Makes minor repairs on an object."],
["Message", "Transmutation [Language-Dependent]", "PH p253", "Whispered conversation at distance."],
["Open/Close", "Transmutation", "PH p258", "Opens or closes small or light things."],
["Prestidigitation", "Universal", "PH p264", "Performs minor tricks."],
["Read Magic", "Divination", "PH p269", "Read scrolls and spellbooks."],
["Resistance", "Abjuration", "PH p264", "Subject gains +1 on saving throws."],
["Summon Instrument", "Conjuration (Summoning)", "PH p285", "Summons one instrument of the caster's choice."]])
SpellModel.all_spells["Bard"][1] +=SpellModel.spell_level([["Alarm", "Abjuration", "PH p197", "Wards an area for 2 hours/level."],
["Animate Rope", "Transmutation", "PH p199", "Makes a rope move at your command."],
["Cause Fear", "Necromancy [Fear, Mind-Affecting],", "PH p208", "One creature of 5 HD or less flees for 1d4 rounds."],
["Charm Person", "Enchantment (Charm) [Mind-Affecting],", "PH p209", "Makes one person your friend."],
["Comprehend Languages", "Divination", "PH p212", "You understand all spoken and written languages."],
["Confusion, Lesser", "Enchantment (Compulsion) [Mind-Affecting],", "PH p212", "One creature is confused for 1 round."],
["Cure Light Wounds", "Conjuration (Healing)", "PH p215", "Cures 1d8 damage +1/ level (max +5)."],
["Detect Secret Doors", "Divination", "PH p220", "Reveals hidden doors within 60 ft."],
["Disguise Self", "Illusion (Glamer)", "PH p222", "Changes your appearance."],
["Erase", "Transmutation", "PH p227", "Mundane or magical writing vanishes."],
["Expeditious Retreat", "Transmutation", "PH p228", "Your speed increases by 30 ft."],
["Feather Fall", "Transmutation", "PH p229", "Objects or creatures fall slowly."],
["Grease", "Conjuration (Creation)", "PH p237", "Makes 10-ft. square or one object slippery."],
["Hideous Laughter", "Enchantment (Compulsion) [Mind-Affecting]", "PH p292", "Subject loses actions for 1 round/ level."],
["Hypnotism", "Enchantment (Compulsion) [Mind-Affecting],", "PH p242", "Fascinates 2d4 HD of creatures."],
["Identify", "Divination", "PH p243", "Determines properties of magic item."],
["Magic Mouth", "Illusion (Glamer)", "PH p251", "Speaks once when triggered."],
["Magic Aura", "Illusion (Glamer)", "PH p257", "Alters object's magic aura."],
["Obscure Object", "Abjuration", "PH p258", "Masks object against scrying."],
["Remove Fear", "Abjuration", "PH p271", "Suppresses fear or gives +4 on saves against fear for one subject + one per four levels."],
["Silent Image", "Illusion (Figment)", "PH p279", "Creates minor illusion of your design."],
["Sleep", "Enchantment (Compulsion) [Mind-Affecting],", "PH p280", "Puts 4 HD of creatures into magical slumber."],
["Summon Monster I", "Conjuration (Summoning)", "PH p285", "Calls extraplanar creature to fight for you."],
["Undetectable Alignment", "Abjuration", "PH p297", "Conceals alignment for 24 hours."],
["Unseen Servant", "Conjuration (Creation)", "PH p297", "Invisible force obeys your commands."],
["Ventriloquism", "Illusion (Figment)", "PH p298", "Throws voice for 1 min./ level."]])

# ["Alter Self", "Assume form of a similar creature."]
# ["Animal Messenger", "Sends a Tiny animal to a specific place."]
# ["Animal Trance", "Fascinates 2d6 HD of animals."]
# ["Blindness/ Deafness", "Makes subject blind or deaf."]
# ["Blur", "Attacks miss subject 20% of the time."]
# ["Calm Emotions", "Calms creatures, negating emotion effects."]
# ["Cat’s Grace", "Subject gains +4 to Dex for 1 min./ level."]
# ["Cure Moderate Wounds", "Cures 2d8 damage +1/ level (max +10)."]
# ["Darkness", "20-ft. radius of supernatural shadow."]
# ["Daze Monster", "Living creature of 6 HD or less loses next action."]
# ["Delay Poison", "Stops poison from harming subject for 1 hour/  level."]
# ["Detect Thoughts", "Allows “listening” to surface thoughts."]
# ["Eagle’s Splendor", "Subject gains +4 to Cha for 1 min./ level."]
# ["Enthrall", "Captivates all within 100 ft. + 10 ft./ level."]
# ["Fox’s Cunning", "Subject gains +4 to Int for 1 min./ level."]
# ["Glitterdust", "Blinds creatures, outlines invisible creatures."]
# ["Heroism", "Gives +2 on attack rolls, saves, skill checks."]
# ["Hold Person", "Paralyzes one humanoid for 1 round/ level."]
# ["Hypnotic Pattern", "Fascinates (2d4 + level) HD of creatures."]
# ["Invisibility", "Subject is invisible for 1 min./ level or until it attacks."]
# ["Locate Object", "Senses direction toward object (specific or type)."]
# ["Minor Image", "As silent image, plus some sound."]
# ["Mirror Image", "Creates decoy duplicates of you (1d4 +1 per three levels, max 8)."]
# ["Misdirection", "Misleads divinations for one creature or object."]
# ["Pyrotechnics", "Turns fire into blinding light or choking smoke."]
# ["Rage", "Gives +2 to Str and Con, +1 on Will saves, -2 to AC."]
# ["Scare", "Panics creatures of less than 6 HD."]
# ["Shatter", "Sonic vibration damages objects or crystalline creatures."]
# ["Silence", "Negates sound in 20-ft. radius."]
# ["Sound Burst", "Deals 1d8 sonic damage to subjects; may stun them."]
# ["Suggestion", "Compels subject to follow stated course of action."]
# ["Summon Monster II", "Calls extraplanar creature to fight for you."]
# ["Summon Swarm", "Summons swarm of bats, rats, or spiders."]
# ["Tongues", "Speak any language."]
# ["Whispering Wind", "Sends a short message 1 mile/ level."]