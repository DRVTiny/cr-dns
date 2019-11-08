class IO
	def read_network_short
		read_bytes UInt16, IO::ByteFormat::BigEndian
	end
	
	def write_network_short( s )
		write_bytes s.to_u16, IO::ByteFormat::BigEndian
	end
	
	def read_network_long
		read_bytes UInt32, IO::ByteFormat::BigEndian
	end
	
	def write_network_long( l )
		write_bytes l.to_u32, IO::ByteFormat::BigEndian
	end
end
