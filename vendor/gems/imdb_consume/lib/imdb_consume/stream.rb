module ImdbConsume
  class Stream
    class << self

      def find(id, options={})
        request = URI.encode("#{ImdbConsume.remote_domain}s=#{title}&y=&plot=#{options[:plot]}&r=json")
        response = Typhoeus.get(request)
        if response.present?
          JSON.parse(response.body)
        else
          nil
        end
      end

      def search(title, options={})
        request = URI.encode("#{ImdbConsume.remote_domain}s=#{title}&y=&plot=#{options[:plot]}&r=json")
        response = Typhoeus.get(request)
        if response.present?
          JSON.parse(response.body)
        else
          []
        end
      end
    end
  end
end