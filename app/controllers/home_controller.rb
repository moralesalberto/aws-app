class HomeController < ApplicationController

  # this is mapped to the root route
  def index
    render text: 'This is the slow response app, use it by typing: http://<severname>/slow?seconds=1'
  end

  # we will read the field parameters sent in the URL
  # and get the seconds to use for a delay
  def slow
    seconds = params[:seconds].to_i
    seconds = 3 if seconds < 1 and seconds < 30 # set a default value and an upper bound
    sleep(seconds)
    render text: "this is the slow action; we slept for #{seconds} seconds"
  end
end
