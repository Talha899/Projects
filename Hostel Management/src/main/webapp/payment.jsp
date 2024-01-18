<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Form</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body>
    <div class="container">
        <!-- Header code remains unchanged -->
    </div>

    <div class="container">
        <h2>Payment Form</h2>
        <form action="jazzCashPost" method="post">
            <div class="mb-3">
                <label for="amount" class="form-label">Amount</label>
                <input type="number" class="form-control" id="amount" readonly value="300" name="pp_Amount">
            </div>
           
            <div class="mb-3">
                <label for="phone" class="form-label">JazzCash Phone Number</label>
                <input type="tel" class="form-control" id="phone" name="ppmpf_1">
            </div>
            <!-- Hidden input for the action -->
            <input type="hidden" name="action" value="jazzCashPost">
            <button type="submit" class="btn btn-primary">Submit</button>
            <!-- Button to go back to the previous page using browser's built-in functionality -->
            <button type="button" class="btn btn-secondary" onclick="history.go(-1)">Back</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>

</body>

</html>
