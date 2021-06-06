final createTable = '''
  CREATE TABLE tb_imc (
    id INT NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,peso DECIMAL(3,2) NOT NULL
    ,altura DECIMAL (2,2) NOT NULL
    ,imc DECIMAL (2,2) NOT NULL
  )
''';

final insertInto = '''
  INSERT INTO tb_imc (nome, peso, altura, imc) 
  VALUES ('Franciel', '75.00', '1.80', '23,65')
''';

final insertInto2 = '''
  INSERT INTO tb_imc (nome, peso, altura, imc) 
  VALUES ('Carlo', '75.00', '1.70', '29,41')
''';

final insertInto3 = '''
  INSERT INTO tb_imc (nome, peso, altura, imc) 
  VALUES ('Hinata', '50.00', '1.50', '22,22')
''';
