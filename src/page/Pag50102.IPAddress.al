namespace APIProject.APIProject;
using System.Utilities;
using Microsoft.Sales.Reports;
//API to find out my IP address using the link 'https://api.ipify.org?format=json' from api.ipify.org
page 50102 "IP Address"
{
    ApplicationArea = All;
    Caption = 'IP Address';
    PageType = Card;
    Editable = false;

    layout
    {
        area(Content)
        {    //Fiel on page that calls procedure
            field(IP; GetIP()) { Caption = 'Get IP Address OF BC Server'; ApplicationArea = ALL; }
            group(General)
            {
                Caption = 'General';

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Download)
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()
                begin
                    "Temp Blob Codeunit File Management"();
                end;
            }
        }
    }
    procedure GetIP(): Text
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        J: JsonObject;
        ResponseText: Text;
        rope: JsonArray;
    begin
        if Client.Get('https://api.ipify.org?format=json', Response) then
            if Response.IsSuccessStatusCode() THEN begin
                Response.Content().ReadAs(ResponseText);
                J.ReadFrom(ResponseText);

                exit(GetJsonTextField(J, 'ip'));
            end;

    end;

    procedure GetJsonTextField(O: JsonObject; Member: Text): Text
    var
        Result: JsonToken;
    begin
        if O.Get(Member, Result) then
            exit(Result.AsValue().AsText())
    end;


    local procedure "Temp Blob Codeunit File Management"()
    var
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;//Write data to the blob
        InStream: InStream;//Read data from the blob
        FileName: Text;
    begin
        FileName := 'Customers.xlsx';
        TempBlob.CreateOutStream(OutStream);
        Report.SaveAs(Report::"Customer - List", '', ReportFormat::Excel, OutStream);
        TempBlob.CreateInStream(InStream);

        DownloadFromStream(InStream, '', '', '', FileName);
        //OutStream
        //InStream  
    end;

}


