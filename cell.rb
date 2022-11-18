class Cell
    attr_accessor :living_neighbors, :alive

    def alive?
      alive
    end

    def will_be_alive?  
      if living_neighbors == 2   
         alive?
      else
        living_neighbors == 3   
       end
    end
end