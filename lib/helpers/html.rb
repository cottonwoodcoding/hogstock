module Sinatra::HtmlHelpers
  def h(str)
    Rack::Utils.escape_html(str)
  end

  def nav_menu
    <<-NAV
      <ul id="sdt_menu" class="sdt_menu">
        <li>
          <a href="#">
            <img src="images/1.jpg" alt=""/>
            <span class="sdt_active"></span>
            <span class="sdt_wrap">
              <span class="sdt_link">Portfolio</span>
              <span class="sdt_descr">My work</span>
            </span>
          </a>
          <div class="sdt_box">
            <a href="#">Websites</a>
            <a href="#">Illustrations</a>
            <a href="#">Photography</a>
          </div>
        </li>
      </ul>
    NAV
  end
end
