#abstract class Channel(T)
#	def receive_with_timeout( seconds : Number )
#		return receive_before( Time.now() + Time::Span.new(0,0,seconds) )
#	end
#	def receive_before( t : Time )
#		puts "receive_before( #{t} )"
#		while empty? && (Time.now() < t)
#			Fiber.yield
#		end
#		puts "drop out"
#		return (empty?) ? nil : self.receive
#	end
#end
