include_recipe "apt"

apt_repository "musicbrainz" do
  uri "http://ppa.launchpad.net/metabrainz/musicbrainz-server/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "D58E52C99814760488A38D87E3446F96A3FB3557"
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
