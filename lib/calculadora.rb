class Calculadora
  def initialize(opts = {})
    @salario_bruto = opts[:salario_bruto] || 0.0
    @aliquota_inss = opts[:aliquota_inss] || 0.0
    @outros_descontos = opts[:outros_descontos] || 0.0
    @tabela_progressiva = opts[:tabela_progressiva] || TabelaProgressiva.new(:ano => opts[:ano])
  end

  def executa
    valor_base = salario_base
    valor_base - @outros_descontos - (irrf(valor_base) || 0)
  end

  def salario_base
    @salario_base ||= @salario_bruto * (100.0 - @aliquota_inss.to_f) / 100.0
  end

  private
  def porcentagem(valor)
    valor.to_f / 100.0
  end

  def irrf(valor_base)
    unless @tabela_progressiva.isento?(valor_base)
      faixa = @tabela_progressiva.faixa_que_se_encaixa(valor_base)
      valor_base * porcentagem(faixa[:aliquota]) - faixa[:dedutor]
    end
  end
end
