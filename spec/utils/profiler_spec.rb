require 'spec_helper'

describe Profiler do
  describe '.process' do
    context 'when processing data' do
      let(:locals_rows) do
        [
          Row.new('00m10s', 'MOVEL'),
          Row.new('00m10s', 'MOVEL'),
          Row.new('00m10s', 'MOVEL'),
          Row.new('00m10s', 'MOVEL')
        ]
      end

      let(:long_distance_rows) do
        [
          Row.new('00m10s', 'MOVEL'),
          Row.new('00m10s', 'MOVEL'),
          Row.new('00m10s', 'MOVEL'),
          Row.new('00m10s', 'MOVEL')
        ]
      end

      let(:sms_rows) do
        [
          Row.new('', ''),
          Row.new('', ''),
          Row.new('', ''),
          Row.new('', '')
        ]
      end

      let(:internet_rows) do
        [
          Row.new('10 KB', ''),
          Row.new('10 KB', ''),
          Row.new('10 KB', ''),
          Row.new('10 KB', '')
        ]
      end

      let(:data) do
        {
          locals: locals_rows,
          long_distance: long_distance_rows,
          sms: sms_rows,
          internet: internet_rows
        }
      end

      subject { described_class.new(data).process }

      it 'calculates all values correctly' do
        expect(subject.sms).to eq(4)
        expect(subject.internet).to eq(40)
        expect(subject.locals[:cellphone]).to eq('00:00:40')
        expect(subject.long_distance[:cellphone]).to eq('00:00:40')
      end
    end
  end
end
