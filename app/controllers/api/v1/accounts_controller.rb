class Api::V1::AccountsController < Api::ApiController

  # GET /accounts.json
  def index
    expires_in 10.minutes, private: true
    timing "start index..."
    account = h_from(@account)
    timing "set image templates..."
    account[:imageTemplates] = ha_from(@account.image_templates)
    timing "set bare metals..."
    account[:bareMetalServers] = ha_from(@account.bare_metal_servers)
    timing "set virtual servers..."
    #account[:virtualServers] = ha_from(@account.virtual_servers)
    account[:virtualServers] = Array.new
    @account.virtual_servers.each do |vsi|
      vh = h_from(vsi)
      vh[:activeTransaction] = vsi.activeTransaction
      account[:virtualServers].push(vh)
    end
    timing "set disk images..."
    account[:virtualDiskImages] = ha_from(@account.virtual_disk_images)
    timing "set users..."
    account[:users] = ha_from(@account.users)
    timing "set open tickets..."
    account[:openTickets] = ha_from(@account.open_tickets)
    timing "Account.getNetworkVlans..."
    account[:networkVlans] = @client[:Account].getNetworkVlans
    timing "Account.getNetworkVlans done."
    @data = { :accounts => [account] }
    timing "done!"
  end
end
