module GitHistory::CLI
  require 'text'
  
  def self.run(args)
    range = args[0] || ''
    history_from_gitlog(range)
  end

  def self.history_from_gitlog(range = "")
    r = range[/[^\&\'\"]*/]
    `git log --date=short #{r}`.split(/^commit .*/).each do |commit|
      next if commit.match(/^Merge:/)
      
      author = commit[/^Author:\s+(.*)/,1]
      date = commit[/^Date:\s+(.*)/,1]
      text = commit.lines.grep(/^    .*/).map{ |l| Text::wrap(l.strip, 72, "\t") }.join("\n")

      puts "#{date} #{author}\n\n#{text}\n\n"
    end
  end
end
