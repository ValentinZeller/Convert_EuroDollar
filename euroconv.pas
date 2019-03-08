unit euroconv;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TFConv }

  TFConv = class(TForm)
    BtnConv: TButton;
    BtnRAZ: TButton;
    BtnQuit: TButton;
    EdEuro: TEdit;
    EdDollar: TEdit;
    LbEuro: TLabel;
    LbDollar: TLabel;
    RadioOption: TRadioGroup;
    procedure BtnConvClick(Sender: TObject);
    procedure BtnQuitClick(Sender: TObject);
    procedure BtnRAZClick(Sender: TObject);
    procedure EdDollarClick(Sender: TObject);
    procedure EdEuroClick(Sender: TObject);
  private

  public

  end;
const taux = 1.1229;
var
  FConv: TFConv;

implementation

{$R *.lfm}

{ TFConv }

procedure TFConv.BtnConvClick(Sender: TObject);
begin
  if (RadioOption.ItemIndex = 0) then
  begin
     EdDollar.Text := floattostr(strtofloat(EdEuro.Text)*taux);
  end
  else
      if (RadioOption.ItemIndex = 1) then
      begin
          EdEuro.Text := floattostr(strtofloat(EdDollar.Text)/taux);
      end;
end;

procedure TFConv.BtnQuitClick(Sender: TObject);
begin
  if MessageDlg('Question', 'Voulez-vous quitter ?', mtConfirmation,
   [mbYes, mbNo, mbIgnore],0) = mrYes
  then Close;
end;

procedure TFConv.BtnRAZClick(Sender: TObject);
begin
  EdDollar.Text := '0,0';
  EdEuro.Text := '0,0';
  EdEuro.SetFocus;
  EdEuro.Hint:='0,0';
  EdEuro.ShowHint:=true;
end;

procedure TFConv.EdDollarClick(Sender: TObject);
begin
    RadioOption.ItemIndex := 1;
end;

procedure TFConv.EdEuroClick(Sender: TObject);
begin
  RadioOption.ItemIndex := 0;
end;

end.

