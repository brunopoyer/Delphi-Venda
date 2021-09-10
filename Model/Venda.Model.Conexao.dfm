object VendaModelConexao: TVendaModelConexao
  OldCreateOrder = False
  Height = 449
  Width = 781
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=vendas'
      'User_Name=root'
      'Password=12345'
      'DriverID=MySQL')
    Left = 112
    Top = 64
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Projetos\delphi-venda\libmysql.dll'
    Left = 112
    Top = 136
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 112
    Top = 208
  end
end
