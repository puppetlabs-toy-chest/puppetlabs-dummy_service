require 'spec_helper_acceptance'

describe 'dummy_service' do
  context 'installation' do
    before(:all) do
      @pp = <<-EOS
        include 'dummy_service'
        service { 'non-existent': ensure => running }
      EOS
      @result = apply_manifest_with_exit(@pp)
    end

    it 'should run with changes and no errors' do
      expect(@result.exit_code).to eq 2
    end

    it 'should run a second time without changes' do
      result = apply_manifest_on_with_exit(get_working_node, @pp)
      expect(result.exit_code).to eq 0
    end
  end
end
