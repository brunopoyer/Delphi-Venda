program ProjetoVenda;

uses
  Vcl.Forms,
  Venda.View.Principal in 'View\Venda.View.Principal.pas' {VendaViewPrincipal},
  Venda.Model.Dados in 'Model\Venda.Model.Dados.pas' {VendaModelDados: TDataModule},
  Venda.Model.Conexao in 'Model\Venda.Model.Conexao.pas' {VendaModelConexao: TDataModule},
  Venda.Controller.Interfaces in 'Controller\Venda.Controller.Interfaces.pas',
  Venda.Controller.PedidoVenda in 'Controller\Venda.Controller.PedidoVenda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TVendaViewPrincipal, VendaViewPrincipal);
  Application.CreateForm(TVendaModelDados, VendaModelDados);
  Application.CreateForm(TVendaModelConexao, VendaModelConexao);
  Application.Run;
end.
