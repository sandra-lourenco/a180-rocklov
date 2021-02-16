

describe "POST/signup" do
context "novo usuario" do
    before (:all) do
     payload = { name: "sandra", email: "sandra@bol.com", password: "abc123"}
     MongoDB.new.remove_user(payload[:email])
      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
end

examples = [
    {
      title: "usuario ja existe",
      payload: { name: "sandra", email: "sandra@bol.com", password: "abc123"},
      code: 409,
      error: "Email already exists :(",
    },
    {
      title: "nome em branco",
      payload: { name: "", email: "maria@bol.com", password: "abc123"},
      code: 412,
      error: "required name",
    },
    {
      title: "sem o campo nome",
      payload: { email: "maria@bol.com", password: "abc123"},
      code: 412,
      error: "required name",
    },
    {
      title: "email em branco",
      payload: { name: "maria", email: "", password: "abc123"},
      code: 412,
      error: "required email",
    },
    {
      title: "sem o campo email",
      payload: { name: "maria", password: "abc123"},
      code: 412,
      error: "required email",
    },
    {
      title: "senha em branco",
      payload: { name: "maria", email: "maria@bol.com", password: "" },
      code: 412,
      error: "required password",
    },
    {
      title: "sem o campo senha",
      payload: { name: "maria", email: "maria@bol.com"},
      code: 412,
      error: "required password",
    },
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        payload = e[:payload]
        MongoDB.new.remove_user(payload[:email])

        Signup.new.create(payload)
        @result = Signup.new.create(payload)
      end

      it "deve retornar #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "deve retornar mensagem" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end


# context "usuario ja existe" do
#     before (:all) do
#       #dado que eu tenho um novo usuario
#      payload = { name: "maria", email: "maria@bol.com", password: "abc123"}
#      MongoDB.new.remove_user(payload[:email])

#      # e o email desse usuario ja foi cadastrano no sistema
#      Signup.new.create(payload)
#      # qd faco uma requisicao para a rota/signup
#      @result = Signup.new.create(payload)
#     end

#     it "deve retornar 409" do
#       # entao deve retornar 409
#       expect(@result.code).to eql 409
#     end

#     it "deve retornar mensagem" do
#       expect(@result.parsed_response["error"]).to eql "Email already exists :("
#     end
#   end

  

#   context "nome obrigatorio" do
#     before (:all) do
#       #dado que eu tenho um novo usuario
#      payload = { name: "", email: "maria@bol.com", password: "abc123"}
#      MongoDB.new.remove_user(payload[:email])

#      # e o email desse usuario ja foi cadastrano no sistema
#      #Signup.new.create(payload)
#      # qd faco uma requisicao para a rota/signup
#      @result = Signup.new.create(payload)
#     end

#     it "deve retornar 412" do
#       # entao deve retornar 412
#       expect(@result.code).to eql 412
#     end

#     it "deve retornar mensagem" do
#       expect(@result.parsed_response["error"]).to eql "required name"
#     end
#   end

#   context "email obrigatorio" do
#     before (:all) do
#       #dado que eu tenho um novo usuario
#      payload = { name: "maria", email: "", password: "abc123"}
#      MongoDB.new.remove_user(payload[:email])

#      # e o email desse usuario ja foi cadastrano no sistema
#      #Signup.new.create(payload)
#      # qd faco uma requisicao para a rota/signup
#      @result = Signup.new.create(payload)
#     end

#     it "deve retornar 412" do
#       # entao deve retornar 412
#       expect(@result.code).to eql 412
#     end

#     it "deve retornar mensagem" do
#       expect(@result.parsed_response["error"]).to eql "required email"
#     end
#   end

#   context "password obrigatoria" do
#     before (:all) do
#       #dado que eu tenho um novo usuario
#      payload = { name: "maria", email: "maria@bol.com", password: ""}
#      MongoDB.new.remove_user(payload[:email])

#      # e o email desse usuario ja foi cadastrano no sistema
#      #Signup.new.create(payload)
#      # qd faco uma requisicao para a rota/signup
#      @result = Signup.new.create(payload)
#     end

#     it "deve retornar 412" do
#       # entao deve retornar 412
#       expect(@result.code).to eql 412
#     end

#     it "deve retornar mensagem" do
#       expect(@result.parsed_response["error"]).to eql "required password"
#     end
#   end

# end