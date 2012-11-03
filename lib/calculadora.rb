class Calculador
  def initialize(opts = {})
    @salario_bruto = opts[:salario_bruto]
    @aliquota_inss = opts[:aliquota_inss]
    @outros_descontos = opts[:outros_descontos]
    @tabela_progressiva = opts[:tabela_progressiva] || TabelaProgressiva.new
  end

  def executa
    valor_base = calcula_base_irrf
    valor_base - @outros_descontos - (irrf(valor_base) || 0)
  end

  private
  def calcula_base_irrf
    @salario_bruto * (100.0 - @aliquota_inss.to_f) / 100.0
  end

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
