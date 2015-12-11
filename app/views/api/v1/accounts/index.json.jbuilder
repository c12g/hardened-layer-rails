json.array!(@accounts) do |account|
  json.extract! account, :id, :companyName, :email, :servers, :image_templates
  json.url api_v1_account_url(account[:id], format: :json)
end
