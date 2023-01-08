# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  island_count = 0
  rows = grid.count
  columns = grid[0].count

  # grid.each_index do |col_index|
  #   grid[col_index].each_index do |row_index|
  #     puts "Coordinates: #{col_index}, #{row_index}"
  #   end
  # end
  island_count
end

String.class_eval do
  def is_land?
    self == '1'
  end
  def is_water?
    self == '0'
  end
end

puts(num_islands([
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]))
