# vim: syn=inspec

# Inspec test for recipe centos_base::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'centos_base-baseline' do
  title 'Baseline'
  impact 0.1
  desc <<-EOH
    Baseline for CentOS images in the cloud
  EOH

  describe user('root') do
    it { should exist }
  end
end
