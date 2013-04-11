// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    var displayTestimonial, elementList, loadXMLdoc, rndm, rndnumber, x;
    displayTestimonial = function() {
      var displayQuote, rndm;
      displayQuote = function() {
        document.getElementById("testimonials_txt").innerHTML = x.getElementsByTagName("quote")[rndm].childNodes[0].nodeValue;
        document.getElementById("testimonials_name").innerHTML = x.getElementsByTagName("author")[rndm].childNodes[0].nodeValue;
        return document.getElementById("testimonials_department").innerHTML = x.getElementsByTagName("department")[rndm].childNodes[0].nodeValue;
      };
      $("#testimonials_container").fadeOut("slow");
      rndm = rndnumber();
      setTimeout(displayQuote, 500);
      return $("#testimonials_container").fadeIn("slow");
    };
    loadXMLdoc = function() {
      var xmlDoc;
      xmlDoc = void 0;
      if (window.XMLHttpRequest) {
        xmlDoc = new window.XMLHttpRequest();
        xmlDoc.open("GET", "testimonials.xml", false);
        xmlDoc.send("");
        return xmlDoc.responseXML;
      } else if (window.ActiveXObject) {
        xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = false;
        xmlDoc.load("/xml/testimonials.xml");
        return xmlDoc;
      }
      alert("Error loading document");
      return null;
    };
    rndnumber = function() {
      var randscript;
      randscript = -1;
      while (randscript < 0 || randscript > elementList.length - 1) {
        randscript = parseInt(Math.random() * (elementList.length + 1));
      }
      return randscript;
    };
    x = void 0;
    elementList = void 0;
    rndm = void 0;
    x = loadXMLdoc();
    elementList = x.getElementsByTagName("id");
    rndm = rndnumber();
    document.getElementById("testimonials_txt").innerHTML = x.getElementsByTagName("quote")[rndm].childNodes[0].nodeValue;
    document.getElementById("testimonials_name").innerHTML = x.getElementsByTagName("author")[rndm].childNodes[0].nodeValue;
    document.getElementById("testimonials_department").innerHTML = x.getElementsByTagName("department")[rndm].childNodes[0].nodeValue;
    return setInterval(displayTestimonial, 10000);
  });

}).call(this);