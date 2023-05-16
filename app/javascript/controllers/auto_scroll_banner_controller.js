import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-scroll-banner"
export default class extends Controller {
  connect() {
    this.scrollBanner();
  }

  scrollBanner() {
    var mainDiv = document.getElementById("mainbannerautoscroll");
    var containerHeight = mainDiv.offsetHeight;
    var screenHeight = window.innerHeight;
    var currentPosition = 0;
    var scrollSpeed = 1;
    var colors = ["#F7CAC9", "#F6EAC2", "#E2F0CB", "#C7CEEA", "#F6BDC0", "#F7DC6F", "#E6B0AA", "#D2B4DE", "#D98880", "#F9E79F", "#A9DFBF", "#A3E4D7", "#A2D9CE", "#AED6F1", "#F5CBA7", "#CCD1D9", "#EDBB99", "#D7DBDD", "#D0ECE7", "#A2D9CE", "#FDEDEC", "#D5D8DC", "#FAD7A0", "#EBDEF0", "#D7BDE2", "#FDEBD0", "#E8DAEF", "#FAD7A0", "#D1F2EB", "#FDEBD0", "#F0B27A", "#E6B0AA", "#AED6F1", "#A9DFBF", "#A3E4D7", "#F6BDC0", "#F9E79F"];

    var currentColorIndex = 0;
    var targetColorIndex = 1;
    var currentColor = colors[currentColorIndex];
    var targetColor = colors[targetColorIndex];
    var colorTransitionSpeed = 0.05;

    function changeBackgroundColor() {
      var scrollPercentage = currentPosition / (containerHeight - screenHeight);
      targetColorIndex = Math.floor(scrollPercentage * colors.length);
      targetColor = colors[targetColorIndex];

      // smoothly transition between colors
      var r1 = parseInt(currentColor.substring(1,3), 16);
      var g1 = parseInt(currentColor.substring(3,5), 16);
      var b1 = parseInt(currentColor.substring(5,7), 16);
      var r2 = parseInt(targetColor.substring(1,3), 16);
      var g2 = parseInt(targetColor.substring(3,5), 16);
      var b2 = parseInt(targetColor.substring(5,7), 16);
      var rDiff = r2 - r1;
      var gDiff = g2 - g1;
      var bDiff = b2 - b1;
      r1 += rDiff * colorTransitionSpeed;
      g1 += gDiff * colorTransitionSpeed;
      b1 += bDiff * colorTransitionSpeed;
      currentColor = "#" + Math.round(r1).toString(16).padStart(2, '0') + Math.round(g1).toString(16).padStart(2, '0') + Math.round(b1).toString(16).padStart(2, '0');

      if (document.querySelector('.banner')) {
        document.querySelector('.banner').style.backgroundColor = currentColor;
      } else {
        return;
      }

    }

    function scrollDown() {
      currentPosition += scrollSpeed;
      if (currentPosition > containerHeight - screenHeight) {
        currentPosition = 0;
      }
      mainDiv.style.transform = "translateY(-" + currentPosition + "px)";
      changeBackgroundColor();
      requestAnimationFrame(scrollDown);
    }

    scrollDown();
  }
}