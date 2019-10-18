struct StaticArrayHeap(T,N)
	VERSION = "0.1.0"

	@data : StaticArray(T,N)
	getter size : Int32 = 0

	def initialize()
		@data = uninitialized StaticArray(T,N)
	end
	def empty?
		@size == 0
	end
	def full?
		@size == N
	end

	def push( value : T )
		raise "Buffer overflow #{@size} == #{N}" if @size == N

		i = @size
		@size += 1
		@data[i] = value

		return if @size == 1

		loop do
			parent = ( i - 1 ) >> 1
			if @data[i] < @data[parent]
				@data[parent],@data[i] = @data[i],@data[parent]
				i = parent

				return if i <= 0
			else
				return
			end
		end
	end
	def pop()
		@data[0] = @data[@size-1]
		@size -= 1
		return if @size == 1

		i = 0

		loop do
			idx_left  = i * 2 + 1
			idx_right = i * 2 + 2
			if idx_left < @size && @data[idx_left] < @data[i]
				next_i = idx_left
			elsif idx_right < @size && @data[idx_right] < @data[i]
				next_i = idx_right
			else
				return
			end
			@data[next_i],@data[i] = @data[i],@data[next_i]
			i = next_i
		end
	end
	def next()
		raise "Heap empty" if empty?
		@data[0]
	end
	def debug()
		puts self.inspect
		#puts "@size=#{@size}"
		#puts (0..@size).map {|i| @data[i].inspect }.join(",")
	end
	def inspect( io : IO )
		io << "StaticArrayHeap[@size=#{@size}"
		@size.times {|i|
			io << ",#{@data[i]}"
		}
		io << "]"
	end
end
