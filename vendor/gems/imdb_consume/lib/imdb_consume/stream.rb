module ImdbConsume
  class Stream
    class << self

      def find(id, options={})
        response = Typhoeus.get("#{ImdbConsume.remote_domain}i=#{id}&y=&plot=#{options[:plot]}&r=json")
        if response.present?
          JSON.parse(response.body)
        else
          nil
        end
      end

      def search(title, options={})
        response = Typhoeus.get("#{ImdbConsume.remote_domain}s=#{title}&y=&plot=#{options[:plot]}&r=json")
        if response.present?
          JSON.parse(response.body)
        else
          nil
        end
      end
    end
  end
end