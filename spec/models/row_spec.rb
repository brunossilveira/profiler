require 'spec_helper'

describe Row do
  describe '.initialize' do
    subject { described_class.new(value) }

    context 'when value is valid' do
      let(:value) { '10m60s' }

      it 'initializes object correctly' do
        expect(subject.minutes).to eq '10'
        expect(subject.seconds).to eq '60'
      end
    end

    context 'when value is not valid' do
      context 'when value is nil' do
        let(:value) { nil }

        it 'initializes object correctly' do
          expect(subject.minutes).to eq '00'
          expect(subject.seconds).to eq '00'
        end
      end

      context 'when value is empty string' do
        let(:value) { '' }

        it 'initializes object correctly' do
          expect(subject.minutes).to eq '00'
          expect(subject.seconds).to eq '00'
        end
      end

      context 'when value is wrong format' do
        let(:value) { '10jxxx' }

        it 'initializes object correctly' do
          expect(subject.minutes).to eq '00'
          expect(subject.seconds).to eq '00'
        end
      end
    end
  end

  describe '.total_in_seconds' do
    subject { described_class.new(value).total_in_seconds }

    context 'when value is valid' do
      let(:value) { '10m60s' }

      it 'returns total correctly' do
        expect(subject).to eq(660)
      end
    end

    context 'when value is not valid' do
      let(:value) { '20askd' }

      it 'returns zero' do
        expect(subject).to eq(0)
      end
    end
  end
end
