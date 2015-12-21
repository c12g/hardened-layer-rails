class Api::V1::AccountsController < Api::ApiController

  # GET /accounts.json
  def index
    account = h_from(@account)
    account[:imageTemplates] = ha_from(@account.image_templates)
    account[:bareMetalServers] = ha_from(@account.bare_metal_servers)
    account[:virtualServers] = ha_from(@account.virtual_servers)
    account[:virtualDiskImages] = ha_from(@account.virtual_disk_images)
    account[:users] = ha_from(@account.users)
    account[:openTickets] = ha_from(@account.open_tickets)
    account[:networkVlans] = @client[:Account].getNetworkVlans
    @data = { :accounts => [account] }
  end
end
