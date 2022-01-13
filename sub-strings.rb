
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit", "do"]

def substrings(string, array)
    result = Hash.new(0)
    string = string.split
    array.each do | word |
        string.each do | thing |
            result[word] += thing.scan(/#{word}/).length if thing.scan(/#{word}/).length > 0
        end
    end
    p result
end

substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
substrings("doodoo", dictionary)

# Was able to get this working to produce the example results with just the stuff in my head, BUT...
# The examples don't check for the same substring being included in a word twice (like "do" in "doodoo", which I added for this reason),
# and my original solution would NOT have counted that correctly.
# I feel like I should be able to solve that algorithmically at this point, but it's Ruby, so I don't have to, there's a method for that.
# Shoutout to StackOverflow.
