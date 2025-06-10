class HtmlBuilder
  def initialize(&block)
    @html = ""
    instance_eval(&block) if block_given?
  end

  def div(content = nil, &block)
    if block_given?
      @html << "<#{__method__}>#{content}"
      instance_eval(&block)
      @html << "</#{__method__}>#{content}\n"
    else
      @html << "<div>#{content}</div>\n"
    end
  end

  def span(content)
    @html << "<span>#{content}</span>\n"
  end

  def result
    @html
  end
end

builder = HtmlBuilder.new do
  div do
    div "Conteúdo em div"
    span "Nota em div"
  end
  span "Nota de rodapé"
end

puts builder.result