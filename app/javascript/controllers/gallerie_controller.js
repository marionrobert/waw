import { Controller } from "@hotwired/stimulus"
import { Alert } from "bootstrap"

export default class extends Controller {

  static targets = [ "allframes" , "preview"]

  connect() {
    // Stocke une référence au contrôleur
    this.controller = this
  }

  zoompreview() {

  }

  move_left() {
    let frame = document.getElementById("mainframe");
    console.log("MOVE FRAME LEFT");
    let X = -5;
    let currentLeft = parseInt(frame.style.left) || 0; // obtenir la valeur actuelle de "left" et la convertir en nombre
    frame.style.left = `${currentLeft + X}px`; // ajouter X à la valeur actuelle de "left" et réassigner à "left"
  }

  move_right() {
    let frame = document.getElementById("mainframe");
    console.log("MOVE FRAME RIGHT");
    let X = 5;
    let currentLeft = parseInt(frame.style.left) || 0; // obtenir la valeur actuelle de "left" et la convertir en nombre
    frame.style.left = `${currentLeft + X}px`; // ajouter X à la valeur actuelle de "left" et réassigner à "left"
  }

  move_up() {
    let frame = document.getElementById("mainframe");
    console.log("MOVE FRAME LEFT");
    let Y = -5;
    let currentTop = parseInt(frame.style.top) || 0; // obtenir la valeur actuelle de "left" et la convertir en nombre
    frame.style.top = `${currentTop + Y}px`; // ajouter X à la valeur actuelle de "left" et réassigner à "left"
  }

  move_down() {
    let frame = document.getElementById("mainframe");
    console.log("MOVE FRAME RIGHT");
    let Y = 5;
    let currentTop = parseInt(frame.style.top) || 0; // obtenir la valeur actuelle de "left" et la convertir en nombre
    frame.style.top = `${currentTop + Y}px`; // ajouter X à la valeur actuelle de "left" et réassigner à "left"
  }

  rotate_frame_more() {
    let frame = document.getElementById("mainframe");
    console.log("ROTATE FRAME RIGHT");
    let W = 5;
    let currentTransform = frame.style.transform || "perspective(400px) rotateY(0deg)";
    let currentRotation = currentTransform.match(/rotateY\((\d+)deg\)/);
    let newRotation = currentRotation ? parseInt(currentRotation[1]) + W : W;
    frame.style.transform = `perspective(400px) rotateY(${newRotation}deg)`;
  }

  rotate_frame_less() {
    let frame = document.getElementById("mainframe");
    console.log("ROTATE FRAME LEFT");
    let W = -5;
    let currentTransform = frame.style.transform || "perspective(400px) rotateY(0deg)";
    let currentRotation = currentTransform.match(/rotateY\(([-]?\d+)deg\)/);
    let newRotation = currentRotation ? parseInt(currentRotation[1]) + W : W;
    frame.style.transform = `perspective(400px) rotateY(${newRotation}deg)`;
  }

  bigger_frame() {
    console.log("TESTBIGGER");
    let frame = document.getElementById("frameadjusting");
    if (!frame) {
      console.error("Element not found.");
      return;
    }
    console.log(frame);
    let currentTransform = frame.style.transform || "scale(1)";
    console.log(currentTransform)
    let currentScale = parseFloat(currentTransform.slice(6));
    console.log(currentScale)
    if(currentScale < 1){
      currentScale = 1;
    }
    frame.style.transform = `scale(${currentScale + 0.05})`;
    console.log(frame.style.transform)
  }

  shrink_frame() {
    console.log("size_adjust_less")
    let frame = document.getElementById("frameadjusting");
    let currentTransform = getComputedStyle(frame).transform;
    let currentScale = parseFloat(currentTransform.slice(7));
    if(currentScale <= 0.05){
      frame.style.transform = `scale(1)`;
      return;
    }
    frame.style.transform = `scale(${currentScale - 0.05})`;
    console.log(frame.style.transform)
  }


  change_bg1() {
    let room1 = document.getElementById("room1")
    let room2 = document.getElementById("room2")
    let room3 = document.getElementById("room3")
    let room4 = document.getElementById("room4")
    let room5 = document.getElementById("room5")

    room1.style.display = "";
    room2.style.display = "none";
    room3.style.display = "none";
    room4.style.display = "none";
    room5.style.display = "none";
  }

  change_bg2() {
    let room1 = document.getElementById("room1")
    let room2 = document.getElementById("room2")
    let room3 = document.getElementById("room3")
    let room4 = document.getElementById("room4")
    let room5 = document.getElementById("room5")

    room1.style.display = "none";
    room2.style.display = "";
    room3.style.display = "none";
    room4.style.display = "none";
    room5.style.display = "none";
  }

  change_bg3() {
    let room1 = document.getElementById("room1")
    let room2 = document.getElementById("room2")
    let room3 = document.getElementById("room3")
    let room4 = document.getElementById("room4")
    let room5 = document.getElementById("room5")

    room1.style.display = "none";
    room2.style.display = "none";
    room3.style.display = "";
    room4.style.display = "none";
    room5.style.display = "none";
  }

  change_bg4() {
    let room1 = document.getElementById("room1")
    let room2 = document.getElementById("room2")
    let room3 = document.getElementById("room3")
    let room4 = document.getElementById("room4")
    let room5 = document.getElementById("room5")

    room1.style.display = "none";
    room2.style.display = "none";
    room3.style.display = "none";
    room4.style.display = "";
    room5.style.display = "none";
  }

  change_bg5() {
    let room1 = document.getElementById("room1")
    let room2 = document.getElementById("room2")
    let room3 = document.getElementById("room3")
    let room4 = document.getElementById("room4")
    let room5 = document.getElementById("room5")

    room1.style.display = "none";
    room2.style.display = "none";
    room3.style.display = "none";
    room4.style.display = "none";
    room5.style.display = "";
  }

  showPreview() {
    let zoom = document.getElementById("zoomvignette")
    zoom.classList.toggle("hiddenzoom")
    zoom.classList.toggle("zoompreview")
    
  }
}
