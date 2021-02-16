describe "POST/equipos/{equipo_id}/bookings" do
  before(:all) do
    payload = { email: "pete@bol.com", password: "abc123" }
    result = Sessions.new.login(payload)
    @pete_id = result.parsed_response["_id"]
  end

  context "solicitar locacao" do
    before(:all) do
      # dado que "Sandra tem um "Fender Strato" para locacao

      result = Sessions.new.login({ email: "sandra@bol.com", password: "abc123" })
      sandra_id = result.parsed_response["_id"]

      fender = {
        thumbnail: Helpers::get_thumb("fender-sb.jpg"),
        name: "Fender Strato",
        category: "Cordas",
        price: 150,
      }
      MongoDB.new.remove_equipo(fender[:name], sandra_id)
      result = Equipos.new.create(fender, sandra_id)
      fender_id = result.parsed_response["_id"]

      # quando solicito a locação da Fender do Joe Perry

      @result = Equipos.new.booking(fender_id, @pete_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end
end
