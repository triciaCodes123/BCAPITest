namespace APIProject.APIProject;

using Microsoft.Sales.Customer;

page 50105 APICustomer
{
    APIGroup = 'CustomersAPIs';
    APIPublisher = 'Patricia';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiCustomer';
    DelayedInsert = true;
    EntityName = 'Customer';
    EntitySetName = 'Customers';
    PageType = API;
    SourceTable = customer;
    //InsertAllowed = false;
    DataAccessIntent = ReadOnly;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
            }
        }
    }
}
