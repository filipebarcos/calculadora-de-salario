require 'rspec/core/rake_task'
require './lib/calculadora'
require './lib/tabela_progressiva'
require './lib/common/hash'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec


task :calcula, :salario, :inss, :descontos, :ano do |t, args|
  calculadora = Calculadora.new(:salario_bruto => args[:salario].to_f,
                                :aliquota_inss => args[:inss].to_f,
                                :outros_descontos => args[:descontos].to_f,
                                :ano              => args[:ano])
  puts calculadora.executa.round(2)
end


def entradas_validas?(args)
  args.length == 4 && !args[:salario_bruto].nil? && !args[:inss].nil? && !args[:descontos].nil? && !args[:ano].nil?
end
