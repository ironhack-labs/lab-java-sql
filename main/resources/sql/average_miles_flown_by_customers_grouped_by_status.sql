SELECT CustomerStatus, AVG(TotalCustomerMileage) AS AverageMilesFlown
FROM Customers
JOIN CustomerFlights ON Customers.CustomerID = CustomerFlights.CustomerID
GROUP BY CustomerStatus;
