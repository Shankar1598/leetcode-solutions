# Speed: beats 82.5%

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  $grid = grid
  island_count = 0
  $rows = $grid.count
  $columns = $grid[0].count

  (0...$rows).each do |row_index|
    # puts "row: #{row_index}"
    (0...$columns).each do |col_index|
      if $grid[row_index][col_index] == '1' && explore(row_index, col_index)
        island_count += 1
      end
    end
  end
  island_count
end

def explore x, y
  return false if x < 0 || y < 0
  return false if x >= $rows || y >= $columns
  return false if $grid[x][y] == '0'

  $grid[x][y] = '0'

  explore(x+1, y)
  explore(x, y+1)
  explore(x-1, y)
  explore(x, y-1)
  return true
end


puts(num_islands([
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]))

puts(num_islands([
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]))
