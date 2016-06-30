require 'spec_helper'

describe Parser do
  describe '#parse!' do
    subject { described_class.new(options).parse! }

    context 'when options is empty' do
      let(:options) { [] }

      it 'returns no arguments error message' do
        expect { subject }.to raise_error SystemExit
      end
    end

    context 'when options are incomplete' do
      let(:options) { ['file.extension'] }

      it 'returns no arguments error message' do
        expect { subject }.to raise_error SystemExit
      end
    end

    context 'when options are invalid' do
      let(:options) { ['invalid_file', 'invalid_number'] }

      it 'returns no arguments error message' do
        expect { subject }.to raise_error SystemExit
      end
    end

    context 'when options are valid' do
      let(:options) { ['file.extension', '000-0000-0000'] }
      let(:result) { { file_name: options.first, phone_number: options.last } }

      it 'returns no arguments error message' do
        expect(subject).to eq result
      end
    end
  end
end
