unit Venda.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Venda.Controller.Interfaces;

type
  TVendaViewPrincipal = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    DBGrid2: TDBGrid;
    Panel8: TPanel;
    Panel9: TPanel;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    ToolBar2: TToolBar;
    BitBtn2: TBitBtn;
    DBGrid3: TDBGrid;
    Panel10: TPanel;
    EdCodProduto: TEdit;
    EdNomeProduto: TEdit;
    EdQuantidade: TEdit;
    EdValorUnit: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Panel11: TPanel;
    EdCodCliente: TEdit;
    EdNomeCliente: TEdit;
    EdCidadeCliente: TEdit;
    EdUFCliente: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdSubTotal: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    EdPedido: TEdit;
    Label12: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdCodClienteExit(Sender: TObject);
    procedure EdCodProdutoExit(Sender: TObject);
    procedure EdQuantidadeExit(Sender: TObject);
    procedure EdValorUnitExit(Sender: TObject);
    procedure DBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VendaViewPrincipal: TVendaViewPrincipal;

implementation

uses
  Venda.Controller.PedidoVenda, Venda.Model.Dados, Vcl.Dialogs;

{$R *.dfm}

procedure TVendaViewPrincipal.BitBtn1Click(Sender: TObject);
begin
  if (EdPedido.Text = '0') then
    begin
      raise Exception.Create('Não foi inserido nenhum item');
    end;
  TControllerPedidoVenda.New.SalvarPedido(StrToInt(EdPedido.Text));
end;

procedure TVendaViewPrincipal.BitBtn2Click(Sender: TObject);
begin
  if (Length(Trim(EdCodCliente.Text)) = 0) then
    begin
      EdCodCliente.SetFocus;
      raise Exception.Create('Código do Cliente não preenchido');
    end;

  if (Length(Trim(EdCodProduto.Text)) = 0) then
    begin
      EdCodProduto.SetFocus;
      raise Exception.Create('Código do Produto não preenchido');
    end;

  if (Length(Trim(EdQuantidade.Text)) = 0) then
    begin
      EdQuantidade.SetFocus;
      raise Exception.Create('Quantidade não preenchido');
    end;

  if (Length(Trim(EdValorUnit.Text)) = 0) then
    begin
      EdValorUnit.SetFocus;
      raise Exception.Create('Valor Unitário não preenchido');
    end;
  if (EdPedido.Text = '0') then
    EdPedido.Text := IntToStr(TControllerPedidoVenda.New.CriarIdPedidoTemp);
  TControllerPedidoVenda.New.CriarPedidoTemp(StrToInt(EdPedido.Text), StrToInt(EdCodCliente.Text),  StrToInt(EdCodProduto.Text), StrToFloat(EdQuantidade.Text), StrToFloat(EdValorUnit.Text));
  EdCodProduto.Clear;
  EdNomeProduto.Clear;
  EdQuantidade.Clear;
  EdValorUnit.Clear;
  EdSubTotal.Clear;
  EdCodCliente.Enabled := False;
  EdCodProduto.Enabled := True;
  Label3.Caption := 'Valor total do pedido: ' + FormatFloat('###,###,###,##0.00', (TControllerPedidoVenda.New.ConsultarItens(StrToInt(EdPedido.Text))));
  EdCodProduto.SetFocus;
end;

procedure TVendaViewPrincipal.BitBtn3Click(Sender: TObject);
var
  ClickedOK :Boolean;
  Pedido :String;
begin
   ClickedOK := InputQuery('Pedidos de Venda','Digite o N.º Pedido', Pedido);
   If (ClickedOK = True) then
     begin
        TControllerPedidoVenda.New.PesquisarPedido(StrToInt(Pedido));
     end;
   if VendaModelDados.QueryConsulta.RecordCount = 0 then
   begin
      ShowMessage('Pedido não encontrado');
   end else begin
      HabCampos();
      EdPedido.Text := VendaModelDados.QueryConsulta.FieldByName('NUM_PED').AsString;
      EdCodCliente.Text := VendaModelDados.QueryConsulta.FieldByName('ID_CLIENTE').AsString;
      EdNomeCliente.Text := VendaModelDados.QueryConsulta.FieldByName('NOME_CLIENTE').AsString;
      EdCidadeCliente.Text := VendaModelDados.QueryConsulta.FieldByName('CIDADE').AsString;
      EdUFCliente.Text := VendaModelDados.QueryConsulta.FieldByName('UF').AsString;
   end;
end;

procedure HabCampos();
begin
  EdCodCliente.Enabled := True;
  EdCodProduto.Enabled := True;
  EdQuantidade.Enabled := True;
  EdValorUnit.Enabled := True;
end;

procedure DesCampos();
begin
  EdCodCliente.Enabled := False;
  EdCodProduto.Enabled := False;
  EdQuantidade.Enabled := False;
  EdValorUnit.Enabled := False;
end;

