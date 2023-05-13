function sortTableByPrice() {
  let table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = null;
  table = document.getElementById("product-table");
  switching = true;
  // Set the sorting direction to ascending
  dir = "asc";
  while (switching) {
    switching = false;
    rows = table.getElementsByTagName("tr");
    // Loop through all table rows except for the header row
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      // Get the two values to compare
      x = rows[i].getElementsByTagName("td")[8];
      y = rows[i + 1].getElementsByTagName("td")[8];
      // Convert the values from strings to numbers
      x = parseInt(x.innerHTML);
      y = parseInt(y.innerHTML);
      // Check if the two rows should switch places, based on the sorting direction
      if (dir == "asc") {
        if (x > y) {
          shouldSwitch = true;
          break;
        }
      } else if (dir == "desc") {
        if (x < y) {
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      // If a switch has been made, mark it and perform the switch
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      switchcount ++;
    } else {
      // If no switch has been made and the sorting direction is ascending, set the sorting direction to descending and start over
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
