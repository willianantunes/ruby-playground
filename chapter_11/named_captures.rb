re = %r{(?<first>\w+)\s+((?<middle>\w+\.?)\s+)(?<last>\w+)}
p m = re.match("Willian DSL Antunes") # #<MatchData "Willian DSL Antunes" first:"Willian" middle:"DSL" last:"Antunes">
p m[:first] # "Willian"
p m[:middle] # "DSL"
p m[:last] # "Antunes"
p m.named_captures # {"first"=>"Willian", "middle"=>"DSL", "last"=>"Antunes"}

def sample
  re = /(?<first>\w{3})\s+((?<last>\w{3}),?\s?)(?<suffix>\w+\.?)?/
  p re.match "Joe Leo III" # #<MatchData "Joe Leo III" first:"Joe" last:"Leo" suffix:"III">
  m = re.match "Joe Leo, Jr."
  p m.named_captures # {"first"=>"Joe", "last"=>"Leo", "suffix"=>"Jr."}
  m = re.match "Joe Leo"
  p m[:suffix] # nil
end

sample
