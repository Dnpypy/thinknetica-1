require_relative 'wagons'

# passenger wagon class
class PassengerWagon < Wagon
  attr_reader :seats_all

  def initialize(seats)
    @seats = seats
    begin
      super 'Passenger'
    rescue RuntimeError
      raise 'Seats must be a number'
    end
    @seats_all = { free: seats, occupied: 0 }
  end

  def occupy_seat
    return if @seats_all[:free] <= 0
    @seats_all[:free] -= 1
    @seats_all[:occupied] += 1
  end

  def occupied_seats
    @seats_all[:occupied]
  end

  def free_seats
    @seats_all[:free]
  end

  private

  def validate! # TODO: create validate module and include in classes
    super
    raise RuntimeError if @seats.class != Integer
    true
  end

end