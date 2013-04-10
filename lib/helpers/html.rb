module Sinatra::HtmlHelpers
  def h(str)
    Rack::Utils.escape_html(str)
  end
  
  def vertical_menu
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
            <span class="sdt_descr">See our work</span>
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

  def thumbnails
    <<-THUMBS
      <div id="st_main" class="st_main" >
        <img src="/images/chicken.jpg" alt="" class="st_preview" style="display:none;"/>
        <div class="st_overlay"></div>
        <h1>Chicken</h1>
        <div id="st_loading" class="st_loading">
          <span>Loading...</span>
        </div>
        <ul id="st_nav" class="st_navigation">
          <li class="album">
            <span class="st_link">
              Click
              <span class="st_arrow_down"></span>
            </span>
            <div class="st_wrapper st_thumbs_wraper">
              <div class="st_thumbs">
                <img src="images/chicken1.jpg" alt="images/chicken1.jpg"/>
                <img src="images/chicken2.jpg" alt="images/chicken2.jpg"/>
                <img src="images/chicken_rack.jpeg" alt="images/chicken_rack.jpeg"/>
                <img src="images/chicken_rack2.jpeg" alt="images/chicken_rack2.jpeg"/>
                <img src="images/pig.jpg" alt="images/pig.jpg"/>
                <img src="images/pig1.jpg" alt="images/pig1.jpg"/>
                <img src="images/pig2.jpg" alt="images/pig2.jpg"/>
                <img src="images/pig3.jpg" alt="images/pig3.jpg"/>
                <img src="images/pig4.jpg" alt="images/pig4.jpg"/>
                <img src="images/pig5.jpg" alt="images/pig5.jpg"/>
                <img src="images/pig6.jpg" alt="images/pig6.jpg"/>
              </div>
            </div>
          </li>
        </ul>
      </div>
    THUMBS
  end
end
