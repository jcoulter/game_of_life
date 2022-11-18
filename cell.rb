class Cell
    attr_accessor :living_neighbors
    
    def alive?
    end

    def will_be_alive?
      living_neighbors == 3  
    end
end