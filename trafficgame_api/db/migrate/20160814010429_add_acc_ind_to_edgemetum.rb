class AddAccIndToEdgemetum < ActiveRecord::Migration[5.0]
  def change
    add_column :edgemeta, :acc_ind, :int
  end
end
