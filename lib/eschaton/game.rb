require_relative 'combatant'
require_relative 'gamemaster'
require_relative 'strategic_targets'

module Eschaton

	class Game

		# 400 5-megaton warheads total, disbursed

		attr_accessor :combatants, :beanie_status

		def initialize(name: "Eschaton", beanie_status: 'Normal Game Conditions')
			@beanie_status = beanie_status
			@combatants = [Combatant.new(:amnat), Combatant.new(:sovwar), Combatant.new(:redchi),
										 Combatant.new(:irlibsyr), Combatant.new(:southaf), Combatant.new(:indpak)]
			# status can change to 'cessation of hostilities'
			# and 'utter global crisis'
		end




		# initializes player control of random Combatant. A bit hacky, yes

		def control_combatant
			@playercombatant = @combatants.sample
			puts "\nFor this game of Eschaton, you've been designated to be represent #{@playercombatant.nation}. (press Enter)\n "
			@playercombatant.nation.prepend '*'
			@playercombatant.is_player = true
		end











		# gameplay


		def play(rounds)

			1.upto(rounds) do |r|
				puts "\nRound #{r}\n "


				# puts "Enter an nuclear attack sequence:"

				# loop do

				# 	puts "LOB [Nuclear Attack]"
				# 	puts "SACPOP [Strike Against Civilian Population]"
				# 	puts "MIRV [Multiple Independent Reetry Vehicle]\n "

				# 	attack = gets.chomp.upcase

				# 	puts ' '

				# 	case attack
				# 	when "LOB"
				# 		GameMaster.spasex(@playercombatant, @target)
				# 		break
				# 	when "SACPOP"
				# 		@playercombatant.sacpop(@target)
				# 		break
				# 	when "MIRV"
				# 		@playercombatant.mirv(@target)
				# 		break
				# 	else
				# 		puts "Error: Incorrect Attack Sequence"
				# 	end
				# end

				# sleep(2)

				@combatants.unshift(@playercombatant).uniq!
				@combatants.each do |c|

					# clone the @combatant array without the current Combatant
					combatantsclone = @combatants.reject { |x| x == c}
					opp = combatantsclone.sample

					if c.is_player == true
						puts "Which Combatant will you attack?"
						puts @combatants.map{|x| x.nation if x.is_player == false }.compact.sort.join(', ')
						puts ' '
						loop do
							target = gets.chomp.upcase

							puts ' '

							if @combatants.any? { |i| i.nation == target }
								@target = @combatants.find {|x| x.nation == target }
								GameMaster.spasex(c, @target)
								sleep(2)
								break
							else
								puts "Please enter the name of a Combatant:"
								puts @combatants.map{|x| x.nation }.sort.join(', ')
								puts ' '
							end
							# This loop cycles through the @combatants array for a match between the user's input
							# and each Combatant's nation abbreviation. If match found, we store the Combatant in
							# the @target variable. If no match, we ask user to try again.
						end
					else
						GameMaster.spasex(c, opp)
						sleep(2)
					end
				end

				# if @combatants.all? {|c| c.defcon == 1 }
				# 	@beanie_status = 'Utter Global Crisis'
				# 	puts "\nEvery Combatant has entered DEFCON 1. Otis P. Lord has donned the Red Beanie. #{@beanie_status.upcase}.\n "
				# 	sleep(2)
				# end

				if @combatants.all? {|c| c.megatonnage == 0}
					@beanie_status = 'Cessation of Hostilities'
					puts "\nIt appears the Global supply of Nuclear Weapons has been depleted. Otis P. Lord has donned the White Beanie. #{@beanie_status}.\n "
				end

			end
			puts "END OF GAME".center(30, ".")
			puts "\npress Enter to calculate results\n "
			gets
			puts "\nEndStat calculating results...\n "
			sleep(2)
			3.times do
				puts "calculating...\n "
				sleep(1)
			end
			puts " "
			finalstats
		end












		# statistics

		def print_score(combatant)
			puts "#{combatant.nation} SCORE".ljust(50, '.') + "#{combatant.score} pts. \n "
		end

		def finalstats
			accuracy_rankings = @combatants.sort {|a,b| b.accuracy <=> a.accuracy }
			mvl = accuracy_rankings.first
			if mvl.accuracy = 1
				puts "Most Valuable Lobber: #{mvl.nation} with #{mvl.accuracy} direct hit!\n "
			else
				puts "Most Valuable Lobber: #{mvl.nation} with #{mvl.accuracy} direct hits!\n "
			end
			sleep(1.5)

			@combatants.each {|c| c.scoretotal } # calculates the INDDIR/SUFDDIR ratio for a final score.

			score_rankings = @combatants.sort {|a,b| b.score <=> a.score}
			puts "Final Rankings:\n"
			puts " "
			ranknum = 1
			score_rankings.each do |c|
				puts "#{ranknum} #{c.nation}:"
				puts "Total Infliction of Death, Destruction and Incapacitation of Response(INDDIR): #{c.inddir}"
				puts "Total Suffering of Death, Destruction and Incapacitation of Response(SUFDDIR): #{c.sufddir}"
				puts "Direct Hits: #{c.accuracy}"
				c.each_hit_target do |t|
					puts "Total INDDIR from striking #{t.name}s: #{t.ptvalue}"
				end
				c.target_stats
				print_score(c)
				ranknum += 1
			end
				puts score_rankings.first.nation + ' wins! (press Enter to continue)'
				gets
				@playercombatant.nation[0] = ''
		end

	end
end