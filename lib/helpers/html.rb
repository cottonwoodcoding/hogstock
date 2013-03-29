module Sinatra::HtmlHelpers
  def h(string)
    Rack::Utils.escape_html(str)
  end
end
