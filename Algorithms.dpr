program Algorithms;

uses
  Vcl.Forms,
  Algorithms.View.Form.Main in 'src\View\Algorithms.View.Form.Main.pas' {FormMain},
  Algorithms.View.Form.ChildTemplate in 'src\View\Algorithms.View.Form.ChildTemplate.pas' {FormChildTemplate},
  Algorithms.View.Styles.Colors in 'src\View\Styles\Algorithms.View.Styles.Colors.pas',
  Algorithms.View.Form.SortingAlgorithms in 'src\View\Algorithms.View.Form.SortingAlgorithms.pas' {FormSortingAlgorithms};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
