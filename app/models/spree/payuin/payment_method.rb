class Spree::Payuin::PaymentMethod < Spree::PaymentMethod
  preference :account_id,  :string
  preference :url,         :string, :default =>  "https://test.payu.in/_payment"
  preference :mode,        :string
  preference :merchant_id, :string
	preference :salt,        :string
  
  attr_accessible :preferred_account_id, :preferred_url, :preferred_mode, :preferred_merchant_id, :preferred_salt

  def payment_profiles_supported?
    true
  end

  def provider_class
    self.class
  end

  def method_type
    'payuin'
  end

# TODO: Move to a separate class
  def actions
      %w(capture)
  end
  
  def capture(payment)
    puts "here"*4
    payment.update_attribute(:state, 'pending')
    payment.complete
    true
  end
end