include_recipe "apt"
include_recipe "zookeeper::default"
# For some reason this file is not created by the cookbook
# and zookeeper crashes without it
file "/var/lib/zookeeper/myid" do
	content "#{node['kafka-cluster']['zookeeper_id']}"
end
config_hash = {
	clientPort: 2181,
	dataDir: "/var/lib/zookeeper",
	tickTime: 2000,
	"autopurge.purgeInterval" => 24,
	initLimit: 10, # Required for clustering
	syncLimit: 5, # Required for clustering
	"server.1" => "192.168.17.211:2888:3888", # Required for clustering
	"server.2" => "192.168.17.212:2888:3888", # Required for clustering
	"server.3" => "192.168.17.213:2888:3888" # Required for clustering
}
link "/opt/zookeeper/current" do
	to "/opt/zookeeper/zookeeper-3.4.6"
end
zookeeper_config '/opt/zookeeper/current/conf/zoo.cfg' do
  config config_hash
  user   'zookeeper'
  action :render
end

include_recipe "zookeeper::service"