require('spec_helper')

describe(Brand) do
  it {should have_and_belong_to_many(:stores)}

  it("validates presence of name") do
    brand = Brand.new({:name => ""})
    expect(brand.save()).to(eq(false))
  end

  it('capitalizes the first letter of the name') do
    brand = Brand.create({:name => "chucks"})
    expect(brand.name).to(eq("Chucks"))
  end
end
