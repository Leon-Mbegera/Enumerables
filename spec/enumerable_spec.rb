require_relative "../enumerable.rb"
require "rspec"

describe 'Enumerables' do

  let(:arr) {[1, 2, 3, 4, 5]}
  let(:neg_arr) {[1, 2, -3, 4]}
  let(:alike_arr) {[7, 7, 7]}
  let(:empty_arr) {[]}
  let(:false_arr) {[nil, false]}



  describe '#my_each method' do

    context 'when block is not given' do
      it 'should return an Enumerator' do
        expect(arr.my_each).to be_a(Enumerator)
      end
    end

    context 'when block is given' do
      array1 = []
      array2 = ['Potatoes', 'Bananas', 'Tomatoes']
      it 'should execute given block condition on each element' do
        array2.my_each { |ele| array1 << ele}
        expect(array1).to eq(array2) 
      end

      it 'should return same object' do
        array1 = ['Movies', 'Music', 'Art']
        expect(array1.my_each  { |ele| ele}).to eq(array1)
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
      array = ['cat', 'mouse', 'rabbit']
      result = {0 => 'cat', 1 => 'mouse', 2 => 'rabbit'}
      it 'should execute the block condition on each element with its index' do
        array.my_each_with_index { |pet, idx| hash[idx] = pet}
        expect(hash).to eq(result)
      end

      it 'should return same object' do
        expect(arr.my_each_with_index {|ele, idx| ele}).to eq(arr) 
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
        expect(arr.my_select {false}).to be_empty
      end
    end

    describe '#my_all? method' do

      context 'when block is given' do
        it 'should return true if all elements return true' do
          expect(arr.my_all? {|ele| ele.is_a?(Integer)}).to be true
        end

        it 'should return false if any element returns false' do
          array1 = [1, 2, 'doja cat', 8]
          expect(array1.my_all? {|ele| ele.is_a?(Integer)}).to be false
        end
      end

      context 'when parameter is given' do
        it 'should return true if all elements match given parameter' do
          expect(arr.my_all?(Integer)).to be true
        end

        it 'should return true if all elements match regex' do
          expect(['x', 'y', 'z'].my_all?(/[a-zA-Z]/)).to be true
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
          expect(arr.my_any? {|ele| ele.is_a?(Integer)}).to be true 
        end

        it 'should return false if all elements return false' do
          expect(arr.my_any? { |ele| ele.is_a?(String)}).to be false
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
          expect(arr.my_none? {|ele| ele.is_a?(Float)}).to be true 
        end

        it 'should return false if any element returns true' do
          array = [45, 22, 4.9, 120]
          expect(array.my_none? {|ele| ele.is_a?(Float)}).to be false
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
          expect(['q', 'n', 't', 'w'].my_none?(/[0-9]/)).to be true
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

    end

  end


  





end
