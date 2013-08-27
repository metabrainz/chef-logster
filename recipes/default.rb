include_recipe "apt"

apt_repository "kiall" do
  uri "http://ppa.launchpad.net/kiall/logster/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
end

package "logtail"
package "logster"

user "logster" do
    action :create
end

directory "/var/log/logster" do
    action :create
    user "logster"
end
