require 'yaml'
require 'json'
require 'ostruct'

# Load the yaml file into a hash
language_hash = YAML.load_file(File.join(File.dirname(__FILE__), '../data/language.yml'))

# Convert the nested hash to nested openstruct and freeze the final object
$language = JSON.parse(language_hash.to_json, object_class: OpenStruct).freeze