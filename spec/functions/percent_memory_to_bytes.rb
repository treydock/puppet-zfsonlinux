require 'spec_helper'

describe 'percent_memory_to_bytes' do
  it 'should exist' do
    expect(Puppet::Parser::Functions.function('percent_memory_to_bytes')).to eq('function_percent_memory_to_bytes')
  end

  context 'when memorysize_mb => 100' do
    let(:facts) {{ :memorysize_mb => '100' }}

    it 'should return 25% of memorysize in bytes' do
      is_expected.to run.with_params('25').and_return(25 * 1024**2)
    end

    it 'should return 50% of memorysize in bytes' do
      is_expected.to run.with_params(50).and_return(50 * 1024**2)
    end
  end

  it 'should raise a ParseError if there is not 1 argument' do
    is_expected.to run.with_params().and_raise_error(/wrong number of arguments/)
  end
  
  it 'should raise a ParseError if argument is not between 0 and 100' do
    is_expected.to run.with_params('101').and_raise_error(/Requires a valid integer/)
  end

  it 'should raise a ParseError if argument is not a valid integer' do
    is_expected.to run.with_params('50.5').and_raise_error(/Requires a valid integer/)
  end

  it 'should raise a ParseError if argument is a string' do
    is_expected.to run.with_params('foo').and_raise_error(/Requires a valid integer/)
  end
end
