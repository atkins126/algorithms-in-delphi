program Algorithms;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uMain in 'uMain.pas',
  uRunnableInterface in 'uRunnableInterface.pas',
  uInsertionSortRoutine in 'Routines\uInsertionSortRoutine.pas',
  uOptions in 'uOptions.pas';

var
  Application: IRunnable;

begin
  try
    Application := TApplication.Create;
    Application.Run;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
