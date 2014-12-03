class StampIt
  class Background
    class << self

      def add(original_path, watermark_path, output_path)
        unless files_exist?([original_path, watermark_path])
          return 'Original or Watermark files are missing'
        end

        pdftk_cmd = StampIt.new.pdftk_cmd

        %x(#{pdftk_cmd} #{original_path} background #{watermark_path} output #{output_path})
        $?.success?
      end

      def files_exist?(files)
        success = true

        files.each do |f|
          success = false unless File.exist?(f)
        end

        success
      end
    end
  end
end
