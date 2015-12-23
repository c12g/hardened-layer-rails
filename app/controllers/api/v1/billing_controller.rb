class Api::V1::BillingController < Api::ApiController

  # GET /accounts.json
  def index
    account = h_from(@account)
    servers = ha_from(@account.servers)
    @billing = Array.new
    servers.each do |s|
      b = Hash.new
      b[:id] = s[:id]
      b[:hostname] = s[:hostname]
      b[:billing_id] = s[:billingItem]['id']
      b[:fee] = s[:billingItem]['recurringFee']
      @billing.push(b)
    end
  end
end
