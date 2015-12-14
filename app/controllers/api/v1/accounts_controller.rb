class Api::V1::AccountsController < Api::ApiController

  # GET /accounts.json
  def index
    account = h_from(@account)
    #account[:image_templates] = ha_from(@account.image_templates)
    #account[:bare_metal_servers] = ha_from(@account.bare_metal_servers)
    #account[:virtual_servers] = ha_from(@account.virtual_servers)
    #account[:virtual_disk_images] = ha_from(@account.virtual_disk_images)
    #account[:users] = ha_from(@account.users)
    #account[:open_tickets] = ha_from(@account.open_tickets)
    @servers = ha_from(@account.servers)

    account[:servers] = Array.new
    @servers.each do |server|
      account[:servers].push(server[:id])
    end

    @data = {
      :accounts => [account],
      :servers => ha_from(@account.servers)
    }
  end
end
