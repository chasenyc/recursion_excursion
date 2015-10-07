require 'rspec'
require 'recursion_problems'

describe "#sum_recur" do
  it "returns 0 for an empty array" do
    expect(sum_recur([])).to eq(0)
  end

  it "returns the sum of all numbers in array" do
    expect(sum_recur([1, 3, 5, 7, 9, 2, 4, 6, 8])).to eq(45)
  end

  it "does not modify the original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    sum_recur(original)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do
    expect(self).to receive(:sum_recur).at_least(:twice).and_call_original
    sum_recur([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end
end

describe "#includes?" do
  it "returns false if the target isn't found" do
    expect(includes?([1, 3, 5, 7, 9, 2, 4, 6, 8], 11)).to be(false)
  end

  it "returns true if the target is found" do
    expect(includes?([1, 3, 5, 7, 9, 2, 4, 6, 8], 9)).to be(true)
  end

  it "does not modify the original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    includes?(original, 9)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do
    expect(self).to receive(:includes?).at_least(:twice).and_call_original
    includes?([1, 3, 5, 7, 9, 2, 4, 6, 8], 9)
  end
end

describe "#num_occur" do
  it "returns number of times the target occurs in the array" do
    expect(num_occur([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6], 5)).to eq(4)
  end

  it "returns zero if target doesn't occur" do
    expect(num_occur([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6], 13)).to eq(0)
  end

  it "does not modify the original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    num_occur(original, 9)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do
    expect(self).to receive(:num_occur).at_least(:twice).and_call_original
    num_occur([1, 3, 5, 7, 9, 2, 4, 6, 8], 9)
  end
end

describe "#add_to_twelve?" do
  it "returns true if two adjacent numbers add to twelve" do
    expect(add_to_twelve?([1, 1, 2, 3, 4, 5, 7, 4, 5, 6, 7, 6, 5, 6])).to be(true)
  end

  it "returns false if no adjacent numbers add to twelve" do
    expect(add_to_twelve?([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6])).to be(false)
  end

  it "does not modify the original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    add_to_twelve?(original)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do
    expect(self).to receive(:add_to_twelve?).at_least(:twice).and_call_original
    add_to_twelve?([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end
end

describe "#countdown" do

  it "should take at least 0 seconds to run countdown(0)" do
    start_time = Time.now
    countdown(0)
    end_time = Time.now
    expect(end_time.sec - start_time.sec).to eq(0)
  end

  it "should take at least 1 seconds to run countdown(2) and be recursive" do
    start_time = Time.now
    expect(self).to receive(:countdown).at_least(:twice).and_call_original
    countdown(2)
    end_time = Time.now
    expect(end_time.sec - start_time.sec).to be > 1
  end
end

describe "#sorted?" do
  it "returns true if the array has only one value" do
    expect(sorted?([1])).to be(true)
  end

  it "returns true if the array is empty" do
    expect(sorted?([])).to eq(true)
  end

  it "returns true if the array is sorted" do
    expect(sorted?([1, 2, 3, 4, 4, 5, 6, 7])).to be(true)
  end

  it "returns false if the array is not sorted" do
    expect(sorted?([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6])).to be(false)
  end

  it "does not modify the original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    sorted?(original)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do
    expect(self).to receive(:sorted?).at_least(:twice).and_call_original
    sorted?([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end
end

describe "#reverse" do
  it "reverses strings of length <= 1" do
    expect(reverse("")).to eq("")
    expect(reverse("a")).to eq("a")
  end

  it "reverses longer strings" do
    expect(reverse("laozi")).to eq("izoal")
    expect(reverse("kongfuzi")).to eq("izufgnok")
  end

  it "does not modify the original string" do
    original = "fhqwhgads"
    reverse(original)
    expect(original).to eq("fhqwhgads")
  end

  it "calls itself recursively" do
    expect(self).to receive(:reverse).at_least(:twice).and_call_original
    reverse("fhqwhgads")
  end
end

describe "#exp" do
  let (:num) {rand(6)+1}
  let (:pow) {rand(4) + 2}
  it "A number to the 0th power equals 1" do
    expect(exp(num, 0)).to eq(num**0)
  end

  it "To the 1st power equals itself" do
    expect(exp(num, 1)).to eq(num)
  end

  it "Works with larger exponents" do
    expect(exp(num,pow)).to eq(num**pow)
  end

  it "calls itself recursively" do
    expect(self).to receive(:exp).at_least(:twice).and_call_original
    exp(5,3)
  end
end

describe "#fibonacci" do
  it "0 returns and empty array" do
    expect(fibonacci(0)).to eq([])
  end

  it "1 returns the first fibonacci number" do
    expect(fibonacci(1)).to eq([1])
  end

  it "6 returns more fibonacci" do
    expect(fibonacci(6)).to eq([1,1,2,3,5,8])
  end

  it "calls itself recursively" do
    expect(self).to receive(:fibonacci).at_least(:twice).and_call_original
    fibonacci(12)
  end
end

describe "Array#deep_dup" do
  let (:original_array) { [["Jonathan", "Carl", "Lily", "Tommy"],["Kush", "Ned"]] }

  it "Dup is the same as original" do
    expect(original_array.deep_dup).to eq(original_array)
  end

  it "If you modify deep_dup it doesn't modify original" do
    expect(original_array.dup << "Sennacy").not_to eq(original_array)
  end
end

describe "#bsearch" do
  let (:search_array) { [1, 2, 3, 4, 5, 7] }

  it "returns the correct position" do
    expect(bsearch(search_array, 4)).to eq(3)
  end

  it "returns nil if not found" do
    expect(bsearch(search_array, 6)).to eq(nil)
  end

  it "calls itself recursively" do
    expect(self).to receive(:bsearch).at_least(:twice).and_call_original
    bsearch(search_array, 2)
  end
end

describe "#make_change" do
  let (:diff_coins) { [10, 7, 1] }
  let (:standard_coins) { [25, 10, 5, 1] }

  it "picks the logical coin" do
    expect(make_change(10, diff_coins)).to eq([10])
  end

  it "will handle multiple coins" do
    expect(make_change(9, diff_coins)).to eq([7, 1, 1])
  end

  it "returns the least coins possible" do
    expect(make_change(14, diff_coins)).to eq([7, 7])
  end

  it "works with a different coin set" do
    expect(make_change(86, standard_coins)).to eq([25, 25, 25, 10, 1])
  end

  it "calls itself recursively" do
    expect(self).to receive(:make_change).at_least(:twice).and_call_original
    make_change(99, standard_coins)
  end
end

describe "Integer#to_roman" do
    it "handles 1" do
      expect(1.to_roman).to eq("I")
    end

    it "handles 4 properly" do
      expect(4.to_roman).to eq("IV")
    end

    it "handles 1984 properly" do
      expect(1984.to_roman).to eq("MCMLXXXIV")
    end
end

describe "#selection_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

    it "works with an empty array" do
      expect(selection_sort([])).to eq([])
    end

    it "works with an array of one item" do
      expect(selection_sort([1])).to eq([1])
    end

    it "sorts numbers" do
      expect(selection_sort(array)).to eq(array.sort)
    end

    it "will use block if given" do
      reversed = selection_sort(array) do |num1, num2|
        # reverse order
        num2 <=> num1
      end
      expect(reversed).to eq([5, 4, 3, 2, 1])
    end

    it "calls itself recursively" do
      expect(self).to receive(:selection_sort).at_least(:twice).and_call_original
      selection_sort(array)
    end

    it "does not modify original" do
      duped_array = array.dup
      selection_sort(duped_array)
      expect(duped_array).to eq(array)
    end
end

describe "#merge_sort" do
  # write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but creates a new sorted array.
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].merge_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].merge_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.merge_sort).to eq(array.sort)
  end

  it "will use block if given" do
    reversed = array.merge_sort do |num1, num2|
      # reverse order
      num2 <=> num1
    end
    expect(reversed).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.merge_sort
    expect(duped_array).to eq(array)
  end

  it "calls the merge helper method" do
    expect(Array).to receive(:merge).at_least(:once).and_call_original
    array.merge_sort
  end
end
