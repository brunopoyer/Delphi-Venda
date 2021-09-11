object VendaViewPrincipal: TVendaViewPrincipal
  Left = 0
  Top = 0
  Caption = '     Pedidos de Venda    '
  ClientHeight = 609
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 891
    Height = 609
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 889
      Height = 607
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = '     Consultar Pedidos      '
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 881
          Height = 579
          Align = alClient
          TabOrder = 0
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 879
            Height = 41
            Align = alTop
            Caption = 'Pedidos de Venda'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DBGrid1: TDBGrid
            Left = 1
            Top = 42
            Width = 879
            Height = 183
            Align = alTop
            DataSource = VendaModelDados.DsPedidos
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM_PED'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_EMISSAO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_CLIENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_CLIENTE'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CIDADE'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UF'
                Width = 64
                Visible = True
              end>
          end
          object Panel6: TPanel
            Left = 1
            Top = 225
            Width = 879
            Height = 353
            Align = alClient
            TabOrder = 2
            object Panel7: TPanel
              Left = 1
              Top = 1
              Width = 877
              Height = 41
              Align = alTop
              Caption = 'Itens do Pedido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object DBGrid2: TDBGrid
              Left = 1
              Top = 42
              Width = 877
              Height = 310
              Align = alClient
              DataSource = VendaModelDados.DsItensPedidos
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEQ_ITEM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_PED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_PRODUTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QTDE_ITEM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_UNIT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_TOTAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_PRODUTO'
                  Width = 64
                  Visible = True
                end>
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = '     Digitar Pedidos      '
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 881
          Height = 579
          Align = alClient
          TabOrder = 0
          object Panel8: TPanel
            Left = 1
            Top = 223
            Width = 879
            Height = 313
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 0
            object DBGrid3: TDBGrid
              Left = 2
              Top = 2
              Width = 875
              Height = 309
              Align = alClient
              DataSource = VendaModelDados.DsItensPedidosTemp
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnKeyDown = DBGrid3KeyDown
              OnKeyPress = DBGrid3KeyPress
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEQ_ITEM'
                  Width = 119
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_PED'
                  Width = 119
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_PRODUTO'
                  Width = 119
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_PRODUTO'
                  Width = 255
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QTDE_ITEM'
                  Width = 144
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_UNIT'
                  Width = 92
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_TOTAL'
                  Width = 127
                  Visible = True
                end>
            end
          end
          object Panel9: TPanel
            Left = 1
            Top = 1
            Width = 879
            Height = 222
            Align = alClient
            TabOrder = 1
            object Panel10: TPanel
              Left = 1
              Top = 87
              Width = 877
              Height = 134
              Align = alBottom
              BevelInner = bvLowered
              TabOrder = 1
              object Label1: TLabel
                Left = 3
                Top = 29
                Width = 160
                Height = 16
                Caption = 'C'#243'd./ Descri'#231#227'o do Produto'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label5: TLabel
                Left = 348
                Top = 29
                Width = 66
                Height = 16
                Caption = 'Quantidade'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label6: TLabel
                Left = 448
                Top = 29
                Width = 77
                Height = 16
                Caption = 'Valor Unit'#225'rio'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label7: TLabel
                Left = 555
                Top = 29
                Width = 50
                Height = 16
                Caption = 'SubTotal'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object ToolBar2: TToolBar
                Left = 2
                Top = 90
                Width = 873
                Height = 42
                Align = alBottom
                ButtonHeight = 39
                Caption = 'ToolBar1'
                TabOrder = 5
                object BitBtn2: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 97
                  Height = 39
                  Caption = 'Inserir Produto'
                  TabOrder = 0
                  OnClick = BitBtn2Click
                end
              end
              object EdCodProduto: TEdit
                Left = 3
                Top = 48
                Width = 71
                Height = 21
                TabOrder = 0
                OnExit = EdCodProdutoExit
              end
              object EdNomeProduto: TEdit
                Left = 75
                Top = 48
                Width = 271
                Height = 21
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 1
              end
              object EdQuantidade: TEdit
                Left = 348
                Top = 48
                Width = 99
                Height = 21
                TabOrder = 2
                OnExit = EdQuantidadeExit
              end
              object EdValorUnit: TEdit
                Left = 448
                Top = 48
                Width = 106
                Height = 21
                TabOrder = 3
                OnExit = EdValorUnitExit
              end
              object EdSubTotal: TEdit
                Left = 555
                Top = 48
                Width = 106
                Height = 21
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 4
              end
            end
            object Panel11: TPanel
              Left = 1
              Top = 1
              Width = 877
              Height = 86
              Align = alClient
              TabOrder = 0
              object Label8: TLabel
                Left = 75
                Top = 23
                Width = 148
                Height = 16
                Caption = 'C'#243'digo / Nome do Cliente'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label10: TLabel
                Left = 420
                Top = 23
                Width = 96
                Height = 16
                Caption = 'Nome da Cidade'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label11: TLabel
                Left = 584
                Top = 23
                Width = 17
                Height = 16
                Caption = 'UF'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label12: TLabel
                Left = 3
                Top = 23
                Width = 57
                Height = 16
                Caption = 'N. Pedido'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object EdCodCliente: TEdit
                Left = 75
                Top = 42
                Width = 71
                Height = 21
                TabOrder = 0
                OnExit = EdCodClienteExit
              end
              object EdNomeCliente: TEdit
                Left = 147
                Top = 42
                Width = 271
                Height = 21
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 1
              end
              object EdCidadeCliente: TEdit
                Left = 419
                Top = 42
                Width = 164
                Height = 21
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 2
              end
              object EdUFCliente: TEdit
                Left = 584
                Top = 42
                Width = 90
                Height = 21
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 3
              end
              object EdPedido: TEdit
                Left = 3
                Top = 42
                Width = 71
                Height = 21
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 4
                Text = '0'
              end
            end
          end
          object ToolBar1: TToolBar
            Left = 1
            Top = 536
            Width = 879
            Height = 42
            Align = alBottom
            ButtonHeight = 41
            Caption = 'ToolBar1'
            TabOrder = 2
            object BitBtn5: TBitBtn
              Left = 0
              Top = 0
              Width = 100
              Height = 41
              Align = alLeft
              Caption = 'Novo Pedido'
              TabOrder = 3
              OnClick = BitBtn5Click
            end
            object BitBtn1: TBitBtn
              Left = 100
              Top = 0
              Width = 111
              Height = 41
              Align = alLeft
              Caption = 'Gravar Pedido'
              TabOrder = 0
              OnClick = BitBtn1Click
            end
            object BitBtn4: TBitBtn
              Left = 211
              Top = 0
              Width = 121
              Height = 41
              Align = alLeft
              Caption = 'Cancelar Pedido'
              TabOrder = 2
              OnClick = BitBtn4Click
            end
            object BitBtn3: TBitBtn
              Left = 332
              Top = 0
              Width = 109
              Height = 41
              Align = alLeft
              Caption = 'Buscar Pedido'
              TabOrder = 1
              OnClick = BitBtn3Click
            end
            object BitBtn6: TBitBtn
              Left = 441
              Top = 0
              Width = 105
              Height = 41
              Align = alLeft
              Caption = 'Excluir Pedido'
              TabOrder = 4
              OnClick = BitBtn6Click
            end
            object Label3: TLabel
              Left = 546
              Top = 0
              Width = 330
              Height = 41
              Align = alClient
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Valor total do pedido: '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -19
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
          end
        end
      end
    end
  end
end
