class Table < ApplicationRecord
  def self.make_table(csv, num_columns)
    csv.split(",")
  end
end
