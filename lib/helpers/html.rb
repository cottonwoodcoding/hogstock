module Sinatra::HtmlHelpers
  def h(str)
    Rack::Utils.escape_html(str)
  end

  def nav_menu
    <<-NAV
      <ul id="sdt_menu" class="sdt_menu">
        <li>
          <a href="#">
            <img src="images/ribs.jpeg" alt=""/>
            <span class="sdt_active"></span>
            <span class="sdt_wrap">
              <span class="sdt_link">Home</span>
              <span class="sdt_descr">About</span>
            </span>
          </a>
        </li>
        <li>
         <a href="#">
          <img src="images/fire.png" alt=""/>
          <span class="sdt_active"></span>
          <span class="sdt_wrap">
            <span class="sdt_link">Photos</span>
            <span class="sdt_descr">See our work</span>
          </span>
          </a>
        </li>
        <li>
         <a href="#">
          <img src="images/kisspig.jpg" alt=""/>
          <span class="sdt_active"></span>
          <span class="sdt_wrap">
            <span class="sdt_link">Testimonials</span>
            <span class="sdt_descr">Satisfied customers</span>
         </span>
          </a>
        </li>
        <li>
         <a href="#">
          <img src="images/pig1.jpg" alt=""/>
          <span class="sdt_active"></span>
          <span class="sdt_wrap">
            <span class="sdt_link">Contact</span>
            <span class="sdt_descr">Questions or comments?</span>
          </span>
          </a>
        </li>
      </ul>
    NAV
  end
end
