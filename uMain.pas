unit uMain;

interface

uses
  SysUtils, uRunnableInterface, uOptions;

type

  TApplication = class(TInterfacedObject, IRunnable)
  private
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
  Result := 'This is my application of the algorithms presented ' +
            'on the book ' + QuotedStr('Introduction to Algorithms - Third Edition') +
            ' by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein.'
end;

procedure TApplication.Run;
var
  Option: String;
begin
  WriteLn(GetApplicationDescription);
  WriteLn(DisplayOptions);
  ReadLn(Option);
  //RunnableFactory.Create(ValidateOption(Option));
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
