require('spec_helper')

describe(Brand) do
  
    it("ensures the length of description is at least 1 character") do
      brand = Brand.new({:description => ""})
      expect(brand.save()).to(eq(false))
    end

    it("capitalize first letter of every word in the description") do
      brand = Brand.create({:description => "finagle the buffalo"})
      expect(brand.description()).to(eq("Finagle The Buffalo"))
    end
end

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }
end
