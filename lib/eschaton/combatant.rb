require_relative 'strategic_targets'

module Eschaton

	class Combatant
		attr_accessor :nation, :megatonnage, :inddir, :sufddir, :accuracy, :defcon, :rad_level, :em_immunity, :population, :score, :is_player

		# megatonnage =
		# integrally regressed ratio of:
		# yearly military budget as percentage of yearly GNP
		# inverse of stratego-tactical expenditures as percentage of yearly military budget
		# GNP/Military // Military/Nuke ratio


		def initialize(nation, megatonnage: 400, defcon: 5, sufddir: 0.0, inddir: 0.0,
							   sacpop: 0, rad_level: 0, em_immunity: true,
							   population: 300_000_000, accuracy: 0, score: 0, is_player: false)

			@nation = nation.to_s.upcase
			@sufddir = sufddir #suffering of death, destruction, and incapacitation of response
			@inddir = inddir #infliction of death, destruction, and incapacitation of response
			@defcon = defcon
			@sacpop = sacpop # strikes against civilian populations
			@megatonnage = megatonnage # distrubtion of megatonnage determined by mean-value theorem of integrals
			@rad_level = rad_level
			@em_immunity = em_immunity
			@population = population
			@accuracy = accuracy
			@score = score
			@targets_hit = Hash.new(0)
			@is_player = is_player
		end

		def to_s
			"#{@nation.ljust(20, '.')} SUFDDIR: #{@sufddir} / INDDIR: #{@inddir} / MEGATONNAGE: #{@megatonnage}\nDEFCON: #{@defcon} / RADIATION: #{@rad_level} / EM-PULSE IMMUNITY: #{@em_immunity} / SURVIVING POPULATION: #{@population}\n "
		end

		def <=>(other)
			other.score <=> score
		end


		# statistics


		def scoretotal
			if @sufddir > 0
				@score = @inddir/@sufddir
				@score.round(2)
			else
				@score = @inddir
			end
		end

		def hit_target(target)
			@targets_hit[target.name.to_sym] += target.ptvalue
		end

		def target_stats
			total_target_points = @targets_hit.values.reduce(0) {|sum, val| sum + val }
			puts "Total INDDIR from ALL targets: ".upcase + total_target_points.to_s
			sleep(1)
		end

		def each_hit_target
			@targets_hit.each do |name, value|
				yield Target.new(name, value)
			end
		end




		# attacks


		def lob(opponent)
			if @megatonnage > 0
				@inddir += 30
				@megatonnage -= 5

				opponent.sufddir += 30
				if opponent.defcon > 1
					opponent.defcon -= 1
				end
				opponent.rad_level += 20
				opponent.population -= rand(100_000..200_000)

				@score = self.scoretotal
				puts "#{@nation} lobs a warhead at #{opponent.nation} (+30 INDDIR)!"
			else
				puts "#{@nation}'s megaton supply has been depleted."
			end
		end

		def sacpop(opponent)
			if @megatonnage > 0
				@inddir += 100
				@sacpop += 1
				@megatonnage -= 5

				opponent.sufddir += 100
				if opponent.defcon > 2
					opponent.defcon -= 2
				else
					opponent.defcon = 1
				end
				opponent.rad_level += 20
				opponent.population -= rand(100_000..200_000)

				@score = self.scoretotal
				puts "#{@nation} strikes one of #{opponent.nation}'s civilian populations..."
				puts self
				puts ' '
			else
				puts "#{@nation}'s megaton supply has been depleted.\ "
				puts self
				puts ' '
			end
		end

		def mirv(opponent)
			if @megatonnage > 350
				puts "Dear God. #{@nation} launches a neatly tied MIRV jockstrap at #{opponent.nation}..."
				@inddir += 100
				@megatonnage -= 350

				opponent.sufddir += 300
				opponent.defcon = 1
				opponent.rad_level += 100
				opponent.population -= rand(100_000_000..200_000_000)
				8.times do
					GameMaster.spasex(self, opponent)
					sleep(1)
				end

				@score = self.scoretotal
				puts self
				puts ' '
			else
				puts "#{@nation}'s megaton supply is insufficient for this attack.\n "
				puts self
				puts ' '
			end
		end






		# def empulse(opponent)
		# 	puts "#{@nation} fires an electro-magnetic pulse at #{opponent.nation}'s comm. systems..."
		# 	if opponent.em_immunity == false
		# 		opponent.comm_loss
		# 		puts "#{opponent.nation}'s comm. systems have been shut down!"
		# 	else
		# 		puts "#{opponent.nation}'s em-pulse immunity is too high. #{opponent.nation} retains all communications."
		# 	end
		# end



		# # statuses

		# def comm_loss
		# 	#loss of next turn
		# end

		# def incapacitated?
		# 	#ratio of SUFDDIR, loss of turns
		# end


	end

end

