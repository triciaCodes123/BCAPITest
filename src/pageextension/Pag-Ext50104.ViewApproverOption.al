namespace APIProject.APIProject;

using Microsoft.Inventory.Item;

pageextension 50104 "View Approver Option " extends "Item Card"  //View Approver Option/ BlockNonSItems
{
    layout
    {

        addafter(Description)
        {
            field(ItemApprover; Rec."Approver for Purchase") { } //MultiLine=true;}
        }
    }
    procedure BlockNonSItems()
    var

        Item: Record Item;

    begin

        // Reset the Item record to clear any previous filters.

        Item.Reset();

        // Set the filter to exclude items that start with 'S'.

        Item.SetFilter("No.", '<>%1*', 'S');

        // Find each item that matches the filter.

        if Item.FindSet() then
            repeat

                // Set the Blocked field to true to block the item.

                Item.Blocked := true;

                // Save the changes to the Item record.

                Item.Modify();

            until Item.Next() = 0; // Continue until no more items are found.

    end;
}


