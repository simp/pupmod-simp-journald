require 'spec_helper_acceptance'

test_name 'journald class'

describe 'journald class' do
  let(:manifest) {
    <<-EOS
      include '::journald'
    EOS
  }

  context 'with defaults' do

    # Using puppet_apply as a helper
    it 'should work with no errors' do
       apply_manifest(manifest, :catch_failures => true)
    end

    it 'should be idempotent' do
      apply_manifest(manifest, {:catch_changes => true})
    end

    describe service('systemd-journald') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

  end
end

