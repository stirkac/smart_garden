class GetStatus
	def get_status
		value = %x( rvmsudo ruby status.rb )
	end
end
