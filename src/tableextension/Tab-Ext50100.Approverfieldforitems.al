namespace APIProject.APIProject;

using Microsoft.Inventory.Item;

tableextension 50100 "Approver field for items" extends Item
{
    fields
    {
        field(50100; "Approver for Purchase"; Option)
        {
            Caption = 'Approver for Purchase';

            OptionMembers = Hotel,Restaurant,Store;
            DataClassification = ToBeClassified;
        }
        field(50102; "Purchase"; Text[200])
        {
            Caption = 'Purchase';
           // ExtendedDatatype = RichContent;


            //multiline= true;

            DataClassification = ToBeClassified;
        }
        //field(50103; "Purche";Code, Date,)

        //var
            //Dae: datetime;
            //wpo: Date;
}
}
