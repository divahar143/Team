public
def present?
  !blank?
end

def blank?
  respond_to?(:empty?) ? !!empty? : !self
end

def logger
  unless File.exists?('log/development.log')
    unless File.exists?('log')
      Dir.mkdir('log')
    end
    File.open('log/development.log', 'w')
  end
  log_file = File.open('log/development.log', 'a')
  Logger.new MultiIO.new(STDOUT, log_file)
end

def gem_initialize
  begin
    require 'bundler'
    Bundler.load.specs.sort.each{|gem|
      require gem.name unless %w(rubyzip http-accept addressable rack-test).include?(gem.name)
    }
  rescue Bundler::GemNotFound => ex
    raise "'block in verify_gemfile_dependencies_are_found!': You have requested: (#{ex.class}). Try (bundle install) to fix."
  end
end

def driver_path
  if OS.windows?
    {
      chrome_path: "browsers/windows/chromedriver.exe",
      firefox_path: "browsers/windows/geckodriver.exe"
    }
  elsif OS.mac?
    {

      chrome_path: "browsers/mac/chromedriver",
      firefox_path: "browsers/mac/geckodriver"
    }
  elsif OS.linux?
    {
      chrome_path: "browsers/linux/chromedriver",
      firefox_path: "browsers/linux/geckodriver"
    }
  end
end

class MultiIO
  def initialize(*targets)
     @targets = targets
  end

  def write(*args)
    @targets.each {|t| t.write(*args)}
  end

  def close
    @targets.each(&:close)
  end
end
