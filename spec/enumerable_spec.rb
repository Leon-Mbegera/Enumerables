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





end
