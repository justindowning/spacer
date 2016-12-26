require "sinatra"

post "/spacer" do
  halt 403, {"Content-Type" => "text/plain"}, "G R E E T I N G S" unless params[:token] == ENV["AUTH_TOKEN"]
  spaced_output = String.new
  word_array = params[:text].split(" ")
  word_array.each do |word|
    letter_array = word.scan(/\w/)
    letter_array.each do |letter|
      spaced_output += "#{letter.upcase} "
    end
    spaced_output += " "
  end
  spaced_output.strip
end
