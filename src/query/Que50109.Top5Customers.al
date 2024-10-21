namespace APIProject.APIProject;

using Microsoft.Sales.Customer;

query 50109 "Top 5 Customers"
{
    Caption = 'Top 5 Customers';
    QueryType = Normal;
    TopNumberOfRows = 5;
    QueryCategory = 'Customer List';
    OrderBy = descending(SalesLCY);

    elements
    {
        dataitem(TopCustomersBySalesBuffer; "Top Customers By Sales Buffer")
        {
            column(CustomerName; CustomerName)
            {
            }
            column(CustomerNo; CustomerNo)
            {
            }
            column(SalesLCY; SalesLCY)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
