class Api::ApiController < ActionController::Base
  before_action :login

  private
  def login
    user = ENV['SL_USER']
    pass = ENV['SL_API_KEY']
    timing "starting..."
    @client = SoftLayer::Client.new(username: user, api_key: pass)
    timing "Client.new"
    @account = SoftLayer::Account.account_for_client(@client)
    timing "Account.account_for_client"

    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  def h_from obj
    # get :@softlayer_hash and convert string keys to symbol keys
    h = obj.instance_variable_get(:@softlayer_hash)
    h.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
  end

  def ha_from objs
    timing "-- done. make array of hash..."
    ha = Array.new
    objs.each do |obj|
      ha.push(h_from(obj))
    end
    timing "-- done."
    return ha
  end

  def timing str
    @t2 = Time.now
    @t1 = @t2 if not defined? @t1
    @t0 = @t2 if not defined? @t0
    puts "### Timing: %9.6fs/%9.6fs for %s" % [(@t2 - @t0), (@t2 - @t1), str]
    @t1 = @t2
  end
end
