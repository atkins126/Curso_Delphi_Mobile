unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    edtEmail: TEdit;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    memoResp: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    edtNode: TEdit;
    Label6: TLabel;
    edtKey: TEdit;
    Button3: TButton;
    Label7: TLabel;
    edtDomain: TEdit;
    edtToken: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  Firebase.Interfaces,
  Firebase.Auth,
  Firebase.Database,
  System.JSON,
  System.Net.HttpClient,
  System.Generics.Collections,
  System.JSON.Types,
  System.JSON.Writers;

{$R *.dfm}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
  Auth: IFirebaseAuth;
  AResponse: IFirebaseResponse;
  JSONResp: TJSONValue;
  Obj: TJSONObject;
begin
  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(edtKey.Text);
  AResponse := Auth.SignInWithEmailAndPassword(edtEmail.Text, edtPassword.Text);
  JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
  begin
    if Assigned(JSONResp) then
    begin
      JSONResp.Free;
    end;
    Exit;
  end;
  Obj := JSONResp as TJSONObject;
  Obj.Values['idToken'].Value;
  edtToken.Text := Obj.Values['idToken'].Value;
  //memoToken.Lines.Add(JSONResp.ToString);
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
var
  ADatabase: TFirebaseDatabase;
  AResponse: IFirebaseResponse;
  AParams: TDictionary<string, string>;
  JSONResp: TJSONValue;

begin
  ADatabase := TFirebaseDatabase.Create;
  ADatabase.SetBaseURI(edtDomain.Text);
  ADatabase.SetToken(edtToken.Text);
  memoResp.Lines.Clear;

  AParams := TDictionary<string, string>.Create;
  try
    //AParams.Add('orderBy', '"$key"');
    //AParams.Add('orderBy', '"cod"');
    //AParams.Add('limitToLast', '2');
    //AParams.Add('equalTo', '2');
    //AParams.Add('startAt', '"2"');
    //AParams.Add('endAt', '"4"');

    AResponse := ADatabase.Get([edtNode.Text + '.json'], AParams);
    JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);

    memoResp.Lines.Add(AResponse.ContentAsString);

    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
      begin
        JSONResp.Free;
      end;
      Exit;
    end;
    //memoResp.Lines.Add(JSONResp.ToString);
  finally
    AParams.Free;
    ADatabase.Free;
  end;
end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
var
    ADatabase: TFirebaseDatabase;
    AResponse: IFirebaseResponse;
    JSONReq: TJSONObject;
    JSONResp: TJSONValue;
    Writer: TJsonTextWriter;
    StringWriter: TStringWriter;
begin

  StringWriter := TStringWriter.Create();
  Writer := TJsonTextWriter.Create(StringWriter);
  Writer.Formatting := TJsonFormatting.None;

  //     {"6": {"cod": 6, "descricao": "Fone ouvido"} }

  Writer.WriteStartObject;
  Writer.WritePropertyName('6');

    Writer.WriteStartObject;
    Writer.WritePropertyName('cod');
    Writer.WriteValue('6');
    Writer.WritePropertyName('descricao');
    Writer.WriteValue('Fone de ouvido');
    Writer.WriteEndObject;

  Writer.WriteEndObject;



  JSONReq := TJSONObject.ParseJSONValue(StringWriter.ToString) as TJSONObject;

  memoResp.Text := StringWriter.ToString;


  ADatabase := TFirebaseDatabase.Create;
  ADatabase.SetBaseURI(edtDomain.Text);
  ADatabase.SetToken(edtToken.Text);
  try
    //AResponse := ADatabase.Post([edtNode.Text + '.json'], JSONReq);
    //AResponse := ADatabase.Put([edtNode.Text + '.json'], JSONReq);
    //AResponse := ADatabase.Patch([edtNode.Text + '.json'], JSONReq);
    AResponse := ADatabase.Delete([edtNode.Text + '.json']);


    JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
      begin
        JSONResp.Free;
      end;
      Exit;
    end;
    memoResp.Text := JSONResp.ToString;
  finally
    ADatabase.Free;
  end;


end;

end.
