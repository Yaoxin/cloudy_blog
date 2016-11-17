require 'markdown'

class Article < ApplicationRecord
  def content_html
    self.class.render_html(self.content)
  end

  def self.render_html(content)
    rd = CodeHTML.new
    md = Redcarpet::Markdown.new(rd, autolink: true, fenced_code_blocks: true)
    md.render(content)
  end
end
