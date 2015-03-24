describe StampIt::Watermark do
  describe '#create' do
    let(:file_path) { "#{File.dirname(__FILE__)}/output/watermark.pdf" }

    before(:each) do
      File.delete(file_path) if File.exist? file_path
    end

    it 'returns the file path when everything goes well' do
      expect(StampIt::Watermark.create(file_path, 'Watermark example')).to eql file_path
    end

    it 'creates a watermkark pdf file' do
      expect(File.exist?(file_path)).to be_falsy
      StampIt::Watermark.create(file_path, 'Watermark example')
      expect(File.exist?(file_path)).to be_truthy
    end
  end
end
