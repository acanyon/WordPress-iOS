require 'pry' # todo -- remove

begin
    require 'rubygems'
rescue Exception => e
    abort 'Err. Install rubygems before continuing. http://http://rubygems.org/pages/download'
end

begin
    gem 'nokogiri', '~> 1.6.3'
    require 'nokogiri'
rescue Exception => e
    puts 'Nokogiri is not installed. Installing...'
    # todo -- write me
end

class TagNibFiles

    def initialize(filepath)
        @filepath = filepath
        @filename = File.basename(@filepath)
        @changed = false
    end

    def tag_file()
        nib_dom = Nokogiri::XML(File.open(@filepath))
        nib_dom.xpath('//view').each do |view_node|
            self.tag_new_node(nib_dom, view_node)
        end
        nib_dom.xpath('//subviews').each do |subviews|
            subviews.element_children.each do |element|
                self.tag_new_node(nib_dom, element)
            end
        end

        if @changed
            File.open(@filepath, 'w') { |f| f.print(nib_dom.to_xml(indent: 4)) } # TODO -- the indent isnt working
            @changed = false
        end
    end

    @private

    def tag_new_node(nib_dom, node)
        nodeid = node.attr 'id'
        return if nodeid.nil? || nodeid.length == 0
        nodename = node.name
        mixpanel_id = "mp-#{@filename}-#{nodename}-#{nodeid}"

        user_defined_attrs = node.xpath('userDefinedRuntimeAttributes').first
        if user_defined_attrs.nil?
            user_defined_attrs = Nokogiri::XML::Node.new('userDefinedRuntimeAttributes', nib_dom)
            node.add_child(user_defined_attrs)
        end

        if user_defined_attrs.xpath('userDefinedRuntimeAttribute[@keyPath="mixpanel_id"]').first.nil?
            mixpanelid_attr_node = Nokogiri::XML::Node.new('userDefinedRuntimeAttribute', nib_dom)
            mixpanelid_attr_node.set_attribute('keyPath', 'mixpanel_id')
            mixpanelid_attr_node.set_attribute('type', 'string')
            mixpanelid_attr_node.set_attribute('value', mixpanel_id)
            user_defined_attrs.add_child(mixpanelid_attr_node)
            @changed = true
        end
    end

end

def get_files(project_root)
    return Dir.glob("#{project_root}/**/*{.storyboard,.xib}") || []
end


# main

project_root = ENV['SRCROOT'] || Dir.pwd
xib_files = get_files(project_root)
xib_files.each do |filepath|
    file_tagger = TagNibFiles.new filepath
    file_tagger.tag_file
end
