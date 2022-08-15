'use strict';

// Bold Element + Custom

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Reverse Engineer</title>
    <meta charset="utf-8" />
    <style type="text/css" media="screen">
      #container {
          width: 100px;
          height: 100px;
          background-color: purple;
      }
    </style>

    <script type="text/javascript" >
      document.addEventListener('DOMContentLoaded', () => {
        const cont = document.querySelector('#container');
        document.addEventListener('click', (e) => e.target === cont ? 42 : cont.style = 'display: none');
      });
    </script>
  </head>
  <body>
    <div id="container">
    </div>
  </body>
</html>
