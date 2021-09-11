unit Venda.Controller.Interfaces;

interface

type

  iPedidoVenda = interface
    ['{381D54E4-7468-415F-BE9A-949E84F5BF3A}']
    function CriarPedidoTemp(Id, CodigoCliente, CodigoProduto :Integer; ValorUnit, Quantidade :Real) : iPedidoVenda;
    function SalvarPedido(ID :Integer) : Integer;
    function ValidarPedido : iPedidoVenda;
    function CriarIdPedidoTemp : Integer;
    function CancelarPedido(Pedido :Integer) : iPedidoVenda;
    function DeletarPedido(Pedido :Integer) : String;
    function PesquisarPedido(Pedido :Integer) : iPedidoVenda;
    procedure ValidarCliente(CodCliente :Integer);
    procedure ValidarProduto(CodProduto :Integer);
    function ConsultarItens(ID :Integer) :Real;
    function EditarProdutoTemp(Id, SeqItem :Integer; QtdeItem, ValorItem :Real) : Boolean;
    function DeletarProdutoTemp(Id, SeqItem :Integer) : Boolean;
  end;



implementation

end.
