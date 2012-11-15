require 'yaml'

class TabelaProgressiva
  attr_reader :tabela

  def initialize(opts = {})
    prepara_tabela(opts)
  end

  def isento?(valor_base)
    valor_base <= @tabela[0][:limite_superior]
  end

  def faixa_que_se_encaixa(valor_base)
    @tabela.select do |faixa|
      faixa if faixa[:limite_superior] && valor_base <= faixa[:limite_superior] && valor_base >= faixa[:limite_inferior]
    end.first
  end

  private
  def prepara_tabela(opts)
    tabela = opts[:tabela] || YAML.load_file("./resources/#{opts[:ano]}.yaml")
    @tabela = tabela.map { |faixa| faixa.symbolize_keys }
  end
end
