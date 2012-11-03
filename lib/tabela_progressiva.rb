require 'yaml'

class TabelaProgressiva
  attr_reader :tabela

  def initialize(ano, tabela = [])
    if tabela.empty?
      @tabela = YAML.load_file("./resources/#{ano}.yaml")
    else
      @tabela = tabela
    end
  end

  def isento?(valor_base)
    valor_base <= @tabela[0][:limite_superior]
  end

  def faixa_que_se_encaixa(valor_base)
    @tabela.select do |faixa|
      faixa if faixa[:limite_superior] && valor_base <= faixa[:limite_superior] && valor_base >= faixa[:limite_inferior]
    end.first
  end
end
