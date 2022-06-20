unit Algorithms.View.Form.SortingAlgorithms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Algorithms.View.Form.ChildTemplate,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormSortingAlgorithms = class(TFormChildTemplate)
    PnlOptions: TPanel;
    BtnInsertionSort: TSpeedButton;
    Edit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSortingAlgorithms: TFormSortingAlgorithms;

implementation

{$R *.dfm}

end.
