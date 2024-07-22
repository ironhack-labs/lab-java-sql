SELECT CustomerStatus, MAX(TotalCustomerMileage) AS MaximumMilesFlown
FROM Customers
JOIN CustomerFlights ON Customers.CustomerID = CustomerFlights.CustomerID
GROUP BY CustomerStatus;
