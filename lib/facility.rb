class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.plate_type == nil
      vehicle.set_registration_date(Date.today)
      
      vehicle.set_plate_type(vehicle)

      @collected_fees +=
        if vehicle.antique?
          25
        elsif vehicle.electric_vehicle?
          200
        else
          100
        end

      @registered_vehicles << vehicle
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      if registrant.permit? == false
        if registrant.age >= 16
          registrant.license_data[:written] = true
        else false
        end
      else false
      end
    else false
    end
  end

#   def administer_road_test(registrant)
# #boolean logic sequence with conditionals
#     if 
#   end

#   def renew_drivers_license(registrant)
# #boolean logic sequence with conditionals
#   end
end
