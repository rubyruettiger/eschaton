require 'eschaton/game'

describe Eschaton::Game do

	before do
		@eschaton = Eschaton::Game.new
	end

	# context "being played" do
	# 	before do
	# 		@combatant = Eschaton.combatants.sample
	# 	end

	# 	it "critical hit if higher accuracy" do
	# 		GameMaster.stub(:accuracy) {19}
	# 		@eschaton.play(2)
	# 		expect(combatant.inddir).to eq((inddir + 50) * 2)
	# 	end

	# 	it "normal damage if medium accuracy" do
	# 		GameMaster.stub(:accuracy) {10}
	# 		@eschaton.play(2)
	# 		expect(@combatant.inddir).to eq((@inddir + 30) * 2)
	# 	end

	# 	it "misses if a low accuracy" do
	# 		GameMaster.stub(:accuracy) {3}
	# 		@eschaton.play(2)
	# 		expect(@combatant.inddir).to eq(0)
	# 	end
	# end

	# context "all Combatants at DEFCON 1" do 

	# 	before do
	# 		@eschaton.combatants.map! { |c| c.defcon = 1 }
	# 	end

	# 	it "changes game beanie status to 'UTTER GLOBAL CRISIS'" do
	# 		expect(@eschaton.beanie_status).to eq('UTTER GLOBAL CRISIS')
	# 	end

	# end

	# it "should have a minimum of 3 rounds"

	# it "should have a maximum of 400 5-megaton warheads to distribute"

	# it "should distribute megatonnage to combatants"

	# it "should have a beanie status to start the game"

	# "eschaton beanie status at 'Cessation of Hostilities'"

	# "eschaton beanie status at 'Utter Global Crisis'"

	# 	it "should raise all combatants DEFCON levels to 1"



end