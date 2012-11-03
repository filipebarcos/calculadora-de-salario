calculadora-de-salario
======================

Calculadora para auxiliar você a calcular o seu salário!

Para usar basta usar o task **calcula** da seguinte forma:
`rake calcula[seu_salario,aliquota_do_inss,outros_descontos,ano_atual]`

Por exemplo, se seu salário é **10mil** reais, você será descontado **11% de INSS** e digamos que você é descontado em folha o estacionamento do seu trabalho, que te custa **200 reais** por mês, assim, executa a task da seguinte forma:

`rake calcula[10000,11,200,2012]`
