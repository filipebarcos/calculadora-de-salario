require 'spec_helper'

describe Hash do
  context "symbolize_keys" do
    it "deveria retornar um novo hash com as chaves como simbolos" do
      hash = { "chave" => "valor" }
      novo_hash = hash.symbolize_keys
      novo_hash[:chave].should == "valor"
      novo_hash["chave"].should be_nil
    end
  end
end
