module Eschaton

	module GameMaster

		def self.accuracy
			rand(1..20)
		end

		def self.spasex(combatant, opponent)
			lobaccuracy = accuracy

			target = StrategicTargets.random

			case accuracy
				when 18..20
					combatant.lob(opponent)
					combatant.accuracy += 1
					combatant.inddir += 20
					puts "#{combatant.nation}'s warhead directly (+20 INDDIR) hits a #{target.name}(+#{target.ptvalue} INDDIR)! Ho-ly CROW!"
					combatant.hit_target(target)
					combatant.inddir += target.ptvalue
					puts combatant
				when 4..17
					combatant.lob(opponent)
					puts "#{combatant.nation}'s warhead hit a #{target.name}(+#{target.ptvalue} INDDIR)!"
					combatant.hit_target(target)
					combatant.inddir += target.ptvalue
					puts combatant
				else
					puts "#{combatant.nation} whiffed it!"
					combatant.megatonnage -= 5
					puts combatant
			end
		end


		# def milabbrevs
		# 	puts "MILABBREVS(Military Abbreviations)......."
		# 	puts "CONFORCON: Conventional Force Concentrations"
		# 	puts "INDDIR: Infliction of Death, Destruction and Incapacitation of Response"
		# 	puts "MAMA: Major Metropolitan Areas"
		# 	puts "MIRV: Multiple Independent Reentry Vehicles"
		# 	puts "SACPOP: Strikes Against Civilian Populations"
		# 	puts "SPASEX: Spasm Exchanges"
		# 	puts "SSTRAC: Sites of Strategic Command"
		# 	puts "SUFDDIR: Suffering of Death, Destruction and Incapacitation of Response"
		# end



	end
end