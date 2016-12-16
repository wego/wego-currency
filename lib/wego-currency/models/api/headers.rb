module WegoCurrency
  module Api
    class Headers
      include ActiveModel::Model
      
      attr_accessor :message, :status_code
    end
  end
end