<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bank Management System</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<%
    	String name = request.getParameter("customer_Name");
    	String address = request.getParameter("customer_Address");
    	String phone = request.getParameter("customer_Phone");
    	String balance = request.getParameter("initial_Deposit");

    	ArrayList<String[]> customers = (ArrayList<String[]>) session.getAttribute("customers");
    	if (customers == null) {
        	customers = new ArrayList<>();
    	}
    	customers.add(new String[]{name, address, phone, balance});
    	session.setAttribute("customers", customers);
	%>
	
  <!-- Navbar -->

  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
      <a class="navbar-brand" href="#">Bank Management System</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#addAccount">Add Account</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#transactions">Transactions</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#balance">Check Balance</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#displayAccounts">All Accounts</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <!-- Alert Box -->

  <div class="alert alert-success alert-dismissible fade show" role="alert">
    Account created successfully!!
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>

  <!-- Add Customer Section -->

  <div class="container mt-5">
    <section id="addAccount">
      <h2>Add Bank Account</h2>
      <form action="newAccount.jsp" method="post">
        <div class="mb-3">
          <label for="customerName" class="form-label">Customer Name</label>
          <input type="text" class="form-control" id="customerName" placeholder="Enter Customer Name" name="customer_Name" required>
        </div>
        <div class="mb-3">
          <label for="customerAddress" class="form-label">Customer Address</label>
          <input type="text" class="form-control" id="customerAddress" placeholder="Enter Customer Address" name="customer_Address" required>
        </div>
        <div class="mb-3">
          <label for="customerPhone" class="form-label">Customer Phone Number</label>
          <input type="tel" class="form-control" id="customerPhone" placeholder="Enter Customer Phone Number" name="customer_Phone" required>
        </div>
        <div class="mb-3">
          <label for="customerPhone" class="form-label">Initial Deposit Amount</label>
          <input type="tel" class="form-control" id="initialDeposit" placeholder="Enter Initial Deposit Amount" name="initial_Deposit" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </section>

    <hr>

    <!-- Transactions Section -->

    <section id="transactions">
      <h2>Transactions</h2>
      <form action="addTransaction.jsp">
        <div class="mb-3">
          <label for="accountNumber" class="form-label">Account Number</label>
          <input type="text" class="form-control" id="accountNumber" placeholder="Enter Account Number" name="account_Number" required>
        </div>
        <div class="mb-3">
          <label for="transactionType" class="form-label">Transaction Type</label>
          <select class="form-select" id="transactionType">
            <option selected>Select Transaction Type</option>
            <option value="deposit">Deposit</option>
            <option value="withdrawal">Withdrawal</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="amount" class="form-label">Amount</label>
          <input type="number" class="form-control" id="amount" placeholder="Enter Amount" name="transaction_Amount" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </section>

    <hr>

    <!-- Check Balance Section -->

    <section id="balance">
      <h2>Check Balance</h2>
      <form action="checkBalance.jsp">
        <div class="mb-3">
          <label for="checkAccountNumber" class="form-label">Account Number</label>
          <input type="text" class="form-control" id="checkAccountNumber" placeholder="Enter Account Number" name="check_Account" required>
        </div>
        <button type="submit" class="btn btn-primary">Check Balance</button>
      </form>
    </section>

    <hr>

    <!-- Display Accounts Section -->

    <section id="displayAccounts">
      <h2>All Bank Accounts</h2>
      <% 
        ArrayList<String[]> customer = (ArrayList<String[]>) session.getAttribute("customers");
        if (customer != null) {
            Iterator<String[]> iterator = customer.iterator();
            while (iterator.hasNext()) {
                String[] customer1= iterator.next();
                int len = customer1.length;
                int index = customer.indexOf(customer1);
      %>
      <p><strong>Account Number:</strong> <%= index%></p>
      <p><strong>Name:</strong> <%= customer1[0] %></p>
      <p><strong>Address:</strong> <%= customer1[1] %></p>
      <p><strong>Phone Number:</strong> <%= customer1[2] %></p>
    <hr>
     <% 
            }
        } 
     %>
    </section>
  </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>