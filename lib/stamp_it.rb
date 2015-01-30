# PDF docs watermark creator

require 'stamp_it/version'
require 'stamp_it/watermark'
require 'stamp_it/background'

class StampIt
  EXE_NAME = 'pdftk'

  attr_accessor :config, :pdftk_cmd

  def initialize(pdftk_binary_path = nil)
    @config = {}
    @pdftk_cmd = pdftk_binary_path || find_pdftk_binary_path
    fail "Location of #{EXE_NAME} unknown" if @pdftk_cmd.empty?
    fail "Bad #{EXE_NAME}'s path: #{@pdftk_cmd}" unless File.exist?(@pdftk_cmd)
    fail "#{EXE_NAME} is not executable" unless File.executable?(@pdftk_cmd)
  end

  private

  def find_pdftk_binary_path
    possible_locations = (%w(/usr/bin /usr/local/bin ~/bin) + ENV['PATH'].split(':')).uniq
    exe_path ||= config[:exe_path] unless config.empty?
    exe_path ||= possible_locations.map { |l| File.expand_path("#{l}/#{EXE_NAME}") }.find { |location| File.exist?(location) }
    exe_path || ''
  end
end
