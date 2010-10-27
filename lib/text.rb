module Text
  def self.wrap(str, max_size, indent = '')
    all = []
    line = ''
    for l in str.split
      if (line+l).length >= max_size
        all.push(line)
        line = ''
      end
      line += line == '' ? l : ' ' + l
    end
    all.push(line).map{ |l| "#{indent}#{l}" }.join("\n")
  end
end
