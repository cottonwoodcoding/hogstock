module Sinatra::HtmlHelpers
  def h(str)
    Rack::Utils.escape_html(str)
  end
  
  def half_menu
    <<-NAV
      <ul id="sdt_menu" class="sdt_menu">
        <li id="side_menu">
          <a href="#" id="side_home">
            <span class="sdt_active"></span>
            <span class="sdt_wrap">
              <span class="sdt_link">Main Menu</span>
              <span class="sdt_descr"></span>
            </span>
          </a>
          <div class="sdt_box">
            <a href="#">Home</a>
            <a href="#">Menu</a>
            <a href="#">Photos</a>
            <a href="#">Contact</a>
            <a href="#">Testimonials</a>
         </div>
        </li>
      </ul>
    NAV
  end


  def nav_menu
    <<-NAV
      <ul id="sdt_menu" class="sdt_menu">
        <li>
          <a href="#" id="home">
            <img src="images/ribs.jpeg" alt=""/>
            <span class="sdt_active"></span>
            <span class="sdt_wrap">
              <span class="sdt_link">Home</span>
              <span class="sdt_descr">About</span>
            </span>
          </a>
        </li>
        <li>
          <a href="#" id="menu">
            <img src="images/smoking.jpeg" alt=""/>
            <span class="sdt_active"></span>
            <span class="sdt_wrap">
              <span class="sdt_link">Menu</span>
              <span class="sdt_descr">Catering</span>
            </span>
          </a>
        </li>
        <li>
         <a href="#" id="photos">
          <img src="images/fire.png" alt=""/>
          <span class="sdt_active"></span>
          <span class="sdt_wrap">
            <span class="sdt_link">Photos</span>
            <span class="sdt_descr">See our food</span>
          </span>
          </a>
        </li>
        <li>
         <a href="#" id="testimonials">
          <img src="images/kisspig.jpg" alt=""/>
          <span class="sdt_active"></span>
          <span class="sdt_wrap">
            <span class="sdt_link">Contact</span>
            <span class="sdt_descr">Questions?</span>
         </span>
          </a>
        </li>
        <li>
         <a href="#" id="contact">
          <img src="images/pig1.jpg" alt=""/>
          <span class="sdt_active"></span>
          <span class="sdt_wrap">
            <span class="sdt_link">Testimonials</span>
            <span class="sdt_descr">Satisfied customers</span>
          </span>
          </a>
        </li>
      </ul>
    NAV
  end
end
