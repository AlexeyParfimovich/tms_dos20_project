<!DOCTYPE html>
<html>
<head>
<title>TMS DOS20 Project on host <?php echo gethostname(); ?></title>
<meta charset="utf-8">
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h2>The application is hosting by Apache</h2>
<p> Server name: <?php echo gethostname(); ?></p>
<p> Server IP address: <?php echo $_SERVER['SERVER_ADDR']; ?></p>
<p>If you see this page the Project was successfully started.</p>
<h3>Enter your credentials:</h3>
<form action="payment.php" method="POST">
<p>Enter name: <input type="text" name="firstname" /></p>
<p>Enter surname: <input type="text" name="lastname" /></p>
<p>Enter order number: <input type="integer" name="orderNumber" value="23456" /></p>
<input type="hidden" name="amount" value=15000>
<input type="submit" value="Make payment">
</form>

</body>
</html>