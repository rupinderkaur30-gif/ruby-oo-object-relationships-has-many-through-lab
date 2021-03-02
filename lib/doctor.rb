require "pry"
class Doctor 

    attr_accessor :name 
    @@all = []
    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |appointment| 
            #binding.pry
            appointment.doctor == self

        end
    end

    def patients
     appointments.map {|appointment| appointment.patient}
    end

    def new_appointment( date, patient)
        Appointment.new(date , patient , self)
    end
end
