require 'factory_girl'

FactoryGirl.define do
  factory :tabela_progressiva do
    ignore do
      tabela { [
        {"aliquota" => 0, "limite_inferior" => 0, "limite_superior" => 3000.0, "dedutor" => 0},
        {"aliquota" => 10, "limite_inferior" => 3000.01, "limite_superior" => 5000.0, "dedutor" => 400.0},
        {"aliquota" => 20, "limite_inferior" => 5000.01, "dedutor" => 700.0},
      ] }
    end
    initialize_with { new(:tabela => tabela) }
  end
end
