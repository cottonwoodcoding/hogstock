module Sinatra::HtmlHelpers
  def vertical_menu
    <<-NAV
      <ul id="sdt_menu" class="sdt_menu side-menu">
        <li id="side_menu" class="skip-image">
          <a href="#" id="side_home">
            <span class="sdt_active"></span>
            <span class="sdt_wrap">
              <span class="sdt_link">Main Menu</span>
              <span class="sdt_descr">Go To Top</span>
            </span>
          </a>
          <div class="sdt_box">
            <a href="#" id="menu_side">Menu</a>
            <a href="#" id="photos_side">Photos</a>
            <a href="#" id="contact_side">Contact</a>
            <a href="#" id="testimonials_side">Testimonials</a>
         </div>
        </li>
      </ul>
    NAV
  end

  def nav_menu
    <<-NAV
      <ul id="sdt_menu" class="sdt_menu">
        <li>
          <a href="#" id="menu">
            <img src="images/hogstock/smoking.jpeg" alt=""/>
            <span class="sdt_active"></span>
            <span class="sdt_wrap">
              <span class="sdt_link">Menu</span>
              <span class="sdt_descr">Catering</span>
            </span>
          </a>
        </li>
        <li>
         <a href="#" id="photos">
          <img src="images/hogstock/fire.png" alt=""/>
          <span class="sdt_active"></span>
          <span class="sdt_wrap">
            <span class="sdt_link">Photos</span>
            <span class="sdt_descr">See our work</span>
          </span>
          </a>
        </li>
        <li>
         <a href="#" id="contact">
          <img src="images/hogstock/kisspig.jpg" alt=""/>
          <span class="sdt_active"></span>
          <span class="sdt_wrap">
            <span class="sdt_link">Contact</span>
            <span class="sdt_descr">Questions?</span>
         </span>
          </a>
        </li>
        <li>
         <a href="#" id="testimonials">
          <img src="images/hogstock/pig1.jpg" alt=""/>
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
