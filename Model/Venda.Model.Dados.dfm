object VendaModelDados: TVendaModelDados
  OldCreateOrder = False
  Height = 480
  Width = 739
  object QClientes: TFDQuery
    Connection = VendaModelConexao.FDConnection1
    SQL.Strings = (
      'SELECT * '
      'FROM CLIENTES')
    Left = 304
    Top = 176
    object QClientesid: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QClientesnome_cliente: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 255
    end
    object QClientescidade: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 255
    end
    object QClientesuf: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estado'
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
  end
  object DsClientes: TDataSource
    DataSet = QClientes
    Left = 304
    Top = 248
  end
  object QueryTransition: TFDQuery
    Connection = VendaModelConexao.FDConnection1
    SQL.Strings = (
      'SELECT * '
      'FROM CLIENTES')
    Left = 664
    Top = 168
  end
  object QProdutos: TFDQuery
    Connection = VendaModelConexao.FDConnection1
    SQL.Strings = (
      'SELECT * '
      'FROM PRODUTOS')
    Left = 400
    Top = 178
    object QProdutosid: TFDAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object QProdutosnome_produto: TStringField
      FieldName = 'nome_produto'
      Size = 255
    end
    object QProdutospreco_venda: TSingleField
      FieldName = 'preco_venda'
    end
  end
  object DsProdutos: TDataSource
    DataSet = QProdutos
    Left = 400
    Top = 250
  end
  object QPedidos: TFDQuery
    Connection = VendaModelConexao.FDConnection1
    SQL.Strings = (
      'SELECT P.NUM_PED, P.DATA_EMISSAO, P.ID_CLIENTE, P.VALOR_TOTAL, '
      'C.NOME_CLIENTE, C.CIDADE, C.UF'
      'FROM PEDIDOS P'
      'INNER JOIN CLIENTES C'
      'ON C.ID = P.ID_CLIENTE')
    Left = 480
    Top = 178
    object QPedidosNUM_PED: TFDAutoIncField
      DisplayLabel = 'N. Pedido'
      FieldName = 'NUM_PED'
      Origin = 'NUM_PED'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QPedidosDATA_EMISSAO: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data Pedido'
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object QPedidosID_CLIENTE: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object QPedidosVALOR_TOTAL: TSingleField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Pedido'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QPedidosNOME_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object QPedidosCIDADE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object QPedidosUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
  end
  object DsPedidos: TDataSource
    DataSet = QPedidos
    Left = 480
    Top = 250
  end
  object QItensPedidos: TFDQuery
    MasterSource = DsPedidos
    Connection = VendaModelConexao.FDConnection1
    SQL.Strings = (
      
        'SELECT I.SEQ_ITEM, I.NUM_PED, I.ID_PRODUTO, I.QTDE_ITEM, I.VALOR' +
        '_UNIT,'
      'I.VALOR_TOTAL, R.NOME_PRODUTO '
      'FROM ITENS_PEDIDOS I'
      'INNER JOIN PEDIDOS P'
      'ON P.NUM_PED = I.NUM_PED'
      'INNER JOIN PRODUTOS R'
      'ON I.ID_PRODUTO = R.ID'
      'WHERE NUM_PED =:ID')
    Left = 568
    Top = 180
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object QItensPedidosSEQ_ITEM: TFDAutoIncField
      DisplayLabel = 'ID Item'
      FieldName = 'SEQ_ITEM'
      Origin = 'SEQ_ITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QItensPedidosNUM_PED: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'N. Pedido'
      FieldName = 'NUM_PED'
      Origin = 'NUM_PED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QItensPedidosID_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'ID Produto'
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object QItensPedidosQTDE_ITEM: TSingleField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE_ITEM'
      Origin = 'QTDE_ITEM'
      DisplayFormat = '###,###,##0.00'
    end
    object QItensPedidosVALOR_UNIT: TSingleField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNIT'
      Origin = 'VALOR_UNIT'
      DisplayFormat = '###,###,##0.00'
    end
    object QItensPedidosVALOR_TOTAL: TSingleField
      AutoGenerateValue = arDefault
      DisplayLabel = 'SubTotal'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QItensPedidosNOME_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Produto'
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
  end
  object DsItensPedidos: TDataSource
    DataSet = QItensPedidos
    Left = 568
    Top = 252
  end
  object FDTransaction1: TFDTransaction
    Left = 136
    Top = 376
  end
  object QueryConsulta: TFDQuery
    Connection = VendaModelConexao.FDConnection1
    SQL.Strings = (
      'SELECT * '
      'FROM CLIENTES')
    Left = 672
    Top = 48
  end
  object QItensPedidosTemp: TFDQuery
    MasterSource = DsPedidos
    Connection = VendaModelConexao.FDConnection1
    SQL.Strings = (
      
        'SELECT I.SEQ_ITEM, I.ID AS NUM_PED, I.ID_PRODUTO, I.QTDE_ITEM, I' +
        '.VALOR_UNIT,'
      'I.VALOR_SUBTOTAL AS VALOR_TOTAL, R.NOME_PRODUTO '
      'FROM PEDIDOS_TEMP I'
      'INNER JOIN PRODUTOS R'
      'ON I.ID_PRODUTO = R.ID'
      'WHERE ID =:ID')
    Left = 568
    Top = 44
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object FDAutoIncField1: TFDAutoIncField
      DisplayLabel = 'ID Item'
      FieldName = 'SEQ_ITEM'
      Origin = 'SEQ_ITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'N. Pedido'
      FieldName = 'NUM_PED'
      Origin = 'NUM_PED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'ID Produto'
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object SingleField1: TSingleField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE_ITEM'
      Origin = 'QTDE_ITEM'
      DisplayFormat = '###,###,##0.00'
    end
    object SingleField2: TSingleField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNIT'
      Origin = 'VALOR_UNIT'
      DisplayFormat = '###,###,##0.00'
    end
    object SingleField3: TSingleField
      AutoGenerateValue = arDefault
      DisplayLabel = 'SubTotal'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Produto'
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
  end
  object DsItensPedidosTemp: TDataSource
    DataSet = QItensPedidosTemp
    Left = 568
    Top = 116
  end
  object QueryConsulta2: TFDQuery
    Connection = VendaModelConexao.FDConnection1
    SQL.Strings = (
      'SELECT * '
      'FROM CLIENTES')
    Left = 672
    Top = 112
  end
end
