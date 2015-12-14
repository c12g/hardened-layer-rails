json.set! :data do
  json.array!(@accounts) do |account|
    json.set! :type, 'accounts'
    json.extract! account, :id
    json.set! :attributes do
      json.extract! account, :companyName, :email
    end
    json.set! :relationships do
      json.set! :servers do
        json.set! :data do
          json.array!(account[:servers]) do |server|
            json.set! :type, 'servers'
            json.extract! server, :id
          end
        end
      end
    end
    json.set! :links do
      json.url api_v1_account_url(account[:id], format: :json)
    end
  end
end
json.set! :included do
  json.array!(@servers) do |server|
    json.set! :type, 'server'
    json.id server[:id]
    json.set! :attributes do
      json.extract! server, :hostname, :maxMemory, :maxCpu, :domain
    end
  end
end
