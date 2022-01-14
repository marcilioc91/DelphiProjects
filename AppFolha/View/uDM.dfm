object DM: TDM
  OldCreateOrder = False
  Height = 339
  Width = 418
  object FDConn: TFDConnection
    Left = 88
    Top = 56
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 192
    Top = 152
  end
  object FDQuery1: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'INSERET INTO cargo (codigo, nome) VALUE (1, '#39'Dinho'#39')')
    Left = 200
    Top = 56
  end
end
