require 'spec_helper'

describe Row do
  describe '.initialize' do
    subject { described_class.new(value, nil) }

    context 'when value is valid' do
      let(:value) { '10m60s' }

      it 'initializes object correctly' do
        expect(subject.total).to eq 660
      end

      context 'when value is kb format' do
        let(:value) { '10jxxx' }

        it 'initializes object correctly' do
          expect(subject.total).to eq 10
        end
      end
    end

    context 'when value is nil' do
      let(:value) { nil }

      it 'initializes object correctly' do
        expect(subject.total).to eq 1
      end
    end

    context 'when value is empty string' do
      let(:value) { '' }

      it 'initializes object correctly' do
        expect(subject.total).to eq 1
      end
    end
  end
end
