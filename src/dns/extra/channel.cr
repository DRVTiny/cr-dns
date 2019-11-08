abstract class Channel(T)
	def receive_with_timeout( seconds : Float64 )
		dly = delay ( seconds ) { close }
		receive.tap { dly.cancel }
	end
end
