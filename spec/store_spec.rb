require('spec_helper')

describe(Store) do

  it("ensures the length of description is at least 1 character") do
    store = Store.new({:description => ""})
    expect(store.save()).to(eq(false))
  end

  it("capitalize first letter of every word in the description") do
    store = Store.create({:description => "finagle the buffalo"})
    expect(store.description()).to(eq("Finagle The Buffalo"))
  end

end


describe(Store) do
  it { should have_and_belong_to_many(:brands) }
end
