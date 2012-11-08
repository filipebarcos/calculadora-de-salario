require 'spec_helper'

describe "Calculadora" do
  before(:all) do
    @salario_bruto = 5000.00
    @aliquota_inss = 11.0
    @outros_descontos = 0.0
    tabela = FactoryGirl.build(:tabela_progressiva)
    @calculadora = Calculadora.new(:salario_bruto => @salario_bruto, :aliquota_inss => @aliquota_inss, :tabela_progressiva => tabela)
  end


  it "deveria prover o salario base para calculo do imposto de renda" do
    @calculadora.salario_base.should == 4450
  end
end
