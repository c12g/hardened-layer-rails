class Api::V1::AccountsController < Api::ApiController

  # GET /accounts.json
  def index
    account = h_from(@account)
    account[:servers] = ha_from(@account.servers)
    account[:image_templates] = ha_from(@account.image_templates)
    @accounts = [account]
  end
end
