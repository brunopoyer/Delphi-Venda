unit Venda.Controller.PedidoVenda;

interface

uses
  Venda.Controller.Interfaces, Venda.Model.Dados;

 type
    TControllerPedidoVenda = class(TInterfacedObject, iPedidoVenda)
    private
    public
       constructor Create;
       destructor Destroy; override;
       class function New : iPedidoVenda;
       function CriarPedidoTemp(Id, CodigoCliente, CodigoProduto :Integer; ValorUnit, Quantidade :Real) : iPedidoVenda;
       function SalvarPedido(ID:Integer) : iPedidoVenda;
       function ValidarPedido : iPedidoVenda;
       function CriarIdPedidoTemp : Integer;
       function CancelarPedido(Pedido :Integer) : iPedidoVenda;
       function DeletarPedido(Pedido :Integer) : iPedidoVenda;
       function PesquisarPedido(Pedido :Integer) : iPedidoVenda;
       procedure ValidarCliente(CodCliente :Integer);
       function ConsultarItens(ID :Integer) :Real;
       procedure ValidarProduto(CodProduto :Integer);
       function EditarProdutoTemp(Id, SeqItem :Integer; QtdeItem, ValorItem :Real) : Boolean;
       function DeletarProdutoTemp(Id, SeqItem :Integer) : Boolean;
  end;
implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TControllerPedidoVenda }

constructor TControllerPedidoVenda.Create;
begin

end;

function TControllerPedidoVenda.ConsultarItens(ID:Integer) :Real;
begin
        With VendaModelDados.QItensPedidosTemp do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT I.SEQ_ITEM, I.ID AS NUM_PED, I.ID_PRODUTO, I.QTDE_ITEM, I.VALOR_UNIT,');
            Sql.Add('I.VALOR_SUBTOTAL AS VALOR_TOTAL, R.NOME_PRODUTO');
            Sql.Add('FROM PEDIDOS_TEMP I');
            Sql.Add('INNER JOIN PRODUTOS R');
            Sql.Add('ON I.ID_PRODUTO = R.ID');
            Sql.Add('WHERE I.ID =:ID');
            ParamByName('ID').AsInteger := ID;
            Open;
          end;
        With VendaModelDados.QueryConsulta do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT SUM(VALOR_SUBTOTAL) AS VALOR_TOTAL');
            Sql.Add('FROM PEDIDOS_TEMP I');
            Sql.Add('WHERE I.ID =:ID');
            Sql.Add('GROUP BY I.ID');
            ParamByName('ID').AsInteger := ID;
            Open;
          end;
        Result := VendaModelDados.QueryConsulta.FieldbyName('VALOR_TOTAL').AsFloat;
end;

function TControllerPedidoVenda.EditarProdutoTemp(Id, SeqItem :Integer; QtdeItem, ValorItem :Real) : Boolean;
begin
  With VendaModelDados.QueryTransition do
    begin
      Close;
      Sql.Clear;
      Sql.Add('UPDATE PEDIDOS_TEMP');
      Sql.Add('SET QTDE_ITEM=:NEW_QTDE_ITEM,');
      Sql.Add('VALOR_UNIT=:NEW_VALOR_UNIT,');
      Sql.Add('VALOR_SUBTOTAL=:VALOR_SUBTOTAL');
      Sql.Add('WHERE ID =:ID');
      Sql.Add('AND SEQ_ITEM=:SEQ_ITEM');
      ParamByName('ID').AsInteger := ID;
      ParamByName('SEQ_ITEM').AsInteger := SeqItem;
      ParamByName('NEW_QTDE_ITEM').AsFloat := QtdeItem;
      ParamByName('NEW_VALOR_UNIT').AsFloat := ValorItem;
      ParamByName('VALOR_SUBTOTAL').AsFloat := QtdeItem * ValorItem;
      ExecSql;
    end;
  Result := True;
end;

function TControllerPedidoVenda.DeletarProdutoTemp(Id, SeqItem :Integer) : Boolean;
begin
  With VendaModelDados.QueryTransition do
    begin
      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM PEDIDOS_TEMP');
      Sql.Add('WHERE ID =:ID');
      Sql.Add('AND SEQ_ITEM=:SEQ_ITEM');
      ParamByName('ID').AsInteger := ID;
      ParamByName('SEQ_ITEM').AsInteger := SeqItem;
      ExecSql;
    end;
  Result := True;
end;

