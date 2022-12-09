class Cell
    attr_accessor :alive, :neighbors

    def initialize(alive = false)
      @alive = alive
      @neighbors = []
    end

    def alive?
      alive
    end
    
    def living_neighbors
      neighbors.count {|neighbor| neighbor.alive?}
    end

    def will_be_alive?  
      if living_neighbors == 2   
         alive?
      else
        living_neighbors == 3   
       end
    end

    def show
      if alive?
        '[A]'
      else 
        '[ ]'
      end
    end

end