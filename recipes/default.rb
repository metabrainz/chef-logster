include_recipe "apt"

apt_repository "kiall" do
  uri "http://ppa.launchpad.net/kiall/logster/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "6FD8098A15B1106C229A7A029B9566D4DFA62498"
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
