<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

  <title>Admin Login</title>
</head>
<body>
  <div class="card">
    <div class="card-header">Login</div>
    <div class="card-body">
      <form class=""  method="post">
        <input type="text" name="txtuser" id="txtuser" placeholder="admin id">
        <br/>
        <input type="text" name="txtpassword" id="txtpassword" placeholder="password">
        <br/>
        <button type="button" class="btn btn-primary mb-2" name="btnsubmit" onclick="check()">Submit</button>
        <span id="message"></span>
      </form>
    </div>
  </div>

  <script>
  function check() {
    var name = $('#txtuser').val()
    var password= $('#txtpassword').val()
    if (name == ' ' || password == ' '){
      $.ajax({
        success:function(){
          $("form").trigger("reset");
          $('#message').fadeIn().html("missing Fields");
          setTimeout(function(){
            $('#message').fadeOut("Slow");
          }, 2000);
        }
      });
    }
    else
    {
      $('#message').html(' ');
      $.ajax({
        success:function(){
          $("form").trigger("reset");
          $('#message').fadeIn().html("Success");
          setTimeout(function(){
            $('#message').fadeOut("Slow");
          }, 2000);
        }
      });
    }

  }
  </script>

</body>
</html>

 <!-- var xhttp = new XMLHttpRequest();
  // xhttp.onreadystatechange = function() {
  //   if (this.readyState == 4 && this.status == 200) {
  //     document.getElementById("status").innerHTML =
  //     this.responseText;
  //   }
  // };
  // xhttp.open("GET", "<strong>Success!</strong> Indicates a successful or positive action.", true);
  // xhttp.send(); -->
