unit uMain;

interface

uses
  SysUtils, uRunnableInterface, uOptions, Velthuis.Console;

type

  TApplication = class(TInterfacedObject, IRunnable)
  private
    function GetHeader: string;
    function GetApplicationDescription: string;
    function DisplayOptions: string;
    function ValidateOption(AOption: string): TOptions;
  public
    procedure Run;
  end;

implementation

{ TApplication }

function TApplication.DisplayOptions: string;
begin
  Result := 'Choose your option: '#13#10 +
            '1. Insertion Sort '#13#10
end;

function TApplication.GetApplicationDescription: string;
begin
  Result := GetHeader + #13#10 +
            'This is my application of the algorithms presented ' +
            'on the book ' + QuotedStr('Introduction to Algorithms - Third Edition') +
            ' by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein.' +
            #13#10 + GetHeader + #13#10;
end;

function TApplication.GetHeader: string;
begin
  Result := '================================================================='
end;

procedure TApplication.Run;
var
  Input: String;
  Option: TOptions;
  NextEvent: IRunnable;
begin
    WriteLn(GetApplicationDescription);
  repeat
    WriteLn(DisplayOptions);
    ReadLn(Input);
    Option := ValidateOption(Input);
  //  NextEvent := RunnableFactory.Create(Option);
    NextEvent.Run;
    ClrScr;
  until (Option <> toExit);
end;

function TApplication.ValidateOption(AOption: string): TOptions;
var
  OptionValue: Integer;
begin
  try
    OptionValue := StrToInt(AOption);
    if TOptions(OptionValue) in [toInsertionSort..toExit] then
      Result := TOptions(OptionValue)
    else
      raise Exception.Create('Option outside scope');
  except
    on E: Exception do
      Result := toInvalid;
  end;
end;

end.
