require 'sequel_erd/version'
require 'graphviz'

module Sequel
  module Erd
    def self.create

      graph = GraphViz::new('sequel',{:concentrate => true, :normalize => true} )
      graph.node["shape"] = "plaintext"
      graph.edge[:fontname] = graph.node[:fontname] = 'Arial, Helvetica, SansSerif'

      models = Sequel::Model.descendants - Sequel::Model::ANONYMOUS_MODEL_CLASSES.values
      file_path = File.expand_path("sequel_erd/template/sequel.erb", File.dirname(__FILE__))
      erb_template = File.read( file_path )
      template = ERB.new( erb_template, 0, '-' )

      arr = []
      models.each do |db_models|
        db_models.all_association_reflections.each_with_object([]) do |assoc|
          arr << { :title => db_models.to_s, :model => assoc[:model].to_s, :type => assoc[:type].to_s, :db_models => db_models, :from => db_models.to_s, :to => assoc[:class_name].to_s }
        end
      end

      arr.uniq{ |s| s.values_at(:model, :type) }.map do |a|
        graph.add_nodes( a[:title], "label" => "<#{template.result( binding )}>")
        graph.add_edges( a[:from], a[:to] )
      end

      graph.output( :path => '.', :png => 'sequel_erd.png' )
    end
  end
end
