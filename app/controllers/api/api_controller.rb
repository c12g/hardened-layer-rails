class Api::ApiController < ActionController::Base
  before_action :login

  private
  def login
    user = ENV['SL_USER']
    pass = ENV['SL_API_KEY']
    @client = SoftLayer::Client.new(username: user, api_key: pass)
    @account = SoftLayer::Account.account_for_client(@client)
  end

  def h_from obj
    # get :@softlayer_hash and convert string keys to symbol keys
    h = obj.instance_variable_get(:@softlayer_hash)
    h.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
  end

  def ha_from objs
    ha = Array.new
    objs.each do |obj|
      ha.push(h_from(obj))
    end
    return ha
  end
end
