module Client::ClientConcern
    extend ActiveSupport::Concern
    include ApplicationConcern


    def active_client?
        
    end
    

    def generate_token
        Digest::SHA1.hexdigest([Time.now, rand].join)
    end

end