require 'spec_helper'

describe "Calculadora" do
  before(:all) do
    @salario_bruto = 5000.00
    @aliquota_inss = 11.0
    @outros_descontos = 0.0
    @calculadora = Calculadora.new(:salario_bruto => @salario_bruto, :aliquota_inss => @aliquota_inss)
  end
end
