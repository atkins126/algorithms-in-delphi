unit Algorithms.View.Form.Main;

interface

uses
  Winapi.Windows, 
  Winapi.Messages, 
  System.SysUtils, 
  System.Variants, 
  System.Classes, 
  System.ImageList, 
  Vcl.ImgList,
  Vcl.Graphics,
  Vcl.Controls, 
  Vcl.Forms, 
  Vcl.Dialogs, 
  Vcl.Buttons, 
  Vcl.ExtCtrls,
  Algorithms.View.Form.ChildTemplate, 
  Algorithms.View.Styles.Colors,
  Algorithms.View.Form.SortingAlgorithms, Vcl.Imaging.jpeg;

type

  TFormMain = class(TForm)
    PnlSideMenu: TPanel;
    PnlMain: TPanel;
    BtnTrees: TSpeedButton;
    BtnGlyphs: TImageList;
    BtnSortingAlgorithms: TSpeedButton;
    PnlHeader: TPanel;
    ImgProfilePicture: TImage;
    procedure BtnSortingAlgorithmsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMouseEnter(Sender: TObject);
    procedure BtnMouseLeave(Sender: TObject);
    procedure BtnTreesClick(Sender: TObject);
  private
    FLastClickedButton: TSpeedButton;
    procedure ApplyStyle;
    procedure AdjustButtonsStyle(Sender: TSpeedButton);
    procedure SetUpPnlMain(AForm: TFormChildClass; Sender: TSpeedButton);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.AdjustButtonsStyle(Sender: TSpeedButton);
begin
  if Assigned(FLastClickedButton) then
    FLastClickedButton.OnMouseLeave(FLastClickedButton);
  Sender.OnMouseEnter(Sender);
  FLastClickedButton := Sender;
end;

procedure TFormMain.ApplyStyle;
begin
  PnlSideMenu.Color := COLOR_MENU_BACKGROUND;
  PnlMain.Color := COLOR_BACKGROUND;
  PnlHeader.Color := GUN_METAL;
  Self.Font.Color := COLOR_BACKGROUND;
end;

procedure TFormMain.BtnSortingAlgorithmsClick(Sender: TObject);
begin
  SetUpPnlMain(TFormSortingAlgorithms, TSpeedButton(Sender));
end;

procedure TFormMain.BtnTreesClick(Sender: TObject);
begin
  //SetUpPnlMain(TFormTrees, TSpeedButton(Sender));
  SetUpPnlMain(TFormChildTemplate, TSpeedButton(Sender));
end;

procedure TFormMain.BtnMouseEnter(Sender: TObject);
var
  Btn: TSpeedButton;
begin
  Btn := TSpeedButton(Sender);
  if not Btn.Down then
  begin
    Btn.Font.Color := COLOR_MENU_BACKGROUND;
    Btn.ImageIndex := Btn.SelectedImageIndex;
  end;
end;

procedure TFormMain.BtnMouseLeave(Sender: TObject);
var
  Btn: TSpeedButton;
begin
  Btn := TSpeedButton(Sender);
  if not Btn.Down then
  begin
    Btn.Font.Color := COLOR_BACKGROUND;
    Btn.ImageIndex := Btn.DisabledImageIndex;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  ApplyStyle;
end;

procedure TFormMain.SetUpPnlMain(AForm: TFormChildClass; Sender: TSpeedButton);
begin
  AForm.CreateInto(PnlMain);
  AdjustButtonsStyle(Sender);
end;

end.
