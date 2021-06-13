final createTable = '''
  CREATE TABLE tb_imc (
    id INT PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,peso DECIMAL(3,2) NOT NULL
    ,altura DECIMAL (2,2) NOT NULL
    ,imc VARCHAR(20) NOT NULL
    ,link_foto VARCHAR(300) NOT NULL
  )
''';

final insertInto1 = '''
  INSERT INTO tb_imc (nome, peso, altura, imc, link_foto) 
  VALUES ('Franciel', '75.00', '1.80', '23,65', 'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
''';

final insertInto2 = '''
  INSERT INTO tb_imc (nome, peso, altura, imc, link_foto) 
  VALUES ('Carlos', '75.00', '1.70', '29,41', 'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png')
''';

final insertInto3 = '''
  INSERT INTO tb_imc (nome, peso, altura, imc, link_foto) 
  VALUES ('Hinata', '50.00', '1.50', '22,22', 'https://cdn.pixabay.com/photo/2021/05/16/07/26/naruto-6257398_960_720.png')
''';

final insertInto4 = '''
  INSERT INTO tb_imc (nome, peso, altura, imc, link_foto) 
  VALUES ('Cintia', '60.00', '1.60', '23,24', 'https://cdn.pixabay.com/photo/2016/04/26/07/57/woman-1353825_960_720.png')
''';
