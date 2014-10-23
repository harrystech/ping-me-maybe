require "ping_me_maybe/version"
require "ping_me_maybe/constants"
require "ping_me_maybe/connection"

module PingMeMaybe

    def self.ping_cronut(public_id)

        if PingMeMaybe::Constants::CRONUT_HOST && public_id
            begin
                conn = PingMeMaybe::Connection.cronut_connection
                str = "#{Time.now.to_i.to_s}-#{public_id}"
                ping = conn.post "/ping/", {:public_id => (OpenSSL::PKey::RSA.new(PingMeMaybe::Constants::CRONUT_PUBLIC_KEY).public_encrypt(str))}

                return ping.status == 200

            rescue Exception => e
                error_message = "#{e.message}\nTRACE:\n\t#{e.backtrace.join("\n\t")}"
                Rails.logger.error(error_message)
            end
        end
    end
end
