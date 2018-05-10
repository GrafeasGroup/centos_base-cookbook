# vim: syn=inspec

admin_users = attribute('admin_users', default: [], description: 'Default set of admins')

control 'centos_base-administration' do
  title 'Administration settings'
  impact 0.1
  desc <<-EOH
    Administrative account settings
  EOH
  only_if { !admin_users.empty? }

  admin_users.each do |adm|
    describe user(adm['username']) do
      it { should exist }
      its('groups') { should include 'sudo' }
    end

    describe directory("/home/#{adm['username']}") do
      it { should exist }
      it { should be_owned_by adm['username'] }
    end

    describe file("/home/#{adm['username']}/.ssh/authorized_keys") do
      it { should exist }
      it { should be_owned_by adm['username'] }
      it { should be_allowed('read', by_user: adm['username']) }
      it { should be_allowed('write', by_user: adm['username']) }
      it { should_not be_allowed('execute', by_user: adm['username']) }

      unless adm['username'] == 'vagrant'
        it { should_not be_allowed('read', by_user: 'vagrant') }
        it { should_not be_allowed('write', by_user: 'vagrant') }
        it { should_not be_allowed('execute', by_user: 'vagrant') }
      end

      its('content') { should include adm['public_key'] }
    end
  end
end
