require 'pry'
class Waiter

    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tip = Meal.all[0].tip
        best_tipper = Meal.all[0].customer
        Meal.all.each do |meal|
            if meal.tip > best_tip
                best_tip = meal.tip
                best_tipper = meal.customer
            else
                best_tipper
            end
        end
        best_tipper
    end
end