procedure TControllerPedidoVenda.ValidarCliente(CodCliente :Integer);
begin
        With VendaModelDados.QClientes do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * from CLIENTES');
            Sql.Add('WHERE ID =:COD_CLIENTE');
            ParamByName('COD_CLIENTE').AsInteger := CodCliente;
            Open;
          end;
end;

procedure TControllerPedidoVenda.ValidarProduto(CodProduto :Integer);
begin
        With VendaModelDados.QProdutos do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * from PRODUTOS');
            Sql.Add('WHERE ID =:COD_PRODUTO');
            ParamByName('COD_PRODUTO').AsInteger := CodProduto;
            Open;
          end;
end;

function TControllerPedidoVenda.CriarIdPedidoTemp: Integer;
var
  ID :Integer;
begin
        With VendaModelDados.QueryConsulta do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT ID from PEDIDOS_TEMP');
            Sql.Add('ORDER BY ID desc');
            Open;
          end;
        ID := VendaModelDados.QueryConsulta.FieldByName('ID').AsInteger + 1;
      Result := ID;
end;

function TControllerPedidoVenda.CriarPedidoTemp(Id, CodigoCliente, CodigoProduto :Integer; ValorUnit, Quantidade :Real) : iPedidoVenda;
begin

  With VendaModelDados.QueryConsulta do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT SEQ_ITEM from PEDIDOS_TEMP');
      Sql.Add('WHERE ID=:ID');
      Sql.Add('ORDER BY SEQ_ITEM DESC');
      ParamByName('ID').AsInteger := ID;
      Open;
    end;
  With VendaModelDados.QueryTransition do
    begin
      Close;
      Sql.Clear;
      Sql.Add('INSERT INTO PEDIDOS_TEMP (ID, SEQ_ITEM, ID_CLIENTE, ID_PRODUTO, QTDE_ITEM, VALOR_UNIT, VALOR_SUBTOTAL)');
      Sql.Add('VALUES (:ID, :SEQ_ITEM, :ID_CLIENTE, :ID_PRODUTO, :QTDE_ITEM, :VALOR_UNIT, :VALOR_SUBTOTAL)');
      ParamByName('ID').AsInteger := ID;
      ParamByName('SEQ_ITEM').AsInteger := VendaModelDados.QueryConsulta.FieldByName('SEQ_ITEM').AsInteger +1;
      ParamByName('ID_CLIENTE').AsInteger := CodigoCliente;
      ParamByName('ID_PRODUTO').AsInteger := CodigoProduto;
      ParamByName('QTDE_ITEM').AsFloat := Quantidade;
      ParamByName('VALOR_UNIT').AsFloat := ValorUnit;
      ParamByName('VALOR_SUBTOTAL').AsFloat := Quantidade * ValorUnit;
      ExecSql;
    end;
end;

function TControllerPedidoVenda.SalvarPedido(ID :Integer) : iPedidoVenda;
Var
  NumPed :Integer;
