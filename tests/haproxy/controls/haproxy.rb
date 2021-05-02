# copyright: 2018, The Authors

title "Check HAproxy Service Status"

control "HAProxy Config File Status" do                       
  impact 0.9                               
  title "HAProxy config file is created"       
  desc "Ensures the HAProxy Service is not impacted with the changes made"
  describe file("/etc/haproxy/haproxy.cfg") do
    its('type') { should cmp 'file' }
    it { should be_file }
  end
end

control "HAProxy service status" do                       
  impact 0.9                               
  title "HAProxy Service is running"       
  desc "Ensures the HAProxy Service is not impacted with the changes made"
  describe service("haproxy.service") do                
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
