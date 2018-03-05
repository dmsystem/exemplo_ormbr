unit Model.Procedimento;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,
  /// orm
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.types.mapping,
  ormbr.types.nullable,
  ormbr.mapping.classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes;

type
  [Entity]
  [Table('PROCEDIMENTOS', '')]
  [PrimaryKey('MNEMONICO', NotInc, NoSort, False, 'Chave prim�ria')]
  TProcedimento = class
  private
    { Private declarations }
    FPROCEDIMENTO: Double;
    FNOME: String;
    FMNEMONICO: String;

  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('PROCEDIMENTO', ftBCD, 8, 0)]
    [Dictionary('PROCEDIMENTO', 'Mensagem de valida��o', '0', '', '', taRightJustify)]
    property PROCEDIMENTO: Double read FPROCEDIMENTO write FPROCEDIMENTO;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 60)]
    [Dictionary('NOME', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property NOME: String read FNOME write FNOME;

    [Restrictions([NotNull])]
    [Column('MNEMONICO', ftString, 7)]
    [Dictionary('MNEMONICO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property MNEMONICO: String read FMNEMONICO write FMNEMONICO;

  end;

implementation

constructor TProcedimento.Create;
begin
end;

destructor TProcedimento.Destroy;
begin
  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TProcedimento)

end.


