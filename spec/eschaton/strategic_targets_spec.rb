require 'eschaton/strategic_targets'


describe Eschaton::Target do
	
	before do
		@target = Eschaton::Target.new("MAMA", 50)
	end

	it "has a name attribute" do
		expect(@target.name).to eql("MAMA")
	end

	it "has a points attribute" do
		expect(@target.ptvalue).to eq(50)
	end

end