class AddBussinessTimeToShop < ActiveRecord::Migration[6.1]
  def change
    add_column  :shops, :weekday_opentime, :time
    add_column  :shops, :weekday_closetime, :time
    add_column  :shops, :weekend_opentime, :time
    add_column  :shops, :weekend_closetime, :time
  end
end
