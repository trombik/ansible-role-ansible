require "spec_helper"
require "serverspec"

package = case os[:family]
          when "freebsd"
            "sysutils/ansible"
          else
            "ansible"
          end

describe package(package) do
  it { should be_installed }
end

describe command "ansible --version" do
  its(:stdout) { should match(/ansible \d+\.\d+\.\d+/) }
  its(:stderr) { should eq "" }
  its(:exit_status) { should eq 0 }
end
