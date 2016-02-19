# kafka-cluster-cookbook

I am trying to get a better grasp of the distributed, partitioned message queue called Kafka.  This cookbook is a prototype cluster setup for me to play with and gain a stronger understanding on the subject.


## Supported Platforms
Only tested with:

 * Ubuntu 14.04


## Usage

### kafka-cluster::default

Include `kafka-cluster` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[kafka-cluster::default]"
  ]
}
```

## License and Authors

Author:: Daniel Klopp (<YOUR_EMAIL>)
