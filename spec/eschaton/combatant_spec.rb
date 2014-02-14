require 'eschaton/combatant'


describe Eschaton::Combatant do

	before do
		@pemulis = Eschaton::Combatant.new('peemster')
		@hal = Eschaton::Combatant.new('halsadick')
	end

	it "but so like, has an upcased nation abbreviation" do
		expect(@hal.nation).to eq('HALSADICK')
	end

	it "has an initial megatonnage" do
		expect(@hal.megatonnage).to be >= 0
	end

	it "loses megatonnage when launching an attack" do
		@pemulis.mirv(@hal)
		expect(@pemulis.megatonnage).to eq(100)
	end

	it "has a total score that stems from the ratio of INDDIR and SUFDDIR" do
		@hal.mirv(@pemulis)
		@pemulis.sacpop(@hal)
		expect(@hal.scoretotal).to eq(7)
	end

	# it "will cause opponent comm loss if successfully launching an EM-Pulse"


	# it "should not have DEFCON levels lower than 1"


end
	