require 'redcarpet'
AutoHtml.add_filter(:redcarpet).with(:renderer => Redcarpet::Render::HTML, :markdown_options => {}) do |text, options|
  renderer_options = {:link_attributes => {}}

  # Target _blank should be included in renderer options
  if options[:target]
    renderer_options[:link_attributes][:target] = options.delete(:target)
  end

  renderer = options[:renderer].new(renderer_options)
  Redcarpet::Markdown.new(renderer, options[:markdown_options]).render(text)
end
