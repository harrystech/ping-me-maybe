require "ping_me_maybe/constants"

module PingMeMaybe
    module Connection
        def self.cronut_connection
            Faraday.new(PingMeMaybe::Constants::CRONUT_HOST) do |c|
                c.request :url_encoded
                c.use Faraday::Adapter::NetHttp
                c.headers = {
                    PingMeMaybe::Constants::CRONUT_API_TOKEN_HEADER => PingMeMaybe::Constants::CRONUT_API_TOKEN
                }
            end
        end
    end
end