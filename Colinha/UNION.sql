SELECT ClienteNome, ClienteSobrenome FROM CLientes WHERE ClienteNome = 'Jon' --AS MESMAS CONDIÇÕES DO SELECT DE CIMA DEVE ESTAR EM BAIXO
UNION -- Discarta Duplicado e junta eles
SELECT ClienteNome, ClienteSobrenome FROM CLientes WHERE ClienteSexo = 'Jon'


SELECT ClienteNome, ClienteSobrenome FROM CLientes WHERE ClienteNome = 'Jon' --AS MESMAS CONDIÇÕES DO SELECT DE CIMA DEVE ESTAR EM BAIXO
UNION ALL -- Junta os dois conjuntos, mesmo que sejam Duplicado
SELECT ClienteNome, ClienteSobrenome FROM CLientes WHERE ClienteSexo = 'Jon'