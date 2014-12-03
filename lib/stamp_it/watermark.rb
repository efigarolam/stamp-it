require 'prawn'

class StampIt
  class Watermark
    class << self

      def create(file_path, message, config = {})
        begin
          Prawn::Document.generate(file_path) do
            rotate(52, origin: [0,0]) do
              transparent(0.5) do
                fill_color "FF000"
                draw_text message, size: 24, at: [0,0]
              end
            end
          end

          return file_path
        rescue
          puts "Something went wrong creating the watermark pdf document."
          return false
        end
      end

    end
  end
end
