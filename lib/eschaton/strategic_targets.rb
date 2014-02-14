module Eschaton

	Target = Struct.new(:name, :ptvalue)

	module StrategicTargets


		TARGETS = [
			Target.new("MAMA", 100),
			Target.new("CONFORCON", 50),
			Target.new("SSTRAC", 100),
			Target.new("submarine", 15),
			Target.new("airfield", 20),
			Target.new("bridge", 5),
			Target.new("satellite facility", 25),
			Target.new("carrier group", 28),
			Target.new("power plant", 35),
			Target.new("rail convergence", 23),
			Target.new("atomic plant", 45),
			Target.new("plutonium uranium enrichment plant", 50),
			Target.new("diffusion plant", 55),
			Target.new("breeder reactor", 51),
			Target.new("initiator factory", 38),
			Target.new("neutron lab", 40),
			Target.new("tritium reactor", 35),
			Target.new("heavy water plant", 26),
			Target.new("semiprivate concern", 20),
			Target.new("linear accelerator", 30),
			Target.new("annular fusion lab", 85),
			Target.new("antimissile base", 40),
			Target.new("silo cluster", 42),
			Target.new("b2 squadron", 38)
		]

		# def self.select(target)
		# 	if Targets.any? { |i| i.name == target }
		# 		@target = Targets.find {|x| x.name == target }
		# 	else
		# 		puts "\nPlease Enter the name of a Target:\n "
		# 	end
		# end

		def self.random
			TARGETS.sample
		end

	end
end