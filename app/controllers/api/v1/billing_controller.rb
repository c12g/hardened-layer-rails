class Api::V1::BillingController < Api::ApiController

  # GET /accounts.json
  def index
    timing "start index..."
    account = h_from(@account)
    timing "set servers..."
    servers = ha_from(@account.servers)
    timing "generate billing informations..."
    @billing = Array.new
    servers.each do |s|
      b = Hash.new
      b[:id] = s[:id]
      b[:hostname] = s[:hostname]
      if s[:billingItem]
        b[:billing_id] = s[:billingItem]['id']
        b[:fee] = s[:billingItem]['recurringFee']
      end
      @billing.push(b)
    end
    timing "done!"
  end
end
