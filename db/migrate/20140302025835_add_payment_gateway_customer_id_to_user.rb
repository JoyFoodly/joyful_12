class AddPaymentGatewayCustomerIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :payment_gateway_customer_id, :string
  end
end
