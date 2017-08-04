class Table < ApplicationRecord
  def self.make_table(csv, num_columns)
    cell_array = csv.split(",")
    num_cells = cell_array.length
    num_rows = (num_cells.to_f / num_columns.to_f).ceil

    table = []
    num_rows.times do |row_index|
      table << []
      num_columns.times do |column_index|
        table[row_index] << cell_array[column_index * num_rows + row_index]
      end
    end
    table
  end
end
