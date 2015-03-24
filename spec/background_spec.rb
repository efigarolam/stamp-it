describe StampIt::Background do
  describe '#add' do
    context 'when everything is good' do
      let(:dirname) { File.dirname(__FILE__) }
      let(:original_file) { "#{dirname}/assets/hello.pdf" }
      let(:watermark_file) { "#{dirname}/assets/watermark.pdf" }
      let(:output_file) { "#{dirname}/output/final.pdf" }

      before(:each) do
        File.delete(output_file) if File.exist? output_file
      end

      it 'returns true after the pdftk command is executed' do
        expect(StampIt::Background.add(original_file, watermark_file, output_file)).to eql true
      end

      it 'creates the watermarked final file' do
        expect(File.exist?(output_file)).to be_falsy
        StampIt::Background.add(original_file, watermark_file, output_file)
        expect(File.exist?(output_file)).to be_truthy
      end
    end

    context 'when a file is missing' do
      it 'returns a message if files do not exist' do
        expect(StampIt::Background.add('/not/exist.pdf', '/neither/exist.pdf', '/path/to/file')).to eql 'Original or Watermark files are missing'
      end
    end
  end
end
