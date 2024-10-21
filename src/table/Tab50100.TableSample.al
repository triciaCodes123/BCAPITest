table 50100 TableSample
{
    Caption = 'TableSample';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Patricia; Code[20])
        {
            Caption = 'Patricia';
            NotBlank = true;
        }
        field(2; Joan; Option)
        {
            Caption = 'Joan';

            OptionCaption = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(3; Priscilla; Decimal)
        {
            Caption = 'Priscilla';
            //AutoFormatExpression = Text;
            DecimalPlaces = 2 : 5;
            MinValue = 0;
            InitValue = 0.01;


        }
        field(4; Diana; Text[100])
        {
            Caption = 'Diana';
            trigger OnValidate()
            begin
                CheckDecimalPlacesFormat("Diana");
            end;
        }
        field(5; Kepler; Decimal)
        {
            Caption = 'Kepler';
            DecimalPlaces = 2 : 5;
            MinValue = 0;
            InitValue = 0.01;
            NotBlank = true;

        }
    }
    keys
    {
        key(PK; Patricia)
        {
            Clustered = true;
        }
    }



    procedure CheckDecimalPlacesFormat(var DecimalPlaces: Text[5])
    var
        OK: Boolean;
        ColonPlace: Integer;
        DecimalPlacesPart1: Integer;
        DecimalPlacesPart2: Integer;
        Check: Text[5];
    begin
        OK := true;
        ColonPlace := StrPos(DecimalPlaces, ':');

        if ColonPlace = 0 then begin
            if not Evaluate(DecimalPlacesPart1, DecimalPlaces) then
                OK := false;
            if (DecimalPlacesPart1 < 0) or (DecimalPlacesPart1 > 9) then
                OK := false;
        end else begin
            Check := CopyStr(DecimalPlaces, 1, ColonPlace - 1);
            if Check = '' then
                OK := false;
            if not Evaluate(DecimalPlacesPart1, Check) then
                OK := false;
            Check := CopyStr(DecimalPlaces, ColonPlace + 1, StrLen(DecimalPlaces));
            if Check = '' then
                OK := false;
            if not Evaluate(DecimalPlacesPart2, Check) then
                OK := false;
            if DecimalPlacesPart1 > DecimalPlacesPart2 then
                OK := false;
            if (DecimalPlacesPart1 < 0) or (DecimalPlacesPart1 > 9) then
                OK := false;
            if (DecimalPlacesPart2 < 0) or (DecimalPlacesPart2 > 9) then
                OK := false;
        end;

        if not OK then
            Error(
              Text016 +
              Text017);

        if ColonPlace = 0 then
            DecimalPlaces := Format(DecimalPlacesPart1)
        else
            DecimalPlaces := StrSubstNo('%1:%2', DecimalPlacesPart1, DecimalPlacesPart2);
    end;


    var
        Text016: Label 'Enter one number or two numbers separated by a colon. ';
        Text017: Label 'The online Help for this field describes how you can fill in the field.';




}
