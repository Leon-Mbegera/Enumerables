require_relative '../enumerable'
require 'rspec'

describe 'Enumerables' do
  let(:arr) { [1, 2, 3, 4, 5] }
  let(:neg_arr) { [1, 2, -3, 4] }
  let(:alike_arr) { [7, 7, 7] }
  let(:empty_arr) { [] }
  let(:false_arr) { [nil, false] }

  describe '#my_each method' do
    context 'when block is not given' do
      it 'should return an Enumerator' do
        expect(arr.my_each).to be_a(Enumerator)
      end
    end

    context 'when block is given' do
      array1 = []
      array2 = %w[Potatoes Bananas Tomatoes]
      it 'should execute given block condition on each element' do
        array2.my_each { |ele| array1 << ele }
        expect(array1).to eq(array2)
      end

      it 'should return same object' do
        array1 = %w[Movies Music Art]
        expect(array1.my_each { |ele| ele }).to eq(array1)
      end
    end
  end

  describe '#my_each_with_index' do
    context 'when block is not given' do
      it 'should return an enumerator' do
        expect(arr.my_each_with_index).to be_a(Enumerator)
      end
    end

    context 'when block is given' do
      hash = {}
      array = %w[cat mouse rabbit]
      result = { 0 => 'cat', 1 => 'mouse', 2 => 'rabbit' }
      it 'should execute the block condition on each element with its index' do
        array.my_each_with_index { |pet, idx| hash[idx] = pet }
        expect(hash).to eq(result)
      end

      it 'should return same object' do
        expect(arr.my_each_with_index { |ele, _idx| ele }).to eq(arr)
      end
    end
  end

  describe '#my_select method' do
    context 'when no block is given' do
      it 'should return an Enumerator' do
        expect(arr.my_each_with_index).to be_a(Enumerator)
      end
    end

    context 'when block is given' do
      it 'should return an array resulting from passing each element to the block' do
        array = [1, 3, 5]
        expect(arr.my_select(&:odd?)).to eq(array)
      end

      it 'should return only elements returning true' do
        expect(neg_arr.my_select(&:positive?)).not_to include(-3)
      end

      it 'should return empty array if block is false' do
        expect(arr.my_select { false }).to be_empty
      end
    end
  end

  describe '#my_all? method' do
    context 'when block is given' do
      it 'should return true if all elements return true' do
        expect(arr.my_all? { |ele| ele.is_a?(Integer) }).to be true
      end

      it 'should return false if any element returns false' do
        array1 = [1, 2, 'doja cat', 8]
        expect(array1.my_all? { |ele| ele.is_a?(Integer) }).to be false
      end
    end

    context 'when parameter is given' do
      it 'should return true if all elements match given parameter' do
        expect(arr.my_all?(Integer)).to be true
      end

      it 'should return true if all elements match regex' do
        expect(%w[x y z].my_all?(/[a-zA-Z]/)).to be true
      end

      it 'should return true if all elements match given parameter' do
        expect(alike_arr.my_all?(7)).to be true
      end
    end

    context 'when no parameter is given' do
      it 'should return true if all elements are truthy' do
        array1 = [8.03, 'G', true]
        expect(array1.my_all?).to be true
      end

      it 'should return false if any element is falsy' do
        array2 = [27, nil, 'bengali']
        expect(array2.my_all?).to be false
      end

      it 'should return true if object empty' do
        expect(empty_arr.my_all?).to be true
      end
    end
  end

  describe '#my_any?' do
    context 'when block is given' do
      it 'should return true if any of elements returns true' do
        expect(arr.my_any? { |ele| ele.is_a?(Integer) }).to be true
      end

      it 'should return false if all elements return false' do
        expect(arr.my_any? { |ele| ele.is_a?(String) }).to be false
      end
    end

    context 'when parameter is given' do
      it 'should return true if any element matches given parameter' do
        expect(arr.my_any?(&:odd?)).to be true
      end

      it 'should return false if all elements dont match given parameter' do
        expect(arr.my_any?(&:negative?)).to be false
      end

      it 'should return true if any element matches specific parameter' do
        expect(arr.my_any?(5)).to be true
      end
    end

    context 'when regex is given' do
      it 'should return true if any element matches given regex' do
        expect(['s', 'r', '4.5'].my_any?(/[a-zA-Z]/)).to be true
      end
    end

    context 'when no parameter is given' do
      it 'should return true if any element is truthy' do
        expect([true, nil].my_any?).to be true
      end

      it 'should return false if all elements are falsy' do
        expect([false, nil].my_any?).to be false
      end

      it 'should return false if empty' do
        expect(empty_arr.my_any?).to be false
      end
    end
  end

  describe '#my_none?' do
    context 'when block is given' do
      it 'should return true if none of elements returns true' do
        expect(arr.my_none? { |ele| ele.is_a?(Float) }).to be true
      end

      it 'should return false if any element returns true' do
        array = [45, 22, 4.9, 120]
        expect(array.my_none? { |ele| ele.is_a?(Float) }).to be false
      end
    end

    context 'when parameter is given' do
      it 'should return true if none of element match given parameter' do
        expect(arr.my_none?(String)).to be true
      end

      it 'should return false if any element returns true' do
        array2 = [45, 22, 4.9, 120]
        expect(array2.my_none?(Float)).to be false
      end

      it 'should return true if none of elements match given regex' do
        expect(%w[q n t w].my_none?(/[0-9]/)).to be true
      end

      it 'should return true if none of elements match specific parameter' do
        expect(arr.my_none?(9)).to be true
      end

      it 'should return true if object is empty' do
        expect(empty_arr.my_none?).to be true
      end

      it 'should return false if all elements match given parameter' do
        expect(arr.my_none?(Integer)).to be false
      end
    end

    context 'when parameter is not given' do
      it 'should return true if no elements is truthy' do
        expect([false, nil].my_none?).to be true
      end

      it 'should return false if even one element is truthy' do
        expect([nil, false, 23].my_none?).to be false
      end
    end
  end

  describe '#my_count method' do
    context 'when block is given' do
      it 'should return count of elements that return true after passing block' do
        array1 = [3, 8, 6, 5, 5]
        expect(array1.my_count(&:even?)).to eq(2)
      end

      it 'should return count 0 if no elements return true after passing block' do
        array2 = [2, 4, 4]
        expect(array2.my_count(&:odd?)).to eq(0)
      end
    end

    context 'when parameter is given' do
      it 'should return count of elements that match given parameter' do
        expect(arr.my_count(Integer)).to eq(5)
      end

      it 'should return count of elements that match given regex' do
        expect([4.8, false, 'mbegera', nil].my_count(/[a-zA-Z]/)).to eq(1)
      end

      it 'should return count of elements that match specific parameter' do
        expect([4, 333, 333, 8].my_count(333)).to eq(2)
      end
    end

    context 'when no parameter is given' do
      it 'should return total number of elements' do
        expect([4, 9, 12, 'd', false, 5.33].my_count).to eq(6)
      end

      it 'should return count of 0 for empty object' do
        expect(empty_arr.my_count).to eq(0)
      end
    end
  end

  describe '#my_map method' do
    context 'when neither proc nor block is given' do
      it 'should return an Enumerator' do
        expect(arr.my_map).to be_a(Enumerator)
      end
    end

    context 'when block is given' do
      it 'should return an array mapping every element by passing a block' do
        result = [5, 10, 15, 20, 25]
        expect(arr.my_map { |ele| ele * 5 }).to eq(result)
      end
    end
  end

  describe '#my_inject method' do
    context 'when no block nor parameter is given' do
      it 'should raise an error' do
        expect { arr.my_inject }.to raise_error LocalJumpError
      end
    end

    context 'when block is given' do
      context 'when parameter is also given' do
        it 'should start accumulation from parameter' do
          expect(arr.my_inject(5) { |accum, ele| accum + ele }).to eq(20)
        end
      end

      context 'when parameter is not given' do
        it 'should start accumulation from first element' do
          expect(arr.my_inject { |accum, ele| accum + ele }).to eq(15)
        end
      end
    end

    context 'when block is not given but starting element and operation sign given as parameters' do
      it 'should start accumulation from parameter and return reduced enumerable' do
        expect(arr.my_inject(5, :+)).to eq(20)
      end
    end

    context 'when operation sign is given as only parameter' do
      it 'should start from first element and accumulate through with the operation sign' do
        expect(arr.my_inject(:*)).to eq(120)
      end
    end
  end

  describe 'multiply_els method' do
    it 'should return the product from the method' do
      def multiply_els(arr)
        arr.my_inject(:*)
      end
      expect(multiply_els(arr)).to eq(120)
    end
  end
end
