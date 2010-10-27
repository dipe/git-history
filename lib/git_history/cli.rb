module GitHistory::CLI
  require 'text'
  
  def self.run(args)
    range = args[0]
    history_from_gitlog(range)
  end

  def self.history_from_gitlog(range)
    history = []
    `git log --date-order --date=short #{range}`.split(/^commit .*/).each do |commit|
      next unless commit.match(/\S/)
      next if commit.match(/^Merge:/)
      
      author = commit[/^Author:\s+(.*)/,1]
      date = commit[/^Date:\s+(.*)/,1]
      text = commit.grep(/^    .*/).map{ |l| Text::wrap(l.strip, 72, "\t") }.join("\n")
      history.push("#{date} #{author}\n\n#{text}")
    end
    
    puts history.sort.reverse.join("\n\n")
  end
end