begin
  With VendaModelDados.QueryConsulta do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT SUM(VALOR_SUBTOTAL) AS TOTAL_PED, ID_CLIENTE FROM PEDIDOS_TEMP');
      Sql.Add('WHERE ID=:ID');
      Sql.Add('GROUP BY ID_CLIENTE');
      ParamByName('ID').AsInteger := ID;
      Open;
    end;
  if VendaModelDados.QueryConsulta.RecordCount = 0 then
    begin

    end else begin
      With VendaModelDados.QueryTransition do
        begin
          Close;
          Sql.Clear;
          Sql.Add('INSERT INTO PEDIDOS (ID_CLIENTE, VALOR_TOTAL, DATA_EMISSAO)');
          Sql.Add('VALUES (:ID_CLIENTE, :VALOR_TOTAL, :DATA_EMISSAO)');
          ParamByName('ID_CLIENTE').AsInteger := VendaModelDados.QueryConsulta.FieldByName('ID_CLIENTE').AsInteger;
          ParamByName('VALOR_TOTAL').AsFloat := VendaModelDados.QueryConsulta.FieldByName('TOTAL_PED').AsFloat;
          ParamByName('DATA_EMISSAO').AsDate := Date;
          ExecSql;
        end;
      With VendaModelDados.QueryConsulta do
        begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT NUM_PED');
          Sql.Add('FROM PEDIDOS');
          Sql.Add('ORDER BY NUM_PED DESC');
          Open;
        end;
      NumPed := VendaModelDados.QueryConsulta.FieldByName('NUM_PED').AsInteger;
      With VendaModelDados.QueryConsulta do
        begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT ID_PRODUTO, QTDE_ITEM, SEQ_ITEM, VALOR_UNIT, VALOR_SUBTOTAL');
          Sql.Add('FROM PEDIDOS_TEMP');
          Sql.Add('WHERE ID=:ID');
          ParamByName('ID').AsInteger := ID;
          Open;
        end;
      while not VEndaModelDados.QueryConsulta.Eof do
        begin
          With VendaModelDados.QueryTransition do
            begin
              Close;
              Sql.Clear;
              Sql.Add('INSERT INTO ITENS_PEDIDO (SEQ_ITEM, NUM_PED, ID_PRODUTO, QTDE_ITEM, VALOR_UNIT, VALOR_TOTAL)');
              Sql.Add('VALUES (:SEQ_ITEM, :NUM_PED, :ID_PRODUTO, :QTDE_ITEM, :VALOR_UNIT, :VALOR_TOTAL)');
              ParamByName('SEQ_ITEM').AsInteger := VendaModelDados.QueryConsulta.FieldByName('SEQ_ITEM').AsInteger;
              ParamByName('NUM_PED').AsInteger := NumPed;
              ParamByName('ID_PRODUTO').AsInteger := VendaModelDados.QueryConsulta.FieldByName('ID_PRODUTO').AsInteger;
              ParamByName('QTDE_ITEM').AsFloat := VendaModelDados.QueryConsulta.FieldByName('QTDE_ITEM').AsFloat;
              ParamByName('VALOR_UNIT').AsFloat := VendaModelDados.QueryConsulta.FieldByName('VALOR_UNIT').AsFloat;
              ParamByName('VALOR_TOTAL').AsFloat := VendaModelDados.QueryConsulta.FieldByName('VALOR_SUBTOTAL').AsFloat;
              ExecSql;
            end;
          VendaModelDados.QueryConsulta.Next;
        end;
      With VendaModelDados.QueryTransition do
        begin
          Close;
          Sql.Clear;
          Sql.Add('DELETE FROM PEDIDOS_TEMP');
          Sql.Add('WHERE ID=:ID');
          ParamByName('ID').AsInteger := ID;
          ExecSql;
        end;

    end;
end;

function TControllerPedidoVenda.DeletarPedido(Pedido :Integer): iPedidoVenda;
begin
  Result := Self;
end;

destructor TControllerPedidoVenda.Destroy;
begin

  inherited;
end;

function TControllerPedidoVenda.CancelarPedido(Pedido :Integer): iPedidoVenda;
begin
  Result := Self;
end;

class function TControllerPedidoVenda.New: iPedidoVenda;
begin
   Result := Self.Create;
end;

function TControllerPedidoVenda.PesquisarPedido(Pedido :Integer): iPedidoVenda;
begin
      With VendaModelDados.QueryConsulta do
        begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT P.NUM_PED, P.DATA_EMISSAO, P.ID_CLIENTE, P.VALOR_TOTAL,');
          Sql.Add('C.NOME_CLIENTE, C.CIDADE, C.UF');
          Sql.Add('FROM PEDIDOS P');
          Sql.Add('INNER JOIN CLIENTES C');
          Sql.Add('ON C.ID = P.ID_CLIENTE');
          Sql.Add('WHERE NUM_PED=:ID');
          ParamByName('ID').AsInteger := Pedido;
          Open;
        end;
      With VendaModelDados.QItensPedidosTemp do
        begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT I.SEQ_ITEM, I.NUM_PED, I.ID_PRODUTO, I.QTDE_ITEM, I.VALOR_UNIT,');
          Sql.Add('I.VALOR_TOTAL, R.NOME_PRODUTO');
          Sql.Add('FROM ITENS_PEDIDOS I');
          Sql.Add('INNER JOIN PEDIDOS P');
          Sql.Add('ON P.NUM_PED = I.NUM_PED');
          Sql.Add('INNER JOIN PRODUTOS R');
          Sql.Add('ON I.ID_PRODUTO = R.ID');
          Sql.Add('WHERE NUM_PED =:ID');
          ParamByName('ID').AsInteger := Pedido;
          Open;
        end;
  Result := Self;
end;

function TControllerPedidoVenda.ValidarPedido: iPedidoVenda;
begin
  Result := Self;
end;

end.
