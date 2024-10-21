///codeunit 50105 CreateCustomer
//creating a customer using a code unit, having indirect permissions assigned
//{
////   Permissions = TableData "Cust. Ledger Entry" = rm;
////   TableNo = Customer;

//   trigger OnRun();
// begin
//      InsertEntry(Rec);
//    end;
//
//  procedure InsertEntry(var Cust: Record Customer)
//var
//   CustLedgerEntry: Record "Cust. Ledger Entry";
//  begin
// CustLedgerEntry.Init();
//       CustLedgerEntry."Entry No." := 1;
//     CustLedgerEntry."Customer No." := Cust."No.";
//   CustLedgerEntry."Posting Date" := WorkDate();
// CustLedgerEntry.Insert();
//    end;
//}