procedure TVendaViewPrincipal.BitBtn4Click(Sender: TObject);
begin
  TControllerPedidoVenda.New.CancelarPedido(StrToInt(EdPedido.Text));
end;

procedure TVendaViewPrincipal.BitBtn5Click(Sender: TObject);
begin
  EdCodCliente.Enabled := True;
  EdCodCliente.SetFocus;
  EdPedido.Text := '0';
end;

procedure TVendaViewPrincipal.BitBtn6Click(Sender: TObject);
var
  ClickedOK :Boolean;
  Pedido :String;
begin
   ClickedOK := InputQuery('Pedidos de Venda','Digite o Codigo do Pedido', Pedido);
   If (ClickedOK = True) then
     begin
        if MessageDlg('Deseja excluir o pedido ?',mtConfirmation,
            [mbYes, mbNo], 0) = mrYes then
           TControllerPedidoVenda.New.DeletarPedido(StrToInt(Pedido));
     end;
end;

procedure TVendaViewPrincipal.DBGrid3KeyPress(Sender: TObject; var Key: Char);
begin
  If (Key = #13) then
    begin
      TControllerPedidoVenda.New.EditarProdutoTemp(StrToInt(EdPedido.Text), VendaModelDados.QItensPedidosTemp.FieldByName('SEQ_ITEM').AsInteger, StrToFloat(EdQuantidade.Text),StrToFloat(EdValorUnit.Text));
      TControllerPedidoVenda.New.ConsultarItens(StrToInt(EdPedido.Text));
      EdCodProduto.Enabled := False;
      EdQuantidade.SetFocus;
    end;
  if (Key = #46) then
    if MessageDlg('Deseja excluir o item selecionado ?',mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
    begin
      TControllerPedidoVenda.New.DeletarProdutoTemp(StrToInt(EdPedido.Text), VendaModelDados.QItensPedidosTemp.FieldByName('SEQ_ITEM').AsInteger);
      TControllerPedidoVenda.New.ConsultarItens(StrToInt(EdPedido.Text));
      ShowMessage('Item Excluído com sucesso');
    end;

end;

procedure TVendaViewPrincipal.EdCodClienteExit(Sender: TObject);
begin
  if Length(Trim(EdCodCliente.Text)) <> 0 then
    begin
      TControllerPedidoVenda.New.ValidarCliente(StrToInt(EdCodCliente.Text));
      if VendaModelDados.QClientes.RecordCount = 0 then
        begin
          ShowMessage('Cliente não encontrado, verifique');
          EdCodCliente.Clear;
          EdNomeCliente.Clear;
          EdCidadeCliente.Clear;
          EdUfCliente.Clear;
        end else begin
          EdNomeCliente.Text := VendaModelDados.QClientes.FieldByName('NOME_CLIENTE').AsString;
          EdCidadeCliente.Text := VendaModelDados.QClientes.FieldByName('CIDADE').AsString;
          EdUfCliente.Text := VendaModelDados.QClientes.FieldByName('UF').AsString;
        end;
    end;
end;

procedure TVendaViewPrincipal.EdCodProdutoExit(Sender: TObject);
begin
  if Length(Trim(EdCodProduto.Text)) <> 0 then
    begin
      TControllerPedidoVenda.New.ValidarProduto(StrToInt(EdCodProduto.Text));
      if VendaModelDados.QClientes.RecordCount = 0 then
        begin
          ShowMessage('Produto não encontrado, verifique');
          EdCodProduto.Clear;
          EdNomeProduto.Clear;
          EdValorUnit.Clear;
          EdQuantidade.Clear;
          EdSubTotal.Clear;
        end else begin
          EdNomeProduto.Text := VendaModelDados.QProdutos.FieldByName('nome_produto').AsString;
          EdValorUnit.Text := VendaModelDados.QProdutos.FieldByName('preco_venda').AsString;
        end;
    end;
end;

procedure TVendaViewPrincipal.EdQuantidadeExit(Sender: TObject);
begin
  if Length(Trim(EdQuantidade.Text)) <> 0 then
    begin
      if StrToFloat(EdQuantidade.Text) <= 0 then
        EdQuantidade.Text := '1';

      EdSubTotal.Text := FormatFloat('###,###,###,##0.00', (StrToFloat(EdValorUnit.Text) * StrToFloat(EdQuantidade.Text)));
    end;
end;

procedure TVendaViewPrincipal.EdValorUnitExit(Sender: TObject);
begin
  if Length(Trim(EdQuantidade.Text)) <> 0 then
    begin
        if StrToFloat(EdValorUnit.Text) <= 0 then
           EdValorUnit.Text := VendaModelDados.QClientes.FieldByName('preco_venda').AsString;

        EdSubTotal.Text := FormatFloat('###,###,###,##0.00', (StrToFloat(EdValorUnit.Text) * StrToFloat(EdQuantidade.Text)));
    end;
end;

end.
