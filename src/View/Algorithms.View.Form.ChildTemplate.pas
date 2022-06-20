unit Algorithms.View.Form.ChildTemplate;

interface

uses
  Winapi.Windows, 
  Winapi.Messages, 
  System.SysUtils, 
  System.Variants, 
  System.Classes, 
  Vcl.Graphics,
  Vcl.Controls, 
  Vcl.Forms, 
  Vcl.Dialogs, 
  Vcl.StdCtrls, 
  Vcl.ExtCtrls;

type
  TFormChildTemplate = class(TForm)
  public
    class procedure CreateInto(Parent: TPanel);
  end;

  TFormChildClass = class of TFormChildTemplate;

var
  FormChildTemplate: TFormChildTemplate;

implementation

{$R *.dfm}

{ TFormChildTemplate }

class procedure TFormChildTemplate.CreateInto(Parent: TPanel);
begin
  if Assigned(FormChildTemplate) then
    FormChildTemplate.Free;
  FormChildTemplate := Self.Create(Parent);
  FormChildTemplate.Parent := Parent;
  FormChildTemplate.Color := Parent.Color;
  FormChildTemplate.BorderStyle := bsNone;
  FormChildTemplate.Visible := True;
end;

end.
