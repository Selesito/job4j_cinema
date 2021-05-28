<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
          integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
          integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
          integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
  <title>Оплата билета!</title>
  <script>
    $(document).ready(function() {
      let storedData = sessionStorage.getItem("place");
      let data = JSON.parse(storedData);
      let count = 0;
      $.each(data, function(index, value) {
        if (count === 0) {
          document.getElementById("payment").innerHTML += "<h4>Вы выбрали:</h4>";
        }
        document.getElementById("payment").innerHTML += "<h4 style=\"color:#FF0000\">" + value + "</h4>";
        count++;
      });
      let sum = 400 * count;
      document.getElementById("payment").innerHTML += "<h4>Сумма к оплате: " + sum + " рублей.</h4>";
      document.getElementById("places").value = storedData;
    });
  </script>
</head>
<body>
<div class="container">
  <div class="row pt-3">
    <div id="payment">
    </div>
  </div>
  <div class="row">
    <form action="pay" method="post">
      <div class="form-group">
        <label for="username">ФИО</label>
        <input type="text" class="form-control" name="username" id="username" placeholder="ФИО" title="Введите ФИО...">
      </div>
      <div class="form-group">
        <label for="phone">Номер телефона</label>
        <input type="text" required class="form-control" id="phone" name="phone" placeholder="Номер телефона..." title="Номер телефона..." >
      </div>
      <div class="form-group">
        <input type="hidden" class="form-control" id="places" name="places" >
        <label for="email">Адрес эл.почты</label>
        <input type="text" required class="form-control" id="email" name="email" placeholder="Адрес эл.почты" title="Введите email...">
      </div>
      <button type="submit" class="btn btn-success" onclick="validate()">Оплатить</button>
    </form>
  </div>
</div>
</body>
</html>