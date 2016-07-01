require 'spec_helper'

describe Mapper do
  describe '.map' do
    subject { described_class.new(filename, '0').map }

    context 'when non existing file is provided' do
      let(:filename) { 'invalid' }

      it 'raises error' do
        expect { subject }.to raise_error(RuntimeError, 'File not found')
      end
    end

    context 'when existing file is provided' do
      let(:filename) { File.join(Dir.pwd, 'spec', 'test.csv') }

      it 'maps correctly' do
        result = subject

        expect(result[:locals].count).to eq 5
        expect(result[:long_distance].count).to eq 0
        expect(result[:sms].count).to eq 0
        expect(result[:internet].count).to eq 0
      end
    end
  end
end
