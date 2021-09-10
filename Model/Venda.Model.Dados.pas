unit Venda.Model.Dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TVendaModelDados = class(TDataModule)
    QClientes: TFDQuery;
    DsClientes: TDataSource;
    QueryTransition: TFDQuery;
    QClientesid: TFDAutoIncField;
    QClientesnome_cliente: TStringField;
    QClientescidade: TStringField;
    QClientesuf: TStringField;
    QProdutos: TFDQuery;
    DsProdutos: TDataSource;
    QPedidos: TFDQuery;
    DsPedidos: TDataSource;
    QItensPedidos: TFDQuery;
    DsItensPedidos: TDataSource;
    FDTransaction1: TFDTransaction;
    QProdutosid: TFDAutoIncField;
    QProdutosnome_produto: TStringField;
    QProdutospreco_venda: TSingleField;
    QPedidosNUM_PED: TFDAutoIncField;
    QPedidosDATA_EMISSAO: TDateField;
    QPedidosID_CLIENTE: TIntegerField;
    QPedidosVALOR_TOTAL: TSingleField;
    QPedidosNOME_CLIENTE: TStringField;
    QPedidosCIDADE: TStringField;
    QPedidosUF: TStringField;
    QItensPedidosSEQ_ITEM: TFDAutoIncField;
    QItensPedidosNUM_PED: TIntegerField;
    QItensPedidosID_PRODUTO: TIntegerField;
    QItensPedidosQTDE_ITEM: TSingleField;
    QItensPedidosVALOR_UNIT: TSingleField;
    QItensPedidosVALOR_TOTAL: TSingleField;
    QItensPedidosNOME_PRODUTO: TStringField;
    QueryConsulta: TFDQuery;
    QItensPedidosTemp: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    SingleField1: TSingleField;
    SingleField2: TSingleField;
    SingleField3: TSingleField;
    StringField1: TStringField;
    DsItensPedidosTemp: TDataSource;
    QueryConsulta2: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VendaModelDados: TVendaModelDